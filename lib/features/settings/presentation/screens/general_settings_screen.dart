import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/enums.dart';
import '../providers/settings_provider.dart';

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({super.key});

  @override
  State<GeneralSettingsScreen> createState() => _GeneralSettingsScreenState();
}

class _GeneralSettingsScreenState extends State<GeneralSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final bool systemDark =
        MediaQuery.platformBrightnessOf(context) == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tema'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Consumer<SettingsProvider>(
        builder: (context, vm, child) {
          final selected = vm.selectedTheme;

          // Modos atuais
          // final bool followSystem = selected == ThemeOption.dark;
          final bool manualDarkMode = selected == ThemeOption.dark;
          final bool useAmoled = selected == ThemeOption.darkAmoled;

          final bool isDarkActive = (useAmoled && systemDark) || manualDarkMode;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 12),

              /*    Card(
                color: colors.primaryContainer,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                    bottom: Radius.circular(10),
                  ),
                ),
                child: SwitchListTile(
                  secondary: const Icon(Icons.palette),
                  title: const Text('Tema do Sistema'),
                  subtitle:
                      const Text('Use as configurações de tema do dispositivo'),
                  value: followSystem,
                  onChanged: (v) {
                    vm.select(v ? ThemeOption.system : ThemeOption.light);
                  },
                ),
              ),
 */

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
                  secondary: const Icon(Icons.dark_mode),
                  title: const Text('Modo Escuro'),
                  subtitle: Text(
                    'Dark mode está ${manualDarkMode ? 'ativo' : 'inativo'}',
                  ),
                  value: isDarkActive,
                  onChanged: selected == ThemeOption.materialYou
                      ? null
                      : (v) {
                          vm.selectTheme(
                              v ? ThemeOption.dark : ThemeOption.light);
                        },
                ),
              ),
              Card(
                color: colors.secondaryContainer,
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: SwitchListTile(
                  secondary: const Icon(Icons.opacity),
                  title: const Text('Modo AMOLED'),
                  subtitle: const Text(
                    /* isDarkActive
                        ? 'Use preto puro em telas AMOLED'
                        :  */
                    'Só disponível em modo escuro',
                  ),
                  value: useAmoled,
                  onChanged: selected == ThemeOption.materialYou ||
                          !isDarkActive
                      ? null
                      : (v) {
                          vm.selectTheme(
                              v ? ThemeOption.darkAmoled : ThemeOption.dark);
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
                child: SwitchListTile(
                  secondary: const Icon(Icons.palette),
                  title: const Text('Cores Dinâmicas'),
                  subtitle: const Text('Extraídas do wallpaper/system'),
                  value: selected == ThemeOption.materialYou,
                  onChanged: (v) {
                    vm.selectTheme(
                        v ? ThemeOption.materialYou : ThemeOption.light);
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
