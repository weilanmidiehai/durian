import 'package:flutter/material.dart';

class BottomAppBarDemo extends StatefulWidget {
  const BottomAppBarDemo({super.key});

  @override
  State<BottomAppBarDemo> createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  int _selectedTab = 0;

  void _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  final List _pages = []; // 底部导航栏各个可切换页面组

  @override
  void initState() {
    super.initState();

    _pages
      ..add(Container(
        color: Colors.yellow.shade100,
        alignment: Alignment.center,
        child: const Text(
          'Home',
          style: TextStyle(fontSize: 40),
        ),
      ))
      ..add(Container(
        color: Colors.purple.shade100,
        alignment: Alignment.center,
        child: const Text(
          'Feed',
          style: TextStyle(fontSize: 40),
        ),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.fromLTRB(0, 6, 0, 6),
        notchMargin: 5.0,
        height: 70,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () => _changeTab(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 3),
                    child: Icon(Icons.home,
                        color: _selectedTab == 0 ? Colors.orange : Colors.grey),
                  ),
                  Text(
                    '主页',
                    style: TextStyle(
                        color: _selectedTab == 0 ? Colors.orange : Colors.grey),
                  )
                ],
              ),
            ),

            const SizedBox(), // 增加一些间隔

            InkWell(
              onTap: () => _changeTab(1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 3),
                    child: Icon(Icons.person,
                        color: _selectedTab == 1 ? Colors.orange : Colors.grey),
                  ),
                  Text(
                    '11',
                    style: TextStyle(
                        color: _selectedTab == 1 ? Colors.orange : Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.qr_code_2,
          color: Colors.white,
          size: 36,
        ),
      ),
      // 设置 floatingActionButton 在底部导航栏中间
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
