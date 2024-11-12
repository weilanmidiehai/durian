import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'screen/caseList/carousel/carousel.dart';
import 'screen/hy/hy_index.dart';
import 'screen/my.dart';
import 'screen/view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (3)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        'assets/splash_lottie.json',
        controller: _controller,
        height: MediaQuery.of(context).size.height * 1,
        animate: true,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(
                () => Get.off(() => const BottomNavigationPage()));
        },
      ),
    );
  }
}

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _RootPageState();
}

class _RootPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0; // 用作被选中的 Tab 的索引号
  final List _tabPages = [
    HomePage(),
    const HyIndex(),
    Carousel(),
    const MyProfile(),
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
        unselectedItemColor: Colors.grey,
        // 设置未被选中时的图标颜色
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: 'home'.tr),
          BottomNavigationBarItem(
              icon: const Icon(Icons.flutter_dash), label: 'hy'.tr),
          const BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: '通讯录'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person), label: 'account'.tr),
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
