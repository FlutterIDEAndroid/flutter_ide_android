import 'dart:convert';

import '../../../../core/util/enums.dart';

class SettingsEntity {
  final bool fontLigadures;

  final ThemeOption themeOption;
  final bool highlightError;
  final bool autoComplete;
  final bool codeBlock;
  final bool lineHighlight;
  final double fontSize;
  final bool autoLineBreak;
  final bool trimSpaces;
  final List<String> extensions;
  final List<String> customSymbols;
  final bool lineNumbers;
  final String fontFamily;
  final bool autoSave;
  final bool useSystemShell;

  final List<CompilePlatform> compilePlatforms;

  final CompileMode compileMode;

  final CompileArch compileArch;

  SettingsEntity({
    this.fontLigadures = false,
    this.themeOption = ThemeOption.dark,
    this.highlightError = false,
    this.autoComplete = false,
    this.codeBlock = true,
    this.lineHighlight = false,
    this.fontSize = 14.0,
    this.autoLineBreak = false,
    this.trimSpaces = false,
    this.extensions = const [],
    this.customSymbols = const [],
    this.lineNumbers = false,
    this.fontFamily = 'Roboto',
    this.autoSave = true,
    this.useSystemShell = false,
    this.compilePlatforms = const [],
    this.compileMode = CompileMode.debug,
    this.compileArch = CompileArch.arm64,
  });

  /// Cria um novo SettingsModel a partir do atual, sobrescrevendo somente os campos que foram passados.
  SettingsEntity copyWith({
    bool? fontLigadures,
    ThemeOption? themeOption,
    bool? highlightError,
    bool? autoComplete,
    bool? codeBlock,
    bool? lineHighlight,
    double? fontSize,
    bool? autoLineBreak,
    bool? trimSpaces,
    List<String>? extensions,
    List<String>? customSymbols,
    bool? lineNumbers,
    String? fontFamily,
    bool? autoSave,
    bool? useSystemShell,
    List<CompilePlatform>? compilePlatforms,
    CompileMode? compileMode,
    CompileArch? compileArch,
  }) {
    return SettingsEntity(
      fontLigadures: fontLigadures ?? this.fontLigadures,
      themeOption: themeOption ?? this.themeOption,
      highlightError: highlightError ?? this.highlightError,
      autoComplete: autoComplete ?? this.autoComplete,
      codeBlock: codeBlock ?? this.codeBlock,
      lineHighlight: lineHighlight ?? this.lineHighlight,
      fontSize: fontSize ?? this.fontSize,
      autoLineBreak: autoLineBreak ?? this.autoLineBreak,
      trimSpaces: trimSpaces ?? this.trimSpaces,
      extensions: extensions ?? List.from(this.extensions),
      customSymbols: customSymbols ?? List.from(this.customSymbols),
      lineNumbers: lineNumbers ?? this.lineNumbers,
      fontFamily: fontFamily ?? this.fontFamily,
      autoSave: autoSave ?? this.autoSave,
      useSystemShell: useSystemShell ?? this.useSystemShell,
      compilePlatforms: compilePlatforms ?? List.from(this.compilePlatforms),
      compileMode: compileMode ?? this.compileMode,
      compileArch: compileArch ?? this.compileArch,
    );
  }

  /// Converte o modelo num Map para serialização JSON.
  Map<String, dynamic> toMap() {
    return {
      'fontLigadures': fontLigadures,
      'themeOption': themeOption.name,
      'highlightError': highlightError,
      'autoComplete': autoComplete,
      'codeBlock': codeBlock,
      'lineHighlight': lineHighlight,
      'fontSize': fontSize,
      'autoLineBreak': autoLineBreak,
      'trimSpaces': trimSpaces,
      'extensions': extensions,
      'customSymbols': customSymbols,
      'lineNumbers': lineNumbers,
      'fontFamily': fontFamily,
      'autoSave': autoSave,
      'useSystemShell': useSystemShell,
      // Convertemos cada enum para string para facilitar o JSON
      'compilePlatforms':
          compilePlatforms.map((e) => e.name).toList(growable: false),
      'compileMode': compileMode.name,
      'compileArch': compileArch.name,
    };
  }

  /// Reconstrói um SettingsModel a partir de um Map (por exemplo, vindo de JSON).
  factory SettingsEntity.fromMap(Map<String, dynamic> map) {
    return SettingsEntity(
      fontLigadures: map['fontLigadures'] as bool,
      themeOption: ThemeOption.values.firstWhere(
        (e) => e.name == map['themeOption'],
        orElse: () => ThemeOption.dark,
      ),
      highlightError: map['highlightError'] as bool,
      autoComplete: map['autoComplete'] as bool,
      codeBlock: map['codeBlock'] as bool,
      lineHighlight: map['lineHighlight'] as bool,
      fontSize: (map['fontSize'] as num).toDouble(),
      autoLineBreak: map['autoLineBreak'] as bool,
      trimSpaces: map['trimSpaces'] as bool,
      extensions: List<String>.from(map['extensions'] as List<dynamic>),
      customSymbols: List<String>.from(map['customSymbols'] as List<dynamic>),
      lineNumbers: map['lineNumbers'] as bool,
      fontFamily: map['fontFamily'] as String,
      autoSave: map['autoSave'] as bool,
      useSystemShell: map['useSystemShell'] as bool,
      compilePlatforms: (map['compilePlatforms'] as List<dynamic>)
          .map((e) => CompilePlatform.values.firstWhere(
              (cp) => cp.name == e as String,
              orElse: () => CompilePlatform.android))
          .toList(),
      compileMode: CompileMode.values.firstWhere(
        (e) => e.name == map['compileMode'] as String,
        orElse: () => CompileMode.debug,
      ),
      compileArch: CompileArch.values.firstWhere(
        (e) => e.name == map['compileArch'] as String,
        orElse: () => CompileArch.arm64,
      ),
    );
  }

  /// Serializa o modelo para uma String JSON.
  String toJson() => json.encode(toMap());

  /// Cria um SettingsModel a partir de uma String JSON.
  factory SettingsEntity.fromJson(String source) =>
      SettingsEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Cria um SettingsModel a partir de uma SettingsEntity.
  factory SettingsEntity.fromEntity(SettingsEntity e) => SettingsEntity(
        fontLigadures: e.fontLigadures,
        themeOption: e.themeOption,
        highlightError: e.highlightError,
        autoComplete: e.autoComplete,
        codeBlock: e.codeBlock,
        lineHighlight: e.lineHighlight,
        fontSize: e.fontSize,
        autoLineBreak: e.autoLineBreak,
        trimSpaces: e.trimSpaces,
        extensions: e.extensions,
        customSymbols: e.customSymbols,
        lineNumbers: e.lineNumbers,
        fontFamily: e.fontFamily,
        autoSave: e.autoSave,
        useSystemShell: e.useSystemShell,
        compilePlatforms: e.compilePlatforms,
        compileMode: e.compileMode,
        compileArch: e.compileArch,
      );
}
