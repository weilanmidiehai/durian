import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

GlobalKey<CustomTableState> customTableKey = GlobalKey();

class CustomTable extends StatefulWidget {
  const CustomTable(
      {super.key,
      this.columns,
      required this.dataTableSource,
      this.rowsPerPage = 15});

  //表头
  final List<DataColumn>? columns;
  final DataTableSource dataTableSource;
  final int rowsPerPage;

  @override
  State<CustomTable> createState() => CustomTableState();
}

class CustomTableState extends State<CustomTable> {
  ///每页行数
  int rowsPerPage = 0;

  ///分页器控制器
  PaginatorController? controller;

  ///列索引
  int? sortColumnIndex;

  ///升序
  bool sortAscending = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rowsPerPage = widget.rowsPerPage;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = PaginatorController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(bottom: 40),
              child: PaginatedDataTable2(
                availableRowsPerPage: const [3, 5, 10, 15, 20],
                // 水平边距
                horizontalMargin: 0,
                // 复选框水平边距
                checkboxHorizontalMargin: 0,
                // 柱间距
                columnSpacing: 0,
                // 包裹在卡片中
                wrapInCard: false,
                // 最后渲染空行
                renderEmptyRowsInTheEnd: false,
                minWidth: 200,
                //每页行数
                rowsPerPage: rowsPerPage,
                headingRowHeight: 33,
                header: null,
                //展示复选框
                // showCheckboxColumn: false,
                onRowsPerPageChanged: (value) {
                  //每页行数
                  rowsPerPage = value!;
                },
                initialFirstRowIndex: 0,
                onPageChanged: (rowIndex) {
                  debugPrint(
                      '行索引$rowIndex,,页码${(rowIndex / rowsPerPage).floor() + 1}');
                },
                // 排序列索引
                sortColumnIndex: sortColumnIndex,
                // 升序
                sortAscending: sortAscending,
                // 排序箭头图标
                sortArrowIcon: Icons.keyboard_arrow_up,
                // 排序箭头动画持续时间
                sortArrowAnimationDuration: const Duration(milliseconds: 0),
                // custom animation duration
                datarowCheckboxTheme: CheckboxThemeData(
                  fillColor: WidgetStateProperty.all<Color>(Colors.transparent),
                  checkColor: WidgetStateProperty.all<Color>(
                      Theme.of(context).colorScheme.primary),
                  side: const BorderSide(color: Colors.transparent),
                ),

                headingCheckboxTheme: CheckboxThemeData(
                  fillColor: WidgetStateProperty.all<Color>(Colors.transparent),
                  checkColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                  overlayColor:
                      WidgetStateProperty.all<Color>(Colors.transparent),
                  side: const BorderSide(color: Colors.transparent),
                ),

                controller: controller,
                //隐藏默认分页器
                hidePaginator: true,
                columns: widget.columns ?? [],
                headingRowColor: WidgetStateColor.resolveWith(
                  (states) => Theme.of(context).colorScheme.inversePrimary,
                ),
                border: TableBorder.all(
                    color: Theme.of(context).colorScheme.inversePrimary),
                empty: Center(
                    child: Container(
                        padding: const EdgeInsets.all(20),
                        child: const Text('沒有數據'))),
                source: widget.dataTableSource,
              ),
            ),
          ),
        ],
      ),
      //底部分页器
      Positioned(bottom: 0, child: CustomPager1(controller!))
    ]);
  }
}

///自定义页码
class CustomPager1 extends StatefulWidget {
  const CustomPager1(this.controller, {super.key});

  final PaginatorController controller;

  @override
  CustomPagerState createState() => CustomPagerState();
}

class CustomPagerState extends State<CustomPager1> {
  final TextEditingController _pageController = TextEditingController();
  static const List<int> _availableSizes = [3, 5, 10, 15, 20];
  String currentPage = '';

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        currentPage =
            '${1 + ((widget.controller.currentRowIndex + 1) / widget.controller.rowsPerPage).floor()}';
        _pageController.text = currentPage;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // skip this build pass
    if (!widget.controller.isAttached) return const SizedBox();
    return Container(
      color: Theme.of(context).colorScheme.surface,
      width: MediaQuery.sizeOf(context).width,
      child: Wrap(
        spacing: 4,
        runSpacing: 0.0,
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => widget.controller.goToFirstPage(),
                  icon: const Icon(Icons.skip_previous)),
              IconButton(
                  onPressed: () => widget.controller.goToPreviousPage(),
                  icon: const Icon(Icons.chevron_left_sharp)),
              SizedBox(
                height: 40,
                child: DropdownButton<int>(
                    onChanged: (v) => widget.controller.setRowsPerPage(v!),
                    value:
                        _availableSizes.contains(widget.controller.rowsPerPage)
                            ? widget.controller.rowsPerPage
                            : _availableSizes[0],
                    items: _availableSizes
                        .map((s) => DropdownMenuItem<int>(
                              value: s,
                              child: Center(child: Text('$s條/頁')),
                            ))
                        .toList()),
              ),
              IconButton(
                  onPressed: () => widget.controller.goToNextPage(),
                  icon: const Icon(Icons.chevron_right_sharp)),
              IconButton(
                  onPressed: () => widget.controller.goToLastPage(),
                  icon: const Icon(Icons.skip_next))
            ],
          ),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 页数
                Text(
                  widget.controller.isAttached
                      ? '${1 + ((widget.controller.currentRowIndex + 1) / widget.controller.rowsPerPage).floor()}/'
                          '${(widget.controller.rowCount / widget.controller.rowsPerPage).ceil()}頁 '
                          '共${widget.controller.rowCount}條'
                      : '頁: x of y',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(width: 10),
                //跳转页码
                const Text('前往'),
                SizedBox(
                  width: 60,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _pageController,
                    inputFormatters: [
                      //设置只允许输入数字
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                    ],
                    decoration: const InputDecoration(isCollapsed: true),
                    onSubmitted: (v) {
                      int value = int.parse(v);
                      var page = (widget.controller.rowCount /
                              widget.controller.rowsPerPage)
                          .ceil();
                      if (value > page) {
                        value = page;
                      }
                      var row = (value - 1) * widget.controller.rowsPerPage;
                      widget.controller.goToPageWithRow(row);
                    },
                  ),
                ),
                const Text('頁'),
              ])
        ],
      ),
    );
  }
}
