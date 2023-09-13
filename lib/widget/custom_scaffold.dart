import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.automaticallyImplyLeading,
    this.leading,
    this.bottomNavigationBar,
    this.actions,
    this.elevation,
  });

  final String title;
  final Widget body;
  final bool? automaticallyImplyLeading;
  final Widget? leading;
  final double? elevation;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: automaticallyImplyLeading ?? true,
          elevation: elevation ?? 4,
          centerTitle: true,
          title: Text(title),
          leading: leading ??
              GestureDetector(
                child: const Icon(Icons.arrow_back_ios),
                onTap: () => Navigator.pop(context),
              ),
          actions: actions ?? []),
      body: body,
    );
  }
}
