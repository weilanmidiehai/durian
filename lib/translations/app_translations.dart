import 'package:get/get.dart';

import 'i18n/en_us.dart';
import 'i18n/zh_cn.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUs,
        'zh_CN': zhCn,
      };
}
