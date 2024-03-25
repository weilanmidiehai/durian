import 'package:get/get.dart';
import '../navigation_Page.dart';
import '../screen/caseList/animations/index.dart';
import '../screen/caseList/fan_chart/index.dart';
import '../screen/caseList/flip_card.dart';
import '../screen/caseList/gmail_verification_code.dart';
import '../screen/caseList/img.dart';
import '../screen/caseList/pdf/pdf_view.dart';
import '../screen/caseList/time_picker.dart';
import '../screen/date_selection/index.dart';
import '../screen/guide/guide_index.dart';

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
    GetPage(name: '/TimePicker', page: () => const TimePicker()),
    GetPage(name: '/DateSelection', page: () => const DateSelection()),
  ];
}
