import 'package:flutter/material.dart';
import 'package:flutter_ide_android/features/settings/presentation/providers/settings_provider.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../widgets/common_dialogs.dart';

class EditorSettingsScreen extends StatefulWidget {
  const EditorSettingsScreen({super.key});

  @override
  State<EditorSettingsScreen> createState() => _EditorSettingsScreenState();
}

class _EditorSettingsScreenState extends State<EditorSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final vm = context.read<SettingsProvider>(); // pega o provider sem escutar
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editor'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Gap(40),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Configurações do editor',
              style: textStyle.labelLarge,
            ),
          ),
          const SizedBox(height: 12),
          Card(
            color: colors.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
                bottom: Radius.circular(10),
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              subtitle: Row(
                children: [
                  const Icon(Icons.format_size_rounded, size: 24),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tamanho da fonte', style: textStyle.labelLarge),
                        Selector<SettingsProvider, double>(
                          selector: (_, vm) =>
                              vm.fontSize, // seleciona só o fontSize
                          builder: (context, fontSize, child) {
                            // recebe o valor selecionado

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Slider(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    year2023: false,
                                    min: 8,
                                    max: 24,
                                    divisions: 16,
                                    value: fontSize,
                                    activeColor:
                                        colors.primary.withOpacity(0.6),
                                    inactiveColor:
                                        colors.primary.withOpacity(0.3),
                                    onChanged: vm.setFontSize,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                  child: Text('${fontSize.toInt()} sp'),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: colors.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: Selector<SettingsProvider, String>(
                selector: (_, vm) => vm.fontFamily, // seleciona só o fontSize
                builder: (context, fontFamily, child) {
                  return ListTile(
                    leading: const Icon(Icons.font_download_rounded, size: 24),
                    title: const Text('Font family'),
                    subtitle: Text(fontFamily),
                    onTap: () async {
                      final newFamily = await showFontFamilyDialog(
                        context,
                        currentFamily: fontFamily,
                        families: [
                          'Fira Code',
                          'Roboto',
                          'OpenSans',
                          'Monospace',
                          'Courier New'
                        ],
                      );
                      if (newFamily != null) vm.setFontFamily(newFamily);
                    },
                  );
                }),
          ),
          Card(
            color: colors.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Selector<SettingsProvider, bool>(
                selector: (_, vm) =>
                    vm.fontLigadures, // seleciona só o fontSize
                builder: (context, fontLigadures, child) {
                  return SwitchListTile(
                    secondary: const Icon(Icons.line_axis_rounded),
                    title: const Text('Ligaduras de Fonte'),
                    subtitle: Text(
                      'Ligaduras de fonte está ${fontLigadures ? 'ativo' : 'inativo'}',
                    ),
                    value: fontLigadures,
                    onChanged: (v) {
                      vm.toggleFontLigadures(v);
                    },
                  );
                }),
          ),
          Card(
            color: colors.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            child: Selector<SettingsProvider, List<String>>(
                selector: (_, vm) =>
                    vm.customSymbols, // seleciona só o fontSize
                builder: (context, customSymbols, child) {
                  return ListTile(
                    leading: const Icon(Icons.code_rounded, size: 24),
                    title: const Text('Simbolos Customizados'),
                    subtitle: Text(vm.customSymbols.isEmpty
                        ? 'Nenhum símbolo definido'
                        : customSymbols.join(', ')),
                    onTap: () async {
                      final symbols = await showCustomSymbolsDialog(
                        context,
                        initialSymbols: customSymbols,
                      );
                      if (symbols != null) vm.setCustomSymbols(symbols);
                    },
                  );
                }),
          ),
          Card(
            color: colors.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Selector<SettingsProvider, bool>(
                selector: (_, vm) => vm.lineNumbers, // seleciona só o fontSize
                builder: (context, lineNumbers, child) {
                  return SwitchListTile(
                    secondary: const Icon(Icons.line_weight_rounded),
                    title: const Text('Mostrar Números de Linha'),
                    subtitle: Text(
                      'Números de linha está ${lineNumbers ? 'ativo' : 'inativo'}',
                    ),
                    value: lineNumbers,
                    onChanged: (v) {
                      vm.toggleLineNumbers(v);
                    },
                  );
                }),
          ),
          Card(
            color: colors.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Selector<SettingsProvider, bool>(
                selector: (_, vm) =>
                    vm.lineHighlight, // seleciona só o fontSize
                builder: (context, lineHighlight, child) {
                  return SwitchListTile(
                    secondary: const Icon(Icons.highlight_alt_rounded),
                    title: const Text('Mostrar Destaques de Linha'),
                    subtitle: Text(
                      'Destaque de linha está ${lineHighlight ? 'ativo' : 'inativo'}',
                    ),
                    value: lineHighlight,
                    onChanged: (v) {
                      vm.toggleLineHighlight(v);
                    },
                  );
                }),
          ),
          Card(
            color: colors.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Selector<SettingsProvider, bool>(
                selector: (_, vm) => vm.codeBlock, // seleciona só o fontSize
                builder: (context, codeBlock, child) {
                  return SwitchListTile(
                    secondary: const Icon(Icons.linear_scale_rounded),
                    title: const Text('Bloco de Codigo'),
                    subtitle: Text(
                      'Bloco de Codigo está ${codeBlock ? 'ativo' : 'inativo'}',
                    ),
                    value: codeBlock,
                    onChanged: (v) {
                      vm.toggleCodeBlock(v);
                    },
                  );
                }),
          ),
          Card(
            color: colors.secondaryContainer,
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
                bottom: Radius.circular(20),
              ),
            ),
            child: Selector<SettingsProvider, bool>(
                selector: (_, vm) => vm.autoSave, // seleciona só o fontSize
                builder: (context, autoSave, child) {
                  return SwitchListTile(
                    secondary: const Icon(Icons.save_rounded),
                    title: const Text('Salvar Automaticamente'),
                    subtitle: Text(
                      'Salvar Automaticamente está ${autoSave ? 'ativo' : 'inativo'}',
                    ),
                    value: autoSave,
                    onChanged: (v) {
                      vm.toggleAutoSave(v);
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
