import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnSelected = Function(TimeData time);
typedef PickerBuilder = Widget Function(BuildContext context);

class TimeData {
  final int hour;
  final int minute;
  final int second;

  TimeData(this.hour, [this.minute = 0, this.second = 0])
      : assert(hour >= 0 && hour <= 23),
        assert(minute >= 0 && minute <= 59),
        assert(second >= 0 && second <= 59);

  factory TimeData.now() {
    var now = DateTime.now();
    return TimeData(now.hour, now.minute, now.second);
  }

  bool precede(TimeData other) {
    return (hour < other.hour) ||
        (hour == other.hour && minute < other.minute) ||
        (hour == other.hour && minute == other.minute && second < other.second);
  }

  @override
  String toString() {
    return '$hour:$minute:$second';
  }
}

class TimePicker extends StatefulWidget {
  static void show(
      BuildContext context, {
        TimeData? startTime,
        TimeData? endTime,
        TimeData? selectedTime,
        bool hideSecond = false,
        Function()? onCancel,
        required OnSelected onSelected,
      }) async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          child: TimePicker._(
            selectedTime: selectedTime,
            startTime: startTime,
            endTime: endTime,
            hideSecond: hideSecond,
            onSelected: onSelected,
          ),
        );
      },
    ).then((value) => onCancel?.call());
  }

  const TimePicker._({
    this.selectedTime,
    this.startTime,
    this.endTime,
    this.hideSecond = false,
    required this.onSelected,
  });

  final TimeData? selectedTime;
  final TimeData? startTime;
  final TimeData? endTime;
  final bool hideSecond;
  final OnSelected onSelected;

  @override
  State createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late FixedExtentScrollController hourScrollController;
  late FixedExtentScrollController minuteScrollController;
  late FixedExtentScrollController secondScrollController;

  List<String> hourList = [];
  List<String> minuteList = [];
  List<String> secondList = [];

  int hourIndex = 0;
  int minuteIndex = 0;
  int secondIndex = 0;

  late TimeData startTime;
  late TimeData endTime;
  late TimeData selectedTime;

  final double itemExtent = 44;

  /// 初始化数据
  void initData() {
    // 初始化时
    for (int i = startTime.hour; i <= endTime.hour; i++) {
      hourList.add(i.toString());
    }
    int selectHour = selectedTime.hour;
    int selectMinute = selectedTime.minute;
    // 初始化分
    minuteList = getMinuteList(selectHour);
    // 初始化秒
    secondList = getSecondList(selectHour, selectMinute);
    // 初始化时间索引
    final List uniqueHourList = Set.from(hourList).toList();
    final List uniqueMinuteList = Set.from(minuteList).toList();
    final List uniqueSecondList = Set.from(secondList).toList();
    // 获取索引
    setState(() {
      hourIndex = uniqueHourList.indexOf("${selectedTime.hour}");
      minuteIndex = uniqueMinuteList.indexOf("${selectedTime.minute}");
      secondIndex = uniqueSecondList.indexOf("${selectedTime.second}");
    });
    // 设置Picker初始值
    hourScrollController = FixedExtentScrollController(initialItem: hourIndex);
    minuteScrollController = FixedExtentScrollController(initialItem: minuteIndex);
    secondScrollController = FixedExtentScrollController(initialItem: secondIndex);
  }

  List<String> getMinuteList(int selectHour) {
    List<String> list = [];
    if (selectHour == startTime.hour) {
      for (int i = startTime.minute; i <= 59; i++) {
        list.add(i.toString());
      }
    } else if (selectHour == endTime.hour) {
      for (int i = 0; i <= endTime.minute; i++) {
        list.add(i.toString());
      }
    } else {
      for (int i = 0; i <= 59; i++) {
        list.add(i.toString());
      }
    }
    return list;
  }

  List<String> getSecondList(int selectHour, int selectMinute) {
    List<String> list = [];
    if (selectHour == startTime.hour && selectMinute == startTime.minute) {
      for (int i = startTime.second; i <= 59; i++) {
        list.add(i.toString());
      }
    } else if (selectHour == endTime.hour && selectMinute == endTime.minute) {
      for (int i = 0; i <= endTime.second; i++) {
        list.add(i.toString());
      }
    } else {
      for (int i = 0; i <= 59; i++) {
        list.add(i.toString());
      }
    }
    return list;
  }

  /// 选中时分后更新秒
  void updateSecondList() {
    int hour = int.parse(hourList[hourIndex]);
    int minute = int.parse(minuteList[minuteIndex]);
    setState(() {
      secondIndex = 0;
      secondList = getSecondList(hour, minute);
      if (secondScrollController.positions.isNotEmpty) {
        secondScrollController.jumpTo(0);
      }
    });
  }

  /// 选中时后更新分
  void updateMinuteList() {
    int selectHour = int.parse(hourList[hourIndex]);
    setState(() {
      minuteIndex = 0;
      minuteList = getMinuteList(selectHour);
      if (minuteScrollController.positions.isNotEmpty) {
        minuteScrollController.jumpTo(0);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    startTime = widget.startTime ?? TimeData(0, 0, 0);
    endTime = widget.endTime ?? TimeData(23, 59, 59);
    selectedTime = widget.selectedTime ?? TimeData(now.hour, now.minute, now.second);
    if (endTime.precede(startTime)) {
      endTime = startTime;
    }
    if (selectedTime.precede(startTime)) {
      selectedTime = startTime;
    }
    if (endTime.precede(selectedTime)) {
      selectedTime = endTime;
    }
    initData();
  }

  @override
  void dispose() {
    hourScrollController.dispose();
    minuteScrollController.dispose();
    secondScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            color: Colors.white,
            width: double.maxFinite,
            height: 200,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 32,
                  height: itemExtent - 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  top: 0,
                  bottom: 0,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Expanded(child: hourPickerView()),
                      Expanded(child: minutePickerView()),
                      widget.hideSecond
                          ? const SizedBox()
                          : Expanded(child: secondPickerView()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 68,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    child: const Text('取 消'),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextButton(
                    child: const Text('确 定'),
                    onPressed: () {
                      Navigator.pop(context, true);
                      widget.onSelected.call(TimeData(
                        int.parse(hourList[hourIndex]),
                        int.parse(minuteList[minuteIndex]),
                        int.parse(secondList[secondIndex]),
                      ));
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  /// 时Picker
  Widget hourPickerView() {
    return buildPickerBorder(
      child: CupertinoPicker(
        scrollController: hourScrollController,
        looping: false,
        selectionOverlay: const Center(),
        onSelectedItemChanged: (index) {
          setState(() {
            hourIndex = index;
          });
          updateMinuteList();
          updateSecondList();
        },
        itemExtent: itemExtent,
        children: buildHourWidget(),
      ),
    );
  }

  /// 分Picker
  Widget minutePickerView() {
    return buildPickerBorder(
      child: CupertinoPicker(
        scrollController: minuteScrollController,
        looping: false,
        selectionOverlay: const Center(),
        onSelectedItemChanged: (index) {
          setState(() {
            minuteIndex = index;
          });
          updateSecondList();
        },
        itemExtent: itemExtent,
        children: buildMinuteWidget(),
      ),
    );
  }

  /// 秒Picker
  Widget secondPickerView() {
    return buildPickerBorder(
      child: CupertinoPicker(
        scrollController: secondScrollController,
        looping: false,
        selectionOverlay: const Center(),
        onSelectedItemChanged: (index) {
          setState(() {
            secondIndex = index;
          });
        },
        itemExtent: itemExtent,
        children: buildSecondWidget(),
      ),
    );
  }

  /// 时Widget
  List<Widget> buildHourWidget() {
    List<Widget> widgets = [];
    for (var i = 0; i < hourList.length; i++) {
      widgets.add(
        Center(
          child: Text(
            // hourList[i].padLeft(2, '0')
            '${hourList[i]}时',
            style: getTextStyle(i == hourIndex),
            maxLines: 1,
          ),
        ),
      );
    }
    return widgets;
  }

  /// 分Widget
  List<Widget> buildMinuteWidget() {
    List<Widget> widgets = [];
    for (var i = 0; i < minuteList.length; i++) {
      widgets.add(
        Center(
          child: Text(
            // minuteList[i].padLeft(2, '0')
            '${minuteList[i]}分',
            style: getTextStyle(i == minuteIndex),
            maxLines: 1,
          ),
        ),
      );
    }
    return widgets;
  }

  /// 秒Widget
  List<Widget> buildSecondWidget() {
    List<Widget> widgets = [];
    for (var i = 0; i < secondList.length; i++) {
      widgets.add(
        Center(
          child: Text(
            // secondList[i].padLeft(2, '0')
            '${secondList[i]}秒',
            style: getTextStyle(i == secondIndex),
            maxLines: 1,
          ),
        ),
      );
    }
    return widgets;
  }

  TextStyle getTextStyle(bool bold) {
    return TextStyle(
      color: Colors.black,
      fontSize: 20,
      height: 1,
      fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
    );
  }

  Widget buildPickerBorder({required Widget child}) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        /*Container(
          width: 90,
          height: itemExtent - 8,
          decoration: BoxDecoration(
            color: const Color(0xffEFEFF0),
            borderRadius: BorderRadius.circular(10),
          ),
        ),*/
        child,
      ],
    );
  }
}
