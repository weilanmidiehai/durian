import 'package:get/get.dart';

import '../caseList/animations/index.dart';
import '../caseList/fan_chart/index.dart';
import '../caseList/flip_card.dart';
import '../caseList/gmail_verification_code.dart';
import '../caseList/img.dart';
import '../caseList/pdf/pdf_view.dart';
import '../caseList/time_picker.dart';
import '../navigation_Page.dart';
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
    GetPage(name: '/TransitionsHomePage', page: () => const TransitionsHomePage()),
    GetPage(name: '/GuideIndex', page: () => const GuideIndex()),
    GetPage(name: '/TimePicker', page: () => const TimePicker()),
  ];
}
