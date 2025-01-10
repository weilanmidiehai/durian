import 'package:flutter/material.dart';

class DragAndDropSort extends StatefulWidget {
  const DragAndDropSort({super.key});

  @override
  State<DragAndDropSort> createState() => _DragAndDropSortState();
}

class _DragAndDropSortState extends State<DragAndDropSort> {
  List<String> items = List.generate(20, (int i) => '$i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('拖拽排序 ReorderableListView'),),

      body: ReorderableListView(
          header: const Text(
            '我是header',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green,fontSize: 20),
          ),
        children: [
          for (String item in items)
            Container(
              key: ValueKey(item),
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors
                      .primaries[int.parse(item) % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(10)),
            )
        ],
        onReorder: (int oldIndex, int newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          var child = items.removeAt(oldIndex);
          items.insert(newIndex, child);
          setState(() {});
        },
      ),
    );
  }
}
