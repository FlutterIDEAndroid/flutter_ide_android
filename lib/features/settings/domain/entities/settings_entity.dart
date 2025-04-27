import 'package:isar/isar.dart';

import '../../../../core/util/enums.dart';

class SettingsEntity {
  final bool fontLigadures;
  @enumerated
  final ThemeOption themeOption;
  final bool highlightError;
  final bool autoComplete;
  final bool codeBlock;
  final bool lineHighlight;
  final double fontSize;
  final bool autoLineBreak;
  final bool trimSpaces;
  final List<String> extensions;
  final String customSymbols;
  final bool lineNumbers;
  final String fontFamily;
  final bool autoSave;
  final bool useSystemShell;
  @enumerated
  final List<CompilePlatform> compilePlatforms;
  @enumerated
  final CompileMode compileMode;
  @enumerated
  final CompileArch compileArch;

  SettingsEntity({
    this.fontLigadures = false,
    this.themeOption = ThemeOption.dark,
    this.highlightError = false,
    this.autoComplete = false,
    this.codeBlock = false,
    this.lineHighlight = false,
    this.fontSize = 14.0,
    this.autoLineBreak = false,
    this.trimSpaces = false,
    this.extensions = const [],
    this.customSymbols = '',
    this.lineNumbers = false,
    this.fontFamily = 'Roboto',
    this.autoSave = false,
    this.useSystemShell = false,
    this.compilePlatforms = const [],
    this.compileMode = CompileMode.debug,
    this.compileArch = CompileArch.arm,
  });

  factory SettingsEntity.fromJson(String jsonStr) => throw UnimplementedError();
  String toJson() => throw UnimplementedError();
}
