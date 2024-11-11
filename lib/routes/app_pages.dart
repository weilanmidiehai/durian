import 'package:get/get.dart';

import '../module/case_list.dart';

class AppPages {
  AppPages._();

  static const initial = RouteConfig.initial;

  static final routes = RouteConfig.routes
      .map((item) => GetPage(name: item.route, page: item.page))
      .toList();
}
