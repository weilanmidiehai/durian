import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_theme.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text(
      'Du',
      style: TextStyle(
        fontSize: 22,
        color: AppTheme.darkText,
        fontWeight: FontWeight.w700,
      ),
    ),),
    body: Column(children: [const Text('data'),ElevatedButton(onPressed: (){}, child: Text('1'))],),
    );
      
     
  }
}
