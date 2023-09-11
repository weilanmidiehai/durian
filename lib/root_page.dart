import 'package:flutter/material.dart';

import 'home/view.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage>  createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0; // 用作被选中的 Tab 的索引号
  final List _tabPages = [
     HomePage(),
     HomePage(),
     HomePage(),
     HomePage(),
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
        selectedItemColor: const Color(0xff87ba87),
        // 设置被选中时的图标颜色
        unselectedItemColor:   Colors.grey,
        // 设置未被选中时的图标颜色
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '工作室',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: '数据',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: '通讯录',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],

        currentIndex: _selectedIndex,

        onTap: (int index) {
          setState(() {

            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
