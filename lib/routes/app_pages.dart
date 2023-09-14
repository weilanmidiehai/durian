import 'package:get/get.dart';

import '../caseList/fan_chart/index.dart';
import '../caseList/flip_card.dart';
import '../caseList/gmail_verification_code.dart';
import '../caseList/img.dart';
import '../caseList/pdf/pdf_view.dart';
import '../navigation_Page.dart';

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
  ];
}
