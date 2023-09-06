import 'package:flutter/material.dart';

import 'home.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0; // 用作被选中的 Tab 的索引号
  final List _tabPages = [
    const Home(),
    const Home(),
    const Home(),
    const Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12.0,
        // 被选中时的字体大小
        unselectedFontSize: 14.0,
        // 未被选中时的字体大小
        showSelectedLabels: true,
        // 被选中时是否显示Label
        showUnselectedLabels: true,
        // 未被选中时是否显示Label
        enableFeedback: true,
        //点击会产生咔嗒声，长按会产生短暂的振动
        selectedItemColor: Colors.orange,
        // 设置被选中时的图标颜色
        unselectedItemColor: Colors.grey,
        // 设置未被选中时的图标颜色
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 24.0,
            ),
            label: '工作室',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note, size: 24.0),
            label: '数据',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined, size: 24.0),
            label: '通讯录',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24.0),
            label: '我的',
          ),
        ],

        // 设置当前（即被选中时）页面
        currentIndex: _selectedIndex,

        // 当点击其中一个[items]被触发
        onTap: (int index) {
          setState(() {
            /*
             * item 被点中时更改当前索引。
             * 其中，currentIndex 字段设置的值时响应式的
             */
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
