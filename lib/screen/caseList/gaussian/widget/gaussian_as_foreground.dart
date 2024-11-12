import 'dart:ui';

import 'package:flutter/material.dart';

class GaussianAsForeground extends StatefulWidget {
  const GaussianAsForeground({super.key});

  @override
  State<GaussianAsForeground> createState() => _GaussianAsForegroundState();
}

class _GaussianAsForegroundState extends State<GaussianAsForeground> {
  bool isRecharged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(
              'https://ww1.sinaimg.cn/mw690/60ed0cf7ly1hqwrojdyckj21c02yox50.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width),
          Positioned.fill(
              child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: isRecharged ? 0 : 15,
                      sigmaY: isRecharged ? 0 : 15),
                  child: Container(color: Colors.white10))),
          if (!isRecharged)
            ElevatedButton(
                child: const Text('充钱查看更多', style: TextStyle(fontSize: 16)),
                onPressed: () {
                  setState(() {
                    isRecharged = !isRecharged;
                  });
                })
        ],
      ),
    );
  }
}
