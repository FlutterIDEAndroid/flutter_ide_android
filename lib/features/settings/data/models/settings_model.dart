import 'package:isar/isar.dart';

import '../../../../core/util/enums.dart';
import '../../domain/entities/settings_entity.dart';

part 'settings_model.g.dart';

@Collection()
class SettingsModel extends SettingsEntity {
  SettingsModel({
    required super.fontLigadures,
    required super.themeOption,
    required super.highlightError,
    required super.autoComplete,
    required super.codeBlock,
    required super.lineHighlight,
    required super.fontSize,
    required super.autoLineBreak,
    required super.trimSpaces,
    required super.extensions,
    required super.customSymbols,
    required super.lineNumbers,
    required super.fontFamily,
    required super.autoSave,
    required super.useSystemShell,
    required super.compilePlatforms,
    required super.compileMode,
    required super.compileArch,
  });

  Id get id => 0;

  factory SettingsModel.fromEntity(SettingsEntity e) => SettingsModel(
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

  SettingsEntity toEntity() => this;
}
