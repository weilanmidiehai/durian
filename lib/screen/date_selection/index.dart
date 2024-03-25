import 'package:flutter/material.dart';

import 'date_picker.dart';
import 'time_data.dart';


class DateSelection extends StatefulWidget {
  const DateSelection({super.key});

  @override
  State<DateSelection> createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Picker')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: 160,
                height: 60,
                child: const Text('日期选择（年月日）'),
              ),
              onTap: () {
                DatePicker.show(
                  context,
                  startDate: DateTime(2022, 2, 2),
                  selectedDate: DateTime(2023, 3, 3),
                  endDate: DateTime(2025, 5, 5),
                  onSelected: (date) {
                    print(date.toString());
                    // MsgUtil.toast(date.toString());
                  },
                );
              },
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: 160,
                height: 60,
                child: const Text('日期选择（年月）'),
              ),
              onTap: () {
                DatePicker.show(
                  context,
                  // hideDay: true,
                  hideYear: true,
                  startDate: DateTime(2022, 2),
                  selectedDate: DateTime(2023, 3),
                  endDate: DateTime(2025, 5),
                  onSelected: (date) {
                    print(date.toString());
                    // MsgUtil.toast(date.toString());
                  },
                );
              },
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: 160,
                height: 60,
                child: const Text('时间选择（时分秒）'),
              ),
              onTap: () {
                TimePicker.show(
                  context,
                  startTime: TimeData(11, 11, 11),
                  selectedTime: TimeData(15, 15, 15),
                  endTime: TimeData(22, 22, 22),
                  onSelected: (time) {
                    print(time.toString());
                    // MsgUtil.toast(time.toString());
                  },
                );
              },
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: 160,
                height: 60,
                child: const Text('时间选择（时分）'),
              ),
              onTap: () {
                TimePicker.show(
                  context,
                  hideSecond: true,
                  startTime: TimeData(11, 11),
                  selectedTime: TimeData(15, 15),
                  endTime: TimeData(22, 22),
                  onSelected: (time) {
                    print(time.toString());

                    // MsgUtil.toast(time.toString());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}




