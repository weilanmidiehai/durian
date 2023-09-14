import 'dart:math';

import 'package:durian/widget/custom_scaffold.dart';
import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  const FlipCard({
    Key? key,
  }) : super(key: key);

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = Tween(end: 1.0, begin: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '翻转卡片',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform(
            alignment: FractionalOffset.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0008)
              ..rotateY(pi * _animation.value),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: _animation.value <= 0.5 ? front() : back(),
            ),
          ),
        ],
      ),
    );
  }

//  正面
  Widget front() {
    return InkWell(
      onTap: () {
        _controller.forward();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 220,
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/image/1.png',
                      ),
                      fit: BoxFit.fill, // 完全填充
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 15, top: 15),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '11',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: ElevatedButton(
              onPressed: () {
                _controller.forward();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffe7d388),
                minimumSize: const Size(80, 80),
                elevation: 0,
                shape: const CircleBorder(
                    side: BorderSide(color: Color(0xffe7d388))),
              ),
              child: const Icon(
                Icons.qr_code_2,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }

//反面
  Widget back() {
    return InkWell(
      onTap: () {
        _controller.reverse();
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 220,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/image/2.png',
                      ),
                      fit: BoxFit.fill, // 完全填充
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'dreamCard',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: ElevatedButton(
                onPressed: () {
                  _controller.reverse();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffe7d388),
                  minimumSize: const Size(80, 80),
                  elevation: 0,
                  shape: const CircleBorder(
                      side: BorderSide(color: Color(0xffe7d388))),
                ),
                child: const Icon(
                  Icons.reply,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
