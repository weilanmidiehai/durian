import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'widget/custom_input.dart';
import 'widget/custom_table.dart';

class Test1 extends StatefulWidget {
  const Test1({super.key});

  @override
  State<Test1> createState() => _AAAState();
}

class _AAAState extends State<Test1> {
  final List<String> columns = ['部门', '掃描件號碼', '文件日期'];

  final List rows = [
    {'department': '电脑部', 'number': '01', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '02', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '03', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '04', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '05', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '06', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '07', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '08', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '09', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '10', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '11', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '12', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '13', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '14', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '15', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '16', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '17', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '18', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '19', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '20', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '21', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '22', 'date': '2023-01-23'},
    {'department': '电脑部', 'number': '23', 'date': '2023-01-23'},
  ];

  int selectedIndex = 0;
  late Timer _debounce;

  // Define a TextEditingController and FocusNode for each cell
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(rows.length,
        (index) => TextEditingController(text: rows[index]['number']));
    focusNodes = List.generate(rows.length, (index) => FocusNode());
    _debounce = Timer(const Duration(milliseconds: 500), () {});
  }

  @override
  void dispose() {
    for (int i = 0; i < rows.length; i++) {
      controllers[i].dispose();
      focusNodes[i].dispose();
    }
    _debounce.cancel();
    super.dispose();
  }

  void handleEnterPressed(int rowIndex) {
    if (rowIndex < rows.length - 1) {
      var tableKey = customTableKey.currentState;
      setState(() {
        selectedIndex = rowIndex + 1;
      });
      //如果是最后一行,翻页
      if ((rowIndex + 1) % tableKey!.rowsPerPage == 0) {
        tableKey.controller?.goToNextPage();
        Timer(const Duration(milliseconds: 100), () {
          FocusScope.of(context).requestFocus(focusNodes[rowIndex + 1]);
        });
        return;
      }

      FocusScope.of(context).requestFocus(focusNodes[rowIndex + 1]);
    }
  }

  void searchAndUpdateTable(String searchText) {
    if (_debounce.isActive) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      int index =
          rows.indexWhere((row) => row['number'].startsWith(searchText));
      if (index != -1) {
        var tableKey = customTableKey.currentState;
        tableKey?.controller?.goToPageWithRow(index - 1);
        setState(() {
          selectedIndex = index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('表格回車'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                hintText: '输入掃描件號碼搜索',
              ),
              onChanged: (v) {
                searchAndUpdateTable(v);
              },
            ),
            Expanded(
              child: CustomTable(
                key: customTableKey,
                columns: List.generate(
                  columns.length,
                  (index) =>
                      DataColumn(label: Center(child: Text(columns[index]))),
                ),
                dataTableSource: _DataSource(
                  rows: rows,
                  controllers: controllers,
                  focusNodes: focusNodes,
                  handleEnterPressed: handleEnterPressed,
                  selectedRowIndex: selectedIndex,
                  onRowSelected: (v) {
                    setState(() {
                      selectedIndex = v;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  final List rows;
  final List<TextEditingController> controllers;
  final List<FocusNode> focusNodes;
  final Function(int) handleEnterPressed;
  final int selectedRowIndex;
  final Function(int) onRowSelected;

  _DataSource({
    required this.selectedRowIndex,
    required this.onRowSelected,
    required this.rows,
    required this.controllers,
    required this.focusNodes,
    required this.handleEnterPressed,
  });

  @override
  DataRow2 getRow(int index) {
    final item = rows[index];
    return DataRow2.byIndex(
        selected: index == selectedRowIndex,
        onSelectChanged: (selected) {
          if (selected != null && selected) {
            onRowSelected(index);
          }
        },
        index: index,
        specificRowHeight: 43,
        color: MaterialStateProperty.all(
            index == selectedRowIndex ? Colors.yellow : Colors.white),
        cells: [
          DataCell(Center(child: Text('${item['department']}'))),
          DataCell(CustomTextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              onSubmitted: (_) {
                handleEnterPressed(index);
              })),
          DataCell(Center(child: Text('${item['date']}'))),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rows.length;

  @override
  int get selectedRowCount => 0;
}
