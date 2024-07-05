import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../module/case_list.dart';

class ListViewStyle extends StatelessWidget {
  const ListViewStyle({
    Key? key,
    this.listData,
    this.callBack,
  }) : super(key: key);

  final HomeList? listData;
  final VoidCallback? callBack;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        child: InkWell(
          onTap: callBack,
          child: Container(
            // Container時候的背景
            // color: Colors.pinkAccent,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(context.isDarkMode
                    ? listData!.darkImagePath
                    : listData!.imagePath),
                fit: BoxFit.fill, // 完全填充
              ),
            ),
            child: Center(
              child: Text(
                '${listData?.title}',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
