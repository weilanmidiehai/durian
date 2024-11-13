import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../module/case_list.dart';

class ListViewStyle extends StatelessWidget {
  const ListViewStyle({
    Key? key,
    this.listData,
    this.callBack,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final HomeList? listData;
  final VoidCallback? callBack;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: animation!,
            child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 50 * (1.0 - animation!.value), 0.0),
              child: AspectRatio(
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
                      child: SingleChildScrollView(
                        child: Text(
                          '${listData?.title}',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
