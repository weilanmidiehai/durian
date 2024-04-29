import 'package:get/get.dart';
import '../navigation_page.dart';
import '../screen/caseList/animations/index.dart';
import '../screen/caseList/carousel/carousel.dart';
import '../screen/caseList/date_selection/index.dart';
import '../screen/caseList/fan_chart/index.dart';
import '../screen/caseList/flip_card.dart';
import '../screen/caseList/gmail_verification_code.dart';
import '../screen/caseList/guide/guide_index.dart';
import '../screen/caseList/img.dart';
import '../screen/caseList/pdf/pdf_view.dart';
import '../screen/caseList/rx_inherited_provider.dart';
import '../screen/caseList/table/table.dart';
import '../screen/caseList/time_picker.dart';

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
    GetPage(name: '/RXProvider', page: () => const RXProvider()),
    GetPage(name: '/Carousel', page: () => Carousel()),
    GetPage(name: '/Table', page: () => const Table()),
  ];
}
