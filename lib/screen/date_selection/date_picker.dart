import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnSelected = Function(DateTime date);

class DatePicker extends StatefulWidget {
  static void show(
      BuildContext context, {
        DateTime? startDate,
        DateTime? endDate,
        DateTime? selectedDate,
        bool hideDay = false,
        bool hideYear = false,
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
          child: DatePicker._(
            selectedDate: selectedDate,
            startDate: startDate,
            endDate: endDate,
            onSelected: onSelected,
            hideDay: hideDay,
            hideYear: hideYear,
          ),
        );
      },
    ).then((value) => onCancel?.call());
  }

  const DatePicker._({
    this.selectedDate,
    this.startDate,
    this.endDate,
    this.hideDay = false,
    this.hideYear = false,
    required this.onSelected,
  });

  final DateTime? selectedDate;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool hideDay;
  final bool hideYear;
  final OnSelected onSelected;

  @override
  State createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late FixedExtentScrollController yearScrollController;
  late FixedExtentScrollController monthScrollController;
  late FixedExtentScrollController dayScrollController;

  List<String> yearList = []; // 年数组
  List<String> monthList = []; // 月数组
  List<String> dayList = []; // 天数组

  int yearIndex = 0; // 年的索引
  int monthIndex = 0; // 月的索引
  int dayIndex = 0; //天的索引

  late DateTime startDate;
  late DateTime endDate;
  late DateTime selectedDate;

  final double itemExtent = 44;

  /// 初始化数据
  void initData() {
    // 初始化年份数
    for (int i = startDate.year; i <= endDate.year; i++) {
      yearList.add(i.toString());
    }
    int selectYear = selectedDate.year;
    int selectMonth = selectedDate.month;
    // 初始化月份数
    monthList = getMonthList(selectYear);
    // 初始化天数
    dayList = getDayList(selectYear, selectMonth);
    // 初始化时间索引
    final List uniqueYearList = Set.from(yearList).toList();
    final List uniqueMonthList = Set.from(monthList).toList();
    final List uniqueDayList = Set.from(dayList).toList();
    // 获取索引
    setState(() {
      yearIndex = uniqueYearList.indexOf("${selectedDate.year}");
      monthIndex = uniqueMonthList.indexOf("${selectedDate.month}");
      dayIndex = uniqueDayList.indexOf("${selectedDate.day}");
    });
    // 设置Picker初始值
    yearScrollController = FixedExtentScrollController(initialItem: yearIndex);
    monthScrollController = FixedExtentScrollController(initialItem: monthIndex);
    dayScrollController = FixedExtentScrollController(initialItem: dayIndex);
  }

  List<String> getMonthList(int selectYear) {
    List<String> monthList = [];
    if (selectYear == startDate.year) {
      for (int i = startDate.month; i <= 12; i++) {
        monthList.add(i.toString());
      }
    } else if (selectYear == endDate.year) {
      for (int i = 1; i <= endDate.month; i++) {
        monthList.add(i.toString());
      }
    } else {
      for (int i = 1; i <= 12; i++) {
        monthList.add(i.toString());
      }
    }
    return monthList;
  }

  List<String> getDayList(int selectYear, int selectMonth) {
    List<String> dayList = [];
    int days = getDayCount(selectYear, selectMonth);
    if (selectYear == startDate.year && selectMonth == startDate.month) {
      for (int i = startDate.day; i <= days; i++) {
        dayList.add(i.toString());
      }
    } else if (selectYear == endDate.year && selectMonth == endDate.month) {
      for (int i = 1; i <= endDate.day; i++) {
        dayList.add(i.toString());
      }
    } else {
      for (int i = 1; i <= days; i++) {
        dayList.add(i.toString());
      }
    }
    return dayList;
  }

  int getDayCount(int year, int month) {
    int dayCount = DateTime(year, month + 1, 0).day;
    return dayCount;
  }

  /// 选中年月后更新天
  void updateDayList() {
    int year = int.parse(yearList[yearIndex]);
    int month = int.parse(monthList[monthIndex]);
    setState(() {
      dayIndex = 0;
      dayList = getDayList(year, month);
      if (dayScrollController.positions.isNotEmpty) {
        dayScrollController.jumpTo(0);
      }
    });
  }

  /// 选中年后更新月
  void updateMonthList() {
    int selectYear = int.parse(yearList[yearIndex]);
    setState(() {
      monthIndex = 0;
      monthList = getMonthList(selectYear);
      if (monthScrollController.positions.isNotEmpty) {
        monthScrollController.jumpTo(0);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startDate = widget.startDate ?? DateTime(1970, 1, 1);
    endDate = widget.endDate ?? DateTime(2099, 1, 1);
    selectedDate = widget.selectedDate ?? DateTime.now();
    if (endDate.difference(startDate).inSeconds < 0) {
      endDate = startDate;
    }
    if (selectedDate.difference(startDate).inSeconds < 0) {
      selectedDate = startDate;
    }
    if (selectedDate.difference(endDate).inSeconds > 0) {
      selectedDate = endDate;
    }
    initData();
  }

  @override
  void dispose() {
    yearScrollController.dispose();
    monthScrollController.dispose();
    dayScrollController.dispose();
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

                      widget.hideYear
                          ? const SizedBox():
                      Expanded(child: yearPickerView()),
                      Expanded(child: monthPickerView()),
                      widget.hideDay
                          ? const SizedBox()
                          : Expanded(child: dayPickerView()),
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
                      widget.onSelected.call(DateTime(
                        int.parse(yearList[yearIndex]),
                        int.parse(monthList[monthIndex]),
                        int.parse(dayList[dayIndex]),
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

  /// 年Picker
  Widget yearPickerView() {
    return buildPickerBorder(
      child: CupertinoPicker(
        scrollController: yearScrollController,
        looping: false,
        selectionOverlay: const Center(),
        onSelectedItemChanged: (index) {
          setState(() {
            yearIndex = index;
          });
          updateMonthList();
          updateDayList();
        },
        itemExtent: itemExtent,
        children: buildYearWidget(),
      ),
    );
  }

  /// 月Picker
  Widget monthPickerView() {
    return buildPickerBorder(
      child: CupertinoPicker(
        scrollController: monthScrollController,
        looping: false,
        selectionOverlay: const Center(),
        onSelectedItemChanged: (index) {
          setState(() {
            monthIndex = index;
          });
          updateDayList();
        },
        itemExtent: itemExtent,
        children: buildMonthWidget(),
      ),
    );
  }

  /// 日Picker
  Widget dayPickerView() {
    return buildPickerBorder(
      child: CupertinoPicker(
        scrollController: dayScrollController,
        looping: false,
        selectionOverlay: const Center(),
        onSelectedItemChanged: (index) {
          setState(() {
            dayIndex = index;
          });
        },
        itemExtent: itemExtent,
        children: buildDayWidget(),
      ),
    );
  }

  /// 年Widget
  List<Widget> buildYearWidget() {
    List<Widget> widgets = [];
    for (var i = 0; i < yearList.length; i++) {
      widgets.add(
        Center(
          child: Text(
            '${yearList[i]}年',
            style: getTextStyle(i == yearIndex),
            maxLines: 1,
          ),
        ),
      );
    }
    return widgets;
  }

  /// 月Widget
  List<Widget> buildMonthWidget() {
    List<Widget> widgets = [];
    for (var i = 0; i < monthList.length; i++) {
      widgets.add(
        Center(
          child: Text(
            // monthList[i].padLeft(2, '0')
            '${monthList[i]}月',
            style: getTextStyle(i == monthIndex),
            maxLines: 1,
          ),
        ),
      );
    }
    return widgets;
  }

  /// 日Widget
  List<Widget> buildDayWidget() {
    List<Widget> widgets = [];
    for (var i = 0; i < dayList.length; i++) {
      widgets.add(
        Center(
          child: Text(
            // dayList[i].padLeft(2, '0')
            '${dayList[i]}日',
            style: getTextStyle(i == dayIndex),
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
