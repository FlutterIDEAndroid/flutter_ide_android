import 'package:flutter/material.dart';
import 'package:flutter_ide_android/features/settings/presentation/providers/terminal_settings_provider.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class TerminalSettingsScreen extends StatelessWidget {
  const TerminalSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Terminal'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Consumer<TerminalSettingsProvider>(
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
                child: SwitchListTile(
                  secondary: const Icon(Icons.android_rounded),
                  title: const Text('Usar shell do sistema'),
                  subtitle: const Text(
                    'Se ativado, /system/bin/bash será utilizado no terminal ',
                  ),
                  value: vm.useSystemShell,
                  onChanged: (v) {
                    vm.toggleUseSystemShell(v);
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
