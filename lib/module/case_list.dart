import 'package:flutter/material.dart';
import '../navigation_page.dart';
import '../screen/caseList/animations/index.dart';
import '../screen/caseList/bezier/bezier_curve.dart';
import '../screen/caseList/drag_and_drop_sort.dart';
import '../screen/caseList/gaussian/gaussian_blur.dart';
import '../screen/caseList/gesture_detector/gesture.dart';
import '../screen/caseList/http/http.dart';
import '../screen/caseList/icon/index.dart';
import '../screen/caseList/input_chip_page.dart';
import '../screen/caseList/material3_color.dart';
import '../screen/caseList/navigation/bottom_appbar.dart';
import '../screen/caseList/carousel/carousel.dart';
import '../screen/caseList/date_selection/index.dart';
import '../screen/caseList/fan_chart/index.dart';
import '../screen/caseList/flip_card.dart';
import '../screen/caseList/gmail_verification_code.dart';
import '../screen/caseList/guide/guide_index.dart';
import '../screen/caseList/img.dart';
import '../screen/caseList/navigation/index.dart';
import '../screen/caseList/pdf/pdf_view.dart';
import '../screen/caseList/sliver_appbar/sliver_app_bar_page.dart';
import '../screen/caseList/state_management/state_management.dart';
import '../screen/caseList/table/table.dart';
import '../translations/translations.dart';

class RouteConfig {
  static const initial = '/';

  static final List<RouteItem> routes = [
    RouteItem(route: '/', page: () => const SplashScreen(), title: '欢迎页'),
    RouteItem(
        route: '/FanChart', page: () => FanChart(), title: '数据图\n插件：fl_chart'),
    RouteItem(
        route: '/PdfView',
        page: () => const PdfView(),
        title: 'Pdf预览\n插件：flutter_pdfview'),
    RouteItem(
        route: '/GmailVerificationCode',
        page: () => const GmailVerificationCode(),
        title: '邮件发送\n smtp_server'),
    RouteItem(
      route: '/Img',
      page: () => const Img(),
      title: '图片选择\n image_picker',
    ),
    RouteItem(
      route: '/FlipCard',
      page: () => const FlipCard(),
      title: '翻转卡片',
    ),
    RouteItem(
        route: '/TransitionsHomePage',
        page: () => const TransitionsHomePage(),
        title: '动画组件'),
    RouteItem(
        route: '/GuideIndex', page: () => const GuideIndex(), title: '新手引导'),
    RouteItem(
        route: '/SliverAppBar',
        page: () => const SliverAppBarPage(),
        title: 'SliverAppBar樣式'),
    RouteItem(
        route: '/DateSelection',
        page: () => const DateSelection(),
        title: '日期时间选择（弹窗）'),
    RouteItem(
        route: '/StateManagement',
        page: () => const StateManagement(),
        title: '状态管理工具'),
    RouteItem(
      route: '/Carousel',
      page: () => Carousel(),
      title: '轮播图',
    ),
    RouteItem(
      route: '/Table',
      page: () => const TablePage(),
      title: '表格Table',
    ),
    RouteItem(
        route: '/Navigation',
        page: () => const NavigationIndex(),
        title: '导航栏'),
    RouteItem(
        route: '/BottomAppBarDemo',
        page: () => const BottomAppBarDemo(),
        title: '自适应导航（根据屏幕）'),
    RouteItem(
        route: '/BezierCurve',
        page: () => const BezierCurve(),
        title: '曲线绘制（贝塞尔曲线）'),
    RouteItem(
        route: '/Material3Color',
        page: () => const Material3Color(),
        title: 'Material3主题色彩'),
    RouteItem(
      route: '/GestureDetector',
      page: () => const Gesture(),
      title: '手勢識別',
    ),
    RouteItem(
      route: '/HTTP',
      page: () => const HTTP(),
      title: 'HTTP请求',
    ),
    RouteItem(
      route: '/Icon',
      page: () => const IconIndex(),
      title: 'Icon',
    ),
    RouteItem(
        route: '/GaussianBlur',
        page: () => const GaussianBlur(),
        title: '高斯模糊'),
    RouteItem(
        route: '/InputChip',
        page: () => const InputChipPage(),
        title: 'InputChip'),
    RouteItem(
        route: '/Translations',
        page: () => const Translations(),
        title: '全局翻译Translations'),
    RouteItem(
        route: '/DragAndDropSort',
        page: () => const DragAndDropSort(),
        title: '拖拽排序'),
  ];
}

class HomeList {
  HomeList({
    required this.navigateScreen,
    required this.title,
    this.imagePath = 'assets/bg/20.png',
    this.darkImagePath = 'assets/bg/19.png',
  });

  String navigateScreen;
  String imagePath;
  String darkImagePath;
  String title;

  static List<HomeList> homeList = RouteConfig.routes
      .map((item) => HomeList(
            navigateScreen: item.route,
            title: item.title,
          ))
      .toList();
}

class RouteItem {
  final String route;
  final Widget Function() page;
  final String title;

  RouteItem({
    required this.route,
    required this.page,
    required this.title,
  });
}
