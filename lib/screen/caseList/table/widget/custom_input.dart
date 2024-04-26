import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final bool? enabled;
  final int? maxLine;
  final String? text;
  final String? hintText;
  final FocusNode? focusNode;
  final ValueChanged<String>? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    this.hintText,
    this.onEditingComplete,
    this.enabled,
    this.onChanged,
    this.text,
    this.inputFormatters,
    this.maxLine,
    this.focusNode,
    this.controller,
    this.onSubmitted,
  });

  @override
  State<CustomTextField> createState() => SearchWidgetState();
}

class SearchWidgetState extends State<CustomTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 检查 text 是否发生变化，如果发生变化，则更新 controller.text
    if (widget.text != oldWidget.text && widget.text != controller.text) {
      controller.text = widget.text ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        focusNode: widget.focusNode,
        maxLines: widget.maxLine ?? 1,
        //最大行数
        inputFormatters: widget.inputFormatters ?? [],
        controller: controller,
        enabled: widget.enabled ?? true,
        textAlign: TextAlign.center,
        style: const TextStyle(height: 1.2, fontSize: 14),
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 5.5),
          hintText: widget.hintText ?? "",
          hintStyle: const TextStyle(height: 1.2, fontSize: 14),
          border: InputBorder.none,
        ),
        onChanged: (v) {
          widget.onChanged?.call(v);
        },
        onEditingComplete: () async {
          widget.onEditingComplete?.call(controller.text);
        },
        onSubmitted: (v) {
          widget.onSubmitted?.call(controller.text);
        });
  }
}
