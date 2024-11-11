import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widget/gaussian_as_foreground.dart';

class GaussianBlur extends StatelessWidget {
  const GaussianBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BackdropFilterPageState'),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const GaussianAsForeground());
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
              'https://img2.baidu.com/it/u=1656822644,2893438503&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=1084',
              fit: BoxFit.cover),
          const Center(
            child: BlurRectWidget(
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'BackdropFilter class',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      'A widget that applies a filter to the existing painted content and then paints child.'
                      'The filter will be applied to all the area within its parent or ancestor widget\'s clip. If there\'s no clip, the filter will be applied to the full screen.',
                      style: TextStyle(fontSize: 14, color: Colors.white70),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 150),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                BlurOvalWidget(
                  IconButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      //   return BlurImagePage();
                      // }));
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: BlurOvalWidget(
                    Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                const BlurOvalWidget(
                  Icon(
                    Icons.bookmark,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BlurRectWidget extends StatelessWidget {
  final Widget widget;
  final double padding;

  const BlurRectWidget(this.widget, {super.key, this.padding = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20,
          ),
          child: Container(
            color: Colors.white10,
            padding: EdgeInsets.all(padding),
            child: widget,
          ),
        ),
      ),
    );
  }
}

class BlurOvalWidget extends StatelessWidget {
  final Widget widget;
  final double padding;

  const BlurOvalWidget(this.widget, {super.key, this.padding = 10});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
        ),
        child: Container(
          color: Colors.white10,
          padding: EdgeInsets.all(padding),
          child: widget,
        ),
      ),
    );
  }
}
