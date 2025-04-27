import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ide_android/core/util/enums.dart';
import 'package:flutter_ide_android/features/settings/presentation/providers/compile_settings_provider.dart';
import 'package:flutter_ide_android/features/settings/presentation/providers/editor_settings_provider.dart';
import 'package:flutter_ide_android/features/settings/presentation/providers/terminal_settings_provider.dart';
import 'package:flutter_ide_android/features/settings/presentation/providers/theme_settings_provider.dart';
import 'package:flutter_ide_android/features/settings/presentation/screens/editor_settings_screen.dart';
import 'package:flutter_ide_android/features/settings/presentation/screens/execute_debug_settings_screen.dart';
import 'package:flutter_ide_android/features/settings/presentation/screens/general_settings_screen.dart';
import 'package:flutter_ide_android/features/settings/presentation/screens/settings_screen.dart';
import 'package:flutter_ide_android/features/settings/presentation/screens/terminal_settings_screen.dart';
import 'package:provider/provider.dart';

import 'core/injection_container.dart' as di;
import 'features/onboarding/presentation/providers/onboarding_provider.dart';
import 'features/onboarding/presentation/screens/onboarding_screen.dart';
import 'features/terminal/presentation/providers/terminal_provider.dart';
import 'features/terminal/presentation/screens/terminal_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<OnboardingProvider>(
          create: (_) => di.sl<OnboardingProvider>(),
        ),
        ChangeNotifierProvider<TerminalProvider>(
          create: (_) => di.sl<TerminalProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<ThemeSettingsProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<EditorSettingsProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<CompileSettingsProvider>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.sl<TerminalSettingsProvider>(),
        ),
      ],
      child: Consumer<ThemeSettingsProvider>(
        builder: (_, vm, __) {
          ThemeMode themeMode;
          switch (vm.selected) {
            case ThemeOption.materialYou:
              themeMode = ThemeMode.system;
              break;
            case ThemeOption.light:
              themeMode = ThemeMode.light;
              break;
            case ThemeOption.dark:
            case ThemeOption.darkAmoled:
              themeMode = ThemeMode.dark;
              break;
          }

          return DynamicColorBuilder(
            builder: (lightDynamic, darkDynamic) {
              final bool useDynamic = vm.selected == ThemeOption.materialYou &&
                  lightDynamic != null &&
                  darkDynamic != null;

              final ColorScheme lightScheme = useDynamic
                  ? lightDynamic.harmonized()
                  : ColorScheme.fromSeed(
                      seedColor: Colors.blueGrey, brightness: Brightness.light);
              ColorScheme darkScheme = useDynamic
                  ? darkDynamic.harmonized().copyWith()
                  : ColorScheme.fromSeed(
                      seedColor: Colors.blueGrey, brightness: Brightness.dark);
              if (vm.selected == ThemeOption.darkAmoled) {
                darkScheme = darkScheme.copyWith(surface: Colors.black);
              }

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: themeMode,
                theme: ThemeData(
                  colorScheme: lightScheme,
                  useMaterial3: true,
                  splashColor: Colors.transparent,
                  navigationBarTheme: NavigationBarThemeData(
                    backgroundColor: lightScheme.surface,
                  ),
                  pageTransitionsTheme: PageTransitionsTheme(
                    builders: {
                      for (final platform in TargetPlatform.values)
                        platform: const FadeTransitionsBuilder(),
                    },
                  ),
                ),
                darkTheme: ThemeData(
                  colorScheme: darkScheme,
                  useMaterial3: true,
                  splashColor: Colors.transparent,
                  navigationBarTheme: NavigationBarThemeData(
                    backgroundColor: darkScheme.surface,
                  ),
                  pageTransitionsTheme: PageTransitionsTheme(
                    builders: {
                      for (final platform in TargetPlatform.values)
                        platform: const FadeTransitionsBuilder(),
                    },
                  ),
                ),
                builder: (context, child) {
                  final SystemUiOverlayStyle overlayStyle =
                      SystemUiOverlayStyle(
                    statusBarColor: themeMode == ThemeMode.dark
                        ? darkScheme.surface
                        : vm.selected == ThemeOption.materialYou
                            ? darkScheme.surface
                            : lightScheme.surface,
                    statusBarIconBrightness: themeMode == ThemeMode.dark
                        ? Brightness.light
                        : vm.selected == ThemeOption.materialYou
                            ? Brightness.light
                            : Brightness.dark,
                    systemNavigationBarColor: themeMode == ThemeMode.dark
                        ? darkScheme.surface
                        : vm.selected == ThemeOption.materialYou
                            ? darkScheme.surface
                            : lightScheme.surface,
                    systemNavigationBarIconBrightness:
                        themeMode == ThemeMode.dark
                            ? Brightness.light
                            : vm.selected == ThemeOption.materialYou
                                ? Brightness.light
                                : Brightness.dark,
                  );
                  return AnnotatedRegion<SystemUiOverlayStyle>(
                    value: overlayStyle,
                    child: child!,
                  );
                },
                initialRoute: '/',
                routes: {
                  '/': (_) => const OnboardingScreen(),
                  '/home': (_) => const HomeScreen(),
                  '/settings': (_) => const SettingsScreen(),
                  '/general_settings': (_) => const GeneralSettingsScreen(),
                  '/editor_settings': (_) => const EditorSettingsScreen(),
                  '/execute_debug_settings': (_) =>
                      const ExecuteDebugSettingsScreen(),
                  '/terminal_settings': (_) => const TerminalSettingsScreen(),
                  '/terminal': (_) => const TerminalScreen(),
                },
              );
            },
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter IDE')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /*    ElevatedButton.icon(
              icon: const Icon(Icons.code),
              label: const Text('Editor de Código'),
              onPressed: () => Navigator.pushNamed(context, '/editor'),
            ),
            const SizedBox(height: 16), */
            ElevatedButton.icon(
              icon: const Icon(Icons.terminal),
              label: const Text('Terminal'),
              onPressed: () => Navigator.pushNamed(context, '/terminal'),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.settings_outlined),
              label: const Text('Configurações'),
              onPressed: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
      ),
    );
  }
}

class FadeTransitionsBuilder extends PageTransitionsBuilder {
  const FadeTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
