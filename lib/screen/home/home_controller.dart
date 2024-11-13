import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  int selectedIndex = 0;

  //多样的列表
  RxBool multiple = RxBool(true);

  AnimationController? animationController;

  static const List<Widget> widgetOptions = <Widget>[
    Text('抽屉选中的：Index 0: Home'),
    Text('抽屉选中的：Index 1: Business'),
    Text('抽屉选中的：Index 2: School')
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
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    animationController?.dispose();
    super.onClose();
  }
}
