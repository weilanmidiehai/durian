import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CTest2(),
    );
  }
}

class CTest2 extends StatefulWidget {
  @override
  _CTest2State createState() => _CTest2State();
}

class _CTest2State extends State<CTest2> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
      // 当页面到达最后一页时，手动滚动到第一页
      if (_currentPage == 2) {
        _pageController.animateToPage(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < 2) {
        _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swiper'),
      ),
      body: Center(
        child: SizedBox(
          height: 200.0,
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Center(
                  child: Text('Page 1', style: TextStyle(color: Colors.white, fontSize: 24.0)),
                ),
              ),
              Container(
                color: Colors.blue,
                child: Center(
                  child: Text('Page 2', style: TextStyle(color: Colors.white, fontSize: 24.0)),
                ),
              ),
              Container(
                color: Colors.green,
                child: Center(
                  child: Text('Page 3', style: TextStyle(color: Colors.white, fontSize: 24.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
