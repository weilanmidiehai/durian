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
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.network(
                    'https://img2.baidu.com/it/u=3149270040,1204750431&fm=253&fmt=auto&app=138&f=JPEG?w=655&h=655',
                    fit: BoxFit.cover),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: isRecharged ? 0 : 15,
                      sigmaY: isRecharged ? 0 : 15),
                  child: Container(color: Colors.white10),
                ),
              ),
              if (!isRecharged)
                ElevatedButton(
                  child: const Text(
                    '充钱查看更多',
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    setState(() {
                      isRecharged = !isRecharged;
                    });
                  },
                )
            ],
          )),
    );
  }
}
