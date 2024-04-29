import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('选择器'),
      ),
      body: Center(
        child: Column(
          children: [ElevatedButton(onPressed: () {}, child: const Text(''))],
        ),
      ),
    );
  }
}
