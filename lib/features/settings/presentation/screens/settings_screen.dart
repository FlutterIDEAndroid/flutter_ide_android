import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(40),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Configurar',
              style: textStyle.labelLarge,
            ),
          ),
          const Gap(40),
          ListTile(
            title: Text(
              'Tema',
              style: textStyle.titleLarge,
            ),
            subtitle: const Text(
              'Configurações do tema',
            ),
            onTap: () => Navigator.pushNamed(context, '/general_settings'),
          ),
          const Gap(20),
          ListTile(
            title: Text(
              'Editor',
              style: textStyle.titleLarge,
            ),
            subtitle: const Text(
              'Configurações do editor',
            ),
            onTap: () => Navigator.pushNamed(context, '/editor_settings'),
          ),
          const Gap(20),
          ListTile(
            title: Text(
              'Terminal',
              style: textStyle.titleLarge,
            ),
            subtitle: const Text(
              'Configurações do terminal',
            ),
            onTap: () => Navigator.pushNamed(context, '/terminal_settings'),
          ),
          const Gap(20),
          ListTile(
            title: Text(
              'Executar e depurar',
              style: textStyle.titleLarge,
            ),
            subtitle: const Text(
              'Configurações de compilação',
            ),
            onTap: () =>
                Navigator.pushNamed(context, '/execute_debug_settings'),
          ),
          const Gap(20),
          const Divider(),
        ],
      ),
    );
  }
}
