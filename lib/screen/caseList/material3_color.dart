import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Material3Color extends StatelessWidget {
  const Material3Color({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('點擊複製顏色代碼'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColorTile(name: 'primary', color: colorScheme.primary),
              ColorTile(
                  name: 'primaryContainer',
                  color: colorScheme.primaryContainer),
              ColorTile(name: 'secondary', color: colorScheme.secondary),
              ColorTile(
                  name: 'secondaryContainer',
                  color: colorScheme.secondaryContainer),
              ColorTile(name: 'tertiary', color: colorScheme.tertiary),
              ColorTile(
                  name: 'tertiaryContainer',
                  color: colorScheme.tertiaryContainer),
              ColorTile(name: 'surface', color: colorScheme.surface),
              ColorTile(name: 'error', color: colorScheme.error),
              ColorTile(
                  name: 'errorContainer', color: colorScheme.errorContainer),
              ColorTile(name: 'onPrimary', color: colorScheme.onPrimary),
              ColorTile(
                  name: 'onPrimaryContainer',
                  color: colorScheme.onPrimaryContainer),
              ColorTile(name: 'onSecondary', color: colorScheme.onSecondary),
              ColorTile(
                  name: 'onSecondaryContainer',
                  color: colorScheme.onSecondaryContainer),
              ColorTile(name: 'onTertiary', color: colorScheme.onTertiary),
              ColorTile(
                  name: 'onTertiaryContainer',
                  color: colorScheme.onTertiaryContainer),
              ColorTile(name: 'onSurface', color: colorScheme.onSurface),
              ColorTile(
                  name: 'onSurfaceVariant',
                  color: colorScheme.onSurfaceVariant),
              ColorTile(name: 'onSurface', color: colorScheme.onSurface),
              ColorTile(name: 'onError', color: colorScheme.onError),
              ColorTile(
                  name: 'onErrorContainer',
                  color: colorScheme.onErrorContainer),
              ColorTile(
                  name: 'surfaceContainerHighest',
                  color: colorScheme.surfaceContainerHighest),
              ColorTile(name: 'outline', color: colorScheme.outline),
              ColorTile(name: 'Shadow', color: colorScheme.shadow),
              ColorTile(
                  name: 'inverseSurface', color: colorScheme.inverseSurface),
              ColorTile(
                  name: 'onInverseSurface',
                  color: colorScheme.onInverseSurface),
              ColorTile(
                  name: 'inversePrimary', color: colorScheme.inversePrimary),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorTile extends StatelessWidget {
  final String name;
  final Color color;

  const ColorTile({super.key, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(
            ClipboardData(text: 'Theme.of(context).colorScheme.$name'));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('复制成功!')),
        );
      },
      child: Row(
        children: [
          Container(
            width: 26,
            height: 26,
            color: color,
          ),
          const SizedBox(width: 8),
          Text(name),
        ],
      ),
    );
  }
}
