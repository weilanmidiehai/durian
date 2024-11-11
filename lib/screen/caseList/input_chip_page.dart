import 'package:flutter/material.dart';

class InputChipPage extends StatefulWidget {
  const InputChipPage({Key? key}) : super(key: key);

  @override
  State<InputChipPage> createState() {
    return _InputChipPageState();
  }
}

class _InputChipPageState extends State<InputChipPage> {
  final List<ItemModel> _chips = [
    ItemModel("Android", Colors.green, false),
    ItemModel("Flutter", Colors.blueGrey, false),
    ItemModel("Ios", Colors.deepOrange, false),
    ItemModel("Python", Colors.cyan, false),
    ItemModel("React JS", Colors.teal, false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Flutter Input Chip Demo"), centerTitle: true),
      body: Center(
          child: Column(
        children: [
          Image.asset("assets/logo.png", height: 300, width: 350),
          Wrap(direction: Axis.horizontal, children: itemsChips()),
        ],
      )),
    );
  }

  List<Widget> itemsChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _chips.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: InputChip(
          avatar: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              _chips[i].label[0].toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 1.1, // 调整文字高度，使其垂直居中
                  color: _chips[i].color),
            ),
          ),
          side: const BorderSide(
            color: Colors.transparent, // 设置边框颜色
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999), // 设置圆角半径
          ),
          label: Text(_chips[i].label),
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: _chips[i].color,
          selected: _chips[i].isSelected,
          onDeleted: () {
            setState(() {
              _chips.removeAt(i);
            });
          },
          onSelected: (bool value) {
            setState(() {
              _chips[i].isSelected = value;
            });
          },
        ),
      );

      chips.add(item);
    }

    return chips;
  }
}

class ItemModel {
  String label;

  Color color;

  bool isSelected;

  ItemModel(this.label, this.color, this.isSelected);
}
