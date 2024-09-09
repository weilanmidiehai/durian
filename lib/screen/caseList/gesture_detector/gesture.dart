import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Gesture extends StatefulWidget {
  const Gesture({super.key});

  @override
  State<Gesture> createState() => _GestureState();
}

class _GestureState extends State<Gesture> {
  String _operation = "No Gesture detected!"; //保存事件名

  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  double _left1 = 0.0; //距左边的偏移
  double _imageWidth = 200.0; //通过修改图片宽度来达到缩放效果
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("手势识别"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const Text(
                '通过GestureDetector对Container进行手势识别，触发相应事件后，在Container上显示事件名'),
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                color: Colors.pink[200],
                width: MediaQuery.sizeOf(context).width,
                height: 50.0,
                child: Text(
                  _operation,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              onTap: () => updateText("Tap"), //点击
              onDoubleTap: () => updateText("DoubleTap"), //双击
              onLongPress: () => updateText("LongPress"), //长按
            ),
            const Text(
                'GestureDetector对于拖动和滑动事件是没有区分的，他们本质上是一样的。GestureDetector会将要监听的组件的原点（左上角）作为本次手势的原点，当用户在监听的组件上按下手指时，手势识别就会开始。下面是一个拖动圆形字母A的示例'),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.green[100],
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: _top,
                    left: _left,
                    child: GestureDetector(
                      child: const CircleAvatar(child: Text("A")),
                      //手指按下时会触发此回调
                      onPanDown: (DragDownDetails e) {
                        //打印手指按下的位置(相对于屏幕)
                       debugPrint("用户手指按下：${e.globalPosition}");
                      },
                      //手指滑动时会触发此回调
                      onPanUpdate: (DragUpdateDetails e) {
                        //用户手指滑动时，更新偏移，重新构建
                        setState(() {
                          _left += e.delta.dx;
                          _top += e.delta.dy;
                        });
                      },
                      onPanEnd: (DragEndDetails e) {
                        //打印滑动结束时在x、y轴上的速度
                        debugPrint('${e.velocity}');
                      },
                    ),
                  )
                ],
              ),
            ),
            const Text('单一方向拖动,GestureDetector可以只识别特定方向的手势事件，将上面的例子改为只能沿水平方向拖动：'),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: Colors.lime[100],
              height: 40,
              child:
              Stack(
                children: <Widget>[
                  Positioned(
                    left: _left1,  // 使用 left 来控制水平位置
                    child: GestureDetector(
                      child: const CircleAvatar(child: Text("B")),
                      // 水平方向拖动事件
                      onHorizontalDragUpdate: (DragUpdateDetails details) {
                        setState(() {
                          _left1 += details.delta.dx;  // 水平移动
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            const Text('GestureDetector可以监听缩放事件，下面演示了一个简单的图片缩放效果：'),
            Container(margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                GestureDetector(
                  //指定宽度，高度自适应
                  child: Image.asset("assets/lily.png", width: _imageWidth),
                  onScaleUpdate: (ScaleUpdateDetails details) {
                    setState(() {
                      //缩放倍数在0.8到10倍之间
                      _imageWidth=200*details.scale.clamp(.8, 10.0);
                    });
                  },
                ),
              ],
            ),
            ),
            const Text('要给一段富文本（RichText）的不同部分分别添加点击事件处理器，但是TextSpan并不是一个widget，这时我们不能用GestureDetector，但TextSpan有一个recognizer属性，它可以接收一个GestureRecognizer。')
,
            Container(margin: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(text: "你好世界"),
                      TextSpan(
                        text: "点我变色",
                        style: TextStyle(
                          fontSize: 30.0,
                          color: _toggle ? Colors.green : Colors.yellow,
                        ),
                        recognizer: _tapGestureRecognizer
                          ..onTap = () {
                            setState(() {
                              _toggle = !_toggle;
                            });
                          },
                      ),
                      const TextSpan(text: "你好世界"),
                    ],
                  ),
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
