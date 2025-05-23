import 'package:flutter/material.dart';
import 'package:flutter_ide_android/features/settings/presentation/providers/settings_provider.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/enums.dart';
import '../widgets/common_dialogs.dart';

class ExecuteDebugSettingsScreen extends StatefulWidget {
  const ExecuteDebugSettingsScreen({super.key});

  @override
  State<ExecuteDebugSettingsScreen> createState() =>
      _ExecuteDebugSettingsScreenState();
}

class _ExecuteDebugSettingsScreenState
    extends State<ExecuteDebugSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Executar e Debugar'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, vm, child) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Gap(40),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Configurações de Compilação',
                  style: textStyle.labelLarge,
                ),
              ),
              const SizedBox(height: 12),
              Card(
                color: colors.secondaryContainer,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                    top: Radius.circular(20),
                  ),
                ),
                child: ListTile(
                  leading: const Icon(Icons.build_rounded),
                  title: const Text('Modo de Compilação'),
                  subtitle: Text(vm.compileMode.name),
                  onTap: () async {
                    final selectedMode = await showCompileModeDialog(
                      context,
                      currentMode: vm.compileMode,
                      modes: CompileMode.values,
                    );
                    if (selectedMode != null) {
                      vm.selectMode(selectedMode);
                    }
                  },
                ),
              ),
              Card(
                color: colors.secondaryContainer,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: ListTile(
                  leading: const Icon(Icons.smartphone_rounded, size: 24),
                  title: const Text('Plataformas'),
                  subtitle: Text(vm.platforms.isEmpty
                      ? 'Nenhuma plataforma selecionada'
                      : vm.platforms.map((p) => p.name).join(', ')),
                  onTap: () async {
                    final platforms = await showPlatformsDialog(
                      context,
                      currentPlatforms: vm.platforms,
                      availablePlatforms: CompilePlatform.values,
                    );
                    if (platforms != null) {
                      vm.setExtensions(platforms);
                    }
                  },
                ),
              ),
              Card(
                color: colors.secondaryContainer,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                    top: Radius.circular(10),
                  ),
                ),
                child: ListTile(
                  leading: const Icon(Icons.memory),
                  title: const Text('Arquitetura de Compilação'),
                  subtitle: Text(vm.compileArch.name),
                  onTap: () async {
                    final selectedArch = await showCompileArchDialog(
                      context,
                      currentArch: vm.compileArch,
                      archs: CompileArch.values,
                    );
                    if (selectedArch != null) {
                      vm.selectArch(selectedArch);
                    }
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
