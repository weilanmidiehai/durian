import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomPieChart extends StatefulWidget {
  const CustomPieChart(
      {super.key,
      required this.total,
      required this.gList,
      this.badgePositionPercentageOffset,
      this.width,
      required this.translate});

  final double total;
  final List gList;
  final double? badgePositionPercentageOffset;
  final double? width;
  final bool translate;

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  int touchedIndex = -1;
  List<int> showingTooltip = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.width ?? 150,
          width: widget.width ?? 150,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '合计',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              Text(
                widget.total.toStringAsFixed(2),
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        SizedBox(
          height: widget.width ?? 150,
          width: widget.width ?? 150,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                    if (showingTooltip.isNotEmpty) {
                      showingTooltip.clear();
                    }
                    showingTooltip.add(touchedIndex);
                  });
                  Future.delayed(const Duration(seconds: 1), () {
                    setState(() {
                      showingTooltip.clear();
                    });
                  });
                },
              ),
              startDegreeOffset: 270,
              sectionsSpace: 3,
              centerSpaceRadius: 55,
              sections: showingSections(
                widget.gList,
              ),
            ),
          ),
        ),
      ],
    );
  }

  //  饼图列表
  List<PieChartSectionData> showingSections(list) {
    return List.generate(
      list.length,
      (i) {
        final item = list[i];
        return PieChartSectionData(
            color: Color(item['color']),
            value: item['value'],
            title: '',
            radius: showingTooltip.contains(i) ? 24.0 : 18.0,
            badgePositionPercentageOffset:
                widget.badgePositionPercentageOffset ?? -1,
            badgeWidget: showingTooltip.contains(i)
                ? Card(
                    color: Colors.white.withOpacity(0.9),
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: GraphIndicator(
                        color: Color(item['color']),
                        title: '${item['title']} ',
                        date:
                            ' ${(item['value'] / widget.total * 100).toStringAsFixed(2)}%',
                        isSquare: false,
                        fontSize: 15,
                        size: 8))
                : Container());
      },
    );
  }
}

//图例
class CustomIndicator extends StatelessWidget {
  const CustomIndicator(
      {super.key, required this.iList, required this.translate});

  final List iList;
  final bool translate;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxHeight: 150),
        alignment: Alignment.center,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: iList.length,
          itemBuilder: (BuildContext context, int index) {
            final item = iList[index];
            return GraphIndicator(
              color: Color(item['color']),
              title: '${item['title']}',
              date: '${item['value']}',
              isSquare: false,
              size: 12,
            );
          },
        ));
  }
}

//图例样式
class GraphIndicator extends StatelessWidget {
  const GraphIndicator({
    super.key,
    required this.color,
    required this.title,
    required this.date,
    required this.isSquare,
    this.size,
    this.fontSize,
  });

  final Color color;
  final String title;
  final String date;
  final bool isSquare;
  final double? size;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: size ?? 16,
                  height: size ?? 16,
                  decoration: BoxDecoration(
                    shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
                    color: color,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(title,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: fontSize ?? 16,
                      ),
                      textAlign: TextAlign.start),
                ),
              ],
            ),
          ),
          Text(
            date,
            textAlign: TextAlign.end,
            softWrap: true,
            style: TextStyle(
              fontSize: fontSize ?? 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
