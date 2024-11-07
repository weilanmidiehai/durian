import 'package:flutter/material.dart';

///自定义的状态管理工具
class RxInheritedProvider<T extends ChangeNotifier> extends StatelessWidget {
  final T create;
  final Widget Function(BuildContext context) builder;

  const RxInheritedProvider({
    super.key,
    required this.create,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return RxInheritedWidget(
      value: create,
      child: Builder(builder: (context) => builder(context)),
    );
  }
}

class RxInheritedWidget<T extends ChangeNotifier> extends InheritedNotifier<T> {
  const RxInheritedWidget({
    super.key,
    required T value,
    required super.child,
  }) : super(notifier: value);

  get value => notifier;
}

class ConsumerBuilder<T extends ChangeNotifier> extends StatelessWidget {
  final Widget Function(BuildContext context, T value) builder;

  const ConsumerBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    RxTool.register<T>(context);
    return builder(
      context,
      RxTool.of<T>(context),
    );
  }
}

///提供注册依赖方法
abstract class RxTool {
  static T of<T extends ChangeNotifier>(BuildContext context) {
    return (_getInheritedElement<T>(context).widget as RxInheritedWidget<T>)
        .value;
  }

  static void register<T extends ChangeNotifier>(BuildContext context) {
    var element = _getInheritedElement<T>(context);
    // context.dependOnInheritedElement(element);

    context.dependOnInheritedWidgetOfExactType<RxInheritedWidget<T>>(
        aspect: element.widget);

    //这种方式不产生关联关系
    // context.getElementForInheritedWidgetOfExactType<RxInheritedWidget<T>>();
  }

  static InheritedElement _getInheritedElement<T extends ChangeNotifier>(
      BuildContext context) {
    var element =
        context.getElementForInheritedWidgetOfExactType<RxInheritedWidget<T>>();
    if (element == null) {
      throw (Exception("RxInheritedWidget<${T.runtimeType}> is find null"));
    }
    return element;
  }
}

/// demo 示例
class Counter extends ChangeNotifier {
  int count = 0;
  void increase() {
    ++count;
    notifyListeners();
  }
}

class RXProvider extends StatelessWidget {
  const RXProvider({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RXProvider"),
      ),
      body: RxInheritedProvider(
          create: Counter(),
          builder: (context) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _child(),
                  Builder(builder: (context) {
                    return TextButton(
                        child: const Text("自增"),
                        onPressed: () {
                          RxTool.of<Counter>(context).increase();
                        });
                  }),
                ],
              ),
            );
          }),
    );
  }

  Widget _child() {
    return ConsumerBuilder<Counter>(builder: (context, counter) {
      return Text(
        '点击了 ${counter.count} 次',
        style: const TextStyle(fontSize: 30.0),
      );
    });
  }
}
