import 'package:flutter/material.dart';

class CustomNavigation extends StatefulWidget {
  const CustomNavigation({super.key});

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  bool sessionFlag = false;
  bool checkLoadingFlag = false;
  List pList = [];
  int _selectedIndex = 0;
  double navigationRailWidth = 100.0;

  @override
  Widget build(BuildContext context) {
    List<Widget> mainContents = [
      Container(
        color: Colors.yellow.shade100,
        alignment: Alignment.center,
        child: const Text(
          'Home',
          style: TextStyle(fontSize: 40),
        ),
      ),
      Container(
        color: Colors.purple.shade100,
        alignment: Alignment.center,
        child: const Text(
          'Feed',
          style: TextStyle(fontSize: 40),
        ),
      ),
      Container(
        color: Colors.red.shade100,
        alignment: Alignment.center,
        child: const Text(
          'Favorites',
          style: TextStyle(fontSize: 40),
        ),
      ),
      Container(
        color: Colors.pink.shade300,
        alignment: Alignment.center,
        child: const Text(
          'Settings',
          style: TextStyle(fontSize: 40),
        ),
      )
    ];

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(builder: (context, constraints) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(children: [
              Container(
                width: navigationRailWidth,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        width: 0.5),
                  ),
                ),
                child: ListView(
                  children: [
                    _buildSidebarItem(
                      context,
                      icon: Icons.home,
                      label: 'home',
                      index: 0,
                    ),
                    _buildSidebarItem(
                      context,
                      icon: Icons.feed,
                      label: 'feed',
                      index: 1,
                    ),
                    _buildSidebarItem(
                      context,
                      icon: Icons.favorite,
                      label: 'favorites',
                      index: 2,
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 0,
                  child: GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        setState(() {
                          navigationRailWidth += details.delta.dx;
                          if (navigationRailWidth < 50.0) {
                            navigationRailWidth = 50.0; // 最小宽度
                          } else if (navigationRailWidth >
                              constraints.maxWidth) {
                            navigationRailWidth = constraints.maxWidth; // 最大宽度
                          }
                        });
                      },
                      child: SizedBox(
                          width: 10.0,
                          height: MediaQuery.sizeOf(context).height,
                          child: const MouseRegion(
                            cursor: SystemMouseCursors.resizeColumn,
                            child: Icon(Icons.drag_handle, color: Colors.white),
                          ))))
            ]),
            Expanded(child: mainContents[_selectedIndex]),
          ],
        );
      }),
    );
  }

  Widget _buildSidebarItem(BuildContext context,
      {required IconData icon, required String label, required int index}) {
    final isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        color: isSelected
            ? Theme.of(context).colorScheme.onInverseSurface
            : Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.black54,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
