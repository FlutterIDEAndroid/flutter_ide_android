import '../../domain/entities/settings_entity.dart';

class SettingsModel extends SettingsEntity {
  SettingsModel({
    super.fontLigadures,
    super.themeOption,
    super.highlightError,
    super.autoComplete,
    super.codeBlock,
    super.lineHighlight,
    super.fontSize,
    super.autoLineBreak,
    super.trimSpaces,
    super.extensions,
    super.customSymbols,
    super.lineNumbers,
    super.fontFamily,
    super.autoSave,
    super.useSystemShell,
    super.compilePlatforms,
    super.compileMode,
    super.compileArch,
  });
}
