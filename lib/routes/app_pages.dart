import 'package:get/get.dart';
import '../navigation_page.dart';
import '../screen/caseList/animations/index.dart';
import '../screen/caseList/bezier/bezier_curve.dart';
import '../screen/caseList/gesture_detector/gesture.dart';
import '../screen/caseList/http/http.dart';
import '../screen/caseList/icon/index.dart';
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

class AppPages {
  AppPages._();

  static const initial = '/';
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/FanChart', page: () => FanChart()),
    GetPage(name: '/PdfView', page: () => const PdfView()),
    GetPage(
        name: '/GmailVerificationCode',
        page: () => const GmailVerificationCode()),
    GetPage(name: '/Img', page: () => const Img()),
    GetPage(name: '/FlipCard', page: () => const FlipCard()),
    GetPage(
        name: '/TransitionsHomePage', page: () => const TransitionsHomePage()),
    GetPage(name: '/GuideIndex', page: () => const GuideIndex()),
    GetPage(name: '/SliverAppBar', page: () => const SliverAppBarPage()),
    GetPage(name: '/DateSelection', page: () => const DateSelection()),
    GetPage(name: '/StateManagement', page: () => const StateManagement()),
    GetPage(name: '/Carousel', page: () => Carousel()),
    GetPage(name: '/Table', page: () => const Table()),
    GetPage(name: '/Navigation', page: () => const NavigationIndex()),
    GetPage(name: '/BottomAppBarDemo', page: () => const BottomAppBarDemo()),
    GetPage(name: '/BezierCurve', page: () => const BezierCurve()),
    GetPage(name: '/Material3Color', page: () => const Material3Color()),
    GetPage(name: '/GestureDetector', page: () => const Gesture()),
    GetPage(name: '/HTTP', page: () => const HTTP()),
    GetPage(name: '/Icon', page: () => const IconIndex()),
  ];
}
