import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeLogic extends GetxController {
  int selectedIndex = 0;
  //多样的列表
  RxBool multiple = RxBool(true);
  static const List<Widget> widgetOptions = <Widget>[
    Text(
      '抽屉选中的：Index 0: Home',
    ),
    Text(
      '抽屉选中的：Index 1: Business',
    ),
    Text(
      '抽屉选中的：Index 2: School',
    ),
  ];

  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }

  void setMultiple() {
    multiple.value = !multiple.value;
    update();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
