import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.icon,
    required this.text1,
    this.text2,
    required this.widget,
  }) : super(key: key);

  final Icon icon;
  final String text1;
  final String? text2;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      decoration: BoxDecoration(
          // color: Colors.white,
          border: Border.all(color: const Color(0xfff5e4d3), width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon,
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: '  ' '$text1',
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 18)),
                  TextSpan(
                      text: text2 ?? '',
                      style: const TextStyle(color: Colors.orange)),
                ]),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          widget,
        ],
      ),
    );
  }
}
