

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

/// The demo page for [SharedAxisPageTransitionsBuilder].
class SharedAxisTransitionDemo extends StatefulWidget {
  /// Creates the demo page for [SharedAxisPageTransitionsBuilder].
  const SharedAxisTransitionDemo({super.key});

  @override
  State<SharedAxisTransitionDemo> createState() {
    return _SharedAxisTransitionDemoState();
  }
}

class _SharedAxisTransitionDemoState extends State<SharedAxisTransitionDemo> {
  SharedAxisTransitionType? _transitionType =
      SharedAxisTransitionType.horizontal;
  bool _isLoggedIn = false;

  void _updateTransitionType(SharedAxisTransitionType? newType) {
    setState(() {
      _transitionType = newType;
    });
  }

  void _toggleLoginStatus() {
    setState(() {
      _isLoggedIn = !_isLoggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('共享轴 ')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageTransitionSwitcher(
                reverse: !_isLoggedIn,
                transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    ) {
                  return SharedAxisTransition(
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: _transitionType!,
                    child: child,
                  );
                },
                child: _isLoggedIn ? _CoursePage() : _SignInPage(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _isLoggedIn ? _toggleLoginStatus : null,
                    child: const Text('BACK'),
                  ),
                  ElevatedButton(
                    onPressed: _isLoggedIn ? null : _toggleLoginStatus,
                    child: const Text('NEXT'),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 2.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<SharedAxisTransitionType>(
                  value: SharedAxisTransitionType.horizontal,
                  groupValue: _transitionType,
                  onChanged: (SharedAxisTransitionType? newValue) {
                    _updateTransitionType(newValue);
                  },
                ),
                const Text('X'),
                Radio<SharedAxisTransitionType>(
                  value: SharedAxisTransitionType.vertical,
                  groupValue: _transitionType,
                  onChanged: (SharedAxisTransitionType? newValue) {
                    _updateTransitionType(newValue);
                  },
                ),
                const Text('Y'),
                Radio<SharedAxisTransitionType>(
                  value: SharedAxisTransitionType.scaled,
                  groupValue: _transitionType,
                  onChanged: (SharedAxisTransitionType? newValue) {
                    _updateTransitionType(newValue);
                  },
                ),
                const Text('Z'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        Text(
          '简化您的课程',
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            '捆绑的类别在您的 Feed 中显示为组. '
                '您以后可以随时更改此设置.',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const _CourseSwitch(course: '工艺品'),
        const _CourseSwitch(course: '商业'),
        const _CourseSwitch(course: '插图'),
        const _CourseSwitch(course: '设计'),
        const _CourseSwitch(course: '烹饪'),
      ],
    );
  }
}

class _CourseSwitch extends StatefulWidget {
  const _CourseSwitch({
    required this.course,
  });

  final String course;

  @override
  _CourseSwitchState createState() => _CourseSwitchState();
}

class _CourseSwitchState extends State<_CourseSwitch> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    final String subtitle = _value ? '捆绑式' : '单独显示';
    return SwitchListTile(
      title: Text(widget.course),
      subtitle: Text(subtitle),
      value: _value,
      onChanged: (bool newValue) {
        setState(() {
          _value = newValue;
        });
      },
    );
  }
}

class _SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double maxHeight = constraints.maxHeight;
        return Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 20)),
            Image.asset(
              'assets/logo.png',
              width: 80,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
            Text(
              'Hi David Park',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
            const Text(
              '使用您的帐户登录',
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 40.0,
                    left: 15.0,
                    right: 15.0,
                    bottom: 10.0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.visibility,
                        size: 20,
                        color: Colors.black54,
                      ),
                      isDense: true,
                      labelText: '电子邮件或电话号码',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('忘记电子邮件?'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('创建账户'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}