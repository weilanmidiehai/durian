import 'package:flutter/widgets.dart';

import '../fan_chart/index.dart';
import '../home/view.dart';
import '../pdf/pdf_view.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    this.title,
  });
  Widget? navigateScreen;
  String imagePath;
  String? title;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/bg/1.png',
      navigateScreen: HRIndex(),
      title: '饼图',
    ),
    HomeList(
      imagePath: 'assets/bg/1.png',
      navigateScreen: const PdfView(),
      title: 'Pdf预览',
    ),
    HomeList(
      imagePath: 'assets/bg/1.png',
      navigateScreen: HomePage(),
      title: '饼图',
    ),
  ];
}
