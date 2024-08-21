import 'package:flutter/material.dart';

class Material3Color extends StatelessWidget {
  const Material3Color({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColorTile(name: 'Primary', color: colorScheme.primary),
              ColorTile(
                  name: 'Primary Container', color: colorScheme.primaryContainer),
              ColorTile(name: 'Secondary', color: colorScheme.secondary),
              ColorTile(
                  name: 'Secondary Container',
                  color: colorScheme.secondaryContainer),
              ColorTile(name: 'Tertiary', color: colorScheme.tertiary),
              ColorTile(
                  name: 'Tertiary Container',
                  color: colorScheme.tertiaryContainer),
              ColorTile(name: 'Surface', color: colorScheme.surface),
              ColorTile(name: 'Background', color: colorScheme.background),
              ColorTile(name: 'Error', color: colorScheme.error),
              ColorTile(
                  name: 'Error Container', color: colorScheme.errorContainer),
              ColorTile(name: 'On Primary', color: colorScheme.onPrimary),
              ColorTile(
                  name: 'On Primary Container',
                  color: colorScheme.onPrimaryContainer),
              ColorTile(name: 'On Secondary', color: colorScheme.onSecondary),
              ColorTile(
                  name: 'On Secondary Container',
                  color: colorScheme.onSecondaryContainer),
              ColorTile(name: 'On Tertiary', color: colorScheme.onTertiary),
              ColorTile(
                  name: 'On Tertiary Container',
                  color: colorScheme.onTertiaryContainer),
              ColorTile(name: 'On Surface', color: colorScheme.onSurface),
              ColorTile(
                  name: 'On Surface Variant',
                  color: colorScheme.onSurfaceVariant),
              ColorTile(name: 'On Background', color: colorScheme.onBackground),
              ColorTile(name: 'On Error', color: colorScheme.onError),
              ColorTile(
                  name: 'On Error Container',
                  color: colorScheme.onErrorContainer),
              ColorTile(
                  name: 'Surface Variant', color: colorScheme.surfaceVariant),
              ColorTile(name: 'Outline', color: colorScheme.outline),
              ColorTile(name: 'Shadow', color: colorScheme.shadow),
              ColorTile(
                  name: 'Inverse Surface', color: colorScheme.inverseSurface),
              ColorTile(
                  name: 'On Inverse Surface',
                  color: colorScheme.onInverseSurface),
              ColorTile(
                  name: 'Inverse Primary', color: colorScheme.inversePrimary),
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

  ColorTile({required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          color: color,
        ),
        SizedBox(width: 8),
        Text(name),
      ],
    );
  }
}
