import 'package:flutter/material.dart';
import 'package:flutter_ide_android/features/settings/presentation/providers/editor_settings_provider.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editor'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Consumer<EditorSettingsProvider>(
        builder: (context, vm, child) {
          return ListView(
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
                            Text('Tamanho da fonte',
                                style: textStyle.labelLarge),
                            Row(
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
                                    value: vm.fontSize,
                                    activeColor:
                                        colors.primary.withOpacity(0.8),
                                    inactiveColor:
                                        colors.primary.withOpacity(0.3),
                                    onChanged: vm.setFontSize,
                                  ),
                                ),
                                SizedBox(
                                  width: 35,
                                  child: Text('${vm.fontSize.toInt()} sp',
                                      style: textStyle.titleSmall),
                                ),
                              ],
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
                child: ListTile(
                  leading: const Icon(Icons.font_download_rounded, size: 24),
                  title: const Text('Font family'),
                  subtitle: Text(vm.fontFamily),
                  onTap: () async {
                    final newFamily = await showFontFamilyDialog(
                      context,
                      currentFamily: vm.fontFamily,
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
                ),
              ),
              Card(
                color: colors.secondaryContainer,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SwitchListTile(
                  secondary: const Icon(Icons.line_axis_rounded),
                  title: const Text('Ligaduras de Fonte'),
                  subtitle: Text(
                    'Ligaduras de fonte está ${vm.fontLigadures ? 'ativo' : 'inativo'}',
                  ),
                  value: vm.fontLigadures,
                  onChanged: (v) {
                    vm.toggleFontLigadures(v);
                  },
                ),
              ),
              Card(
                color: colors.secondaryContainer,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: ListTile(
                  leading: const Icon(Icons.code_rounded, size: 24),
                  title: const Text('Simbolos Customizados'),
                  subtitle: Text(vm.customSymbols.isEmpty
                      ? 'Nenhum símbolo definido'
                      : vm.customSymbols),
                  onTap: () async {
                    final symbols = await showCustomSymbolsDialog(
                      context,
                      initialSymbols: vm.customSymbols,
                    );
                    if (symbols != null) vm.setCustomSymbols(symbols);
                  },
                ),
              ),
              Card(
                color: colors.secondaryContainer,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SwitchListTile(
                  secondary: const Icon(Icons.line_weight_rounded),
                  title: const Text('Mostrar Números de Linha'),
                  subtitle: Text(
                    'Números de linha está ${vm.lineNumbers ? 'ativo' : 'inativo'}',
                  ),
                  value: vm.lineNumbers,
                  onChanged: (v) {
                    vm.toggleLineNumbers(v);
                  },
                ),
              ),
              Card(
                color: colors.secondaryContainer,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SwitchListTile(
                  secondary: const Icon(Icons.highlight_alt_rounded),
                  title: const Text('Mostrar Destaques de Linha'),
                  subtitle: Text(
                    'Destaque de linha está ${vm.lineHighlight ? 'ativo' : 'inativo'}',
                  ),
                  value: vm.lineHighlight,
                  onChanged: (v) {
                    vm.toggleLineHighlight(v);
                  },
                ),
              ),
              Card(
                color: colors.secondaryContainer,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SwitchListTile(
                  secondary: const Icon(Icons.linear_scale_rounded),
                  title: const Text('Bloco de Codigo'),
                  subtitle: Text(
                    'Bloco de Codigo está ${vm.codeBlock ? 'ativo' : 'inativo'}',
                  ),
                  value: vm.codeBlock,
                  onChanged: (v) {
                    vm.toggleCodeBlock(v);
                  },
                ),
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
                child: SwitchListTile(
                  secondary: const Icon(Icons.save_rounded),
                  title: const Text('Salvar Automaticamente'),
                  subtitle: Text(
                    'Salvar Automaticamente está ${vm.autoSave ? 'ativo' : 'inativo'}',
                  ),
                  value: vm.autoSave,
                  onChanged: (v) {
                    vm.toggleAutoSave(v);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
