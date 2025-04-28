import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ide_android/core/util/enums.dart';

Future<List<String>?> showCustomSymbolsDialog(
  BuildContext context, {
  required List<String> initialSymbols,
}) {
  final controller = TextEditingController(text: initialSymbols.join(', '));
  return showDialog<List<String>>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Símbolos Customizados'),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(hintText: 'sep. por vírgula'),
        maxLines: null,
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar')),
        TextButton(
            onPressed: () {
              final splits = controller.text
                  .split(',')
                  .map((s) => s.trim())
                  .where((s) => s.isNotEmpty)
                  .toList();
              Navigator.of(ctx).pop(splits);
            },
            child: const Text('Confirmar')),
      ],
    ),
  );
}

Future<String?> showFontFamilyDialog(
  BuildContext context, {
  required String currentFamily,
  required List<String> families,
}) {
  String selected = currentFamily;
  return showDialog<String>(
    context: context,
    builder: (ctx) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: SimpleDialog(
        title: const Text('Selecione uma Font Family'),
        children: families.map((f) {
          return RadioListTile<String>(
            title: Text(f),
            value: f,
            groupValue: selected,
            onChanged: (value) => Navigator.of(ctx).pop(value),
          );
        }).toList(),
      ),
    ),
  );
}

Future<List<CompilePlatform>?> showPlatformsDialog(
  BuildContext context, {
  required List<CompilePlatform> currentPlatforms,
  required List<CompilePlatform> availablePlatforms,
}) {
  final selections = Set<CompilePlatform>.from(currentPlatforms);

  return showDialog<List<CompilePlatform>>(
    context: context,
    builder: (ctx) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: AlertDialog(
        title: const Text('Selecione uma Plataforma'),
        content: StatefulBuilder(
          builder: (ctx2, setState) => SingleChildScrollView(
            child: Column(
              children: availablePlatforms.map((platform) {
                return CheckboxListTile(
                  checkboxShape: const CircleBorder(),
                  title: Text(platform.name),
                  value: selections.contains(platform),
                  onChanged: (checked) {
                    setState(() {
                      if (checked == true)
                        selections.add(platform);
                      else
                        selections.remove(platform);
                    });
                  },
                );
              }).toList(),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(selections.toList()),
            child: const Text('Confirmar'),
          ),
        ],
      ),
    ),
  );
}

Future<CompileMode?> showCompileModeDialog(
  BuildContext context, {
  required CompileMode currentMode,
  required List<CompileMode> modes,
}) {
  return showDialog<CompileMode>(
    context: context,
    builder: (ctx) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: SimpleDialog(
        title: const Text('Modo de Compilação'),
        children: modes.map((mode) {
          return RadioListTile<CompileMode>(
            title: Text(mode.name),
            value: mode,
            groupValue: currentMode,
            onChanged: (value) => Navigator.of(ctx).pop(value),
          );
        }).toList(),
      ),
    ),
  );
}

Future<CompileArch?> showCompileArchDialog(
  BuildContext context, {
  required CompileArch currentArch,
  required List<CompileArch> archs,
}) {
  return showDialog<CompileArch>(
    context: context,
    builder: (ctx) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: SimpleDialog(
        title: const Text('Arquitetura de Compilação'),
        children: archs.map((arch) {
          return RadioListTile<CompileArch>(
            title: Text(arch.name),
            value: arch,
            groupValue: currentArch,
            onChanged: (value) => Navigator.of(ctx).pop(value),
          );
        }).toList(),
      ),
    ),
  );
}
