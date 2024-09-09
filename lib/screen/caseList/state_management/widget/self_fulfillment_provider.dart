import 'dart:collection';

import 'package:flutter/material.dart';

class Item {
  Item(this.price, this.count);

  double price; //商品单价
  int count; // 商品份数
//... 省略其他属性
}

class CartModel extends ChangeNotifier {
  // 用于保存购物车中商品列表
  final List<Item> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice =>
      _items.fold(0, (value, item) => value + item.count * item.price);

  // 将 [item] 添加到购物车。这是唯一一种能从外部改变购物车的方法。
  void add(Item item) {
    _items.add(item);
    // 通知监听器（订阅者），重新构建InheritedProvider， 更新状态。
    notifyListeners();
  }
}

class ProviderRoute extends StatefulWidget {
  const ProviderRoute({super.key});

  @override
  State<ProviderRoute> createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(builder: (context) {
            return Column(
              children: <Widget>[
                // Builder(builder: (context) {
                //   var cart = ChangeNotifierProvider.of<CartModel>(context);
                //   return Text("总价: ${cart.totalPrice}");
                // }),
                Consumer<CartModel>(
                    builder: (context, cart)=> Text("总价: ${cart!.totalPrice}")
                ),

                Builder(builder: (context) {
                  debugPrint("ElevatedButton build"); //在后面优化部分会用到
                  return ElevatedButton(
                    child: const Text("添加商品"),
                    onPressed: () {
                      //给购物车中添加商品，添加后总价会更新
                      // ChangeNotifierProvider.of<CartModel>(context)
                      //     .add(Item(20.0, 1));
                      // listen 设为false，不建立依赖关系
                      ChangeNotifierProvider.of<CartModel>(context, listen: false)
                          .add(Item(20.0, 1));
                    },
                  );
                }),
              ],
            );
          }),
        ),
      ),
    );
  }
}


// 一个通用的InheritedWidget，保存需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  const InheritedProvider({
    super.key,
    required this.data,
    required Widget child,
  }) : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> oldWidget) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}

class ChangeNotifier implements Listenable {
  List listeners = [];

  @override
  void addListener(VoidCallback listener) {
    //添加监听器
    listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    //移除监听器
    listeners.remove(listener);
  }

  void notifyListeners() {
    //通知所有监听器，触发监听器回调
    for (var item in listeners) {
      item();
    }
  }

// ... //省略无关代码
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  const ChangeNotifierProvider({
    super.key,
    required this.data,
    required this.child,
  });

  final Widget child;
  final T data;

  // //定义一个便捷方法，方便子树中的widget获取共享数据
  // static T of<T>(BuildContext context) {
  //   // final type = _typeOf<InheritedProvider<T>>();
  //   final provider =
  //       context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
  //   return provider!.data;
  // }

  //添加一个listen参数，表示是否建立依赖关系
  static T of<T>(BuildContext context, {bool listen = true}) {
    // final type = _typeOf<InheritedProvider<T>>();
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()?.widget
    as InheritedProvider<T>;
    return provider!.data;
  }

  @override
  State<ChangeNotifierProvider<T>> createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}

// 这是一个便捷类，会获得当前context和指定数据类型的Provider
class Consumer<T> extends StatelessWidget {
  const Consumer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(BuildContext context, T? value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context),
    );
  }
}
