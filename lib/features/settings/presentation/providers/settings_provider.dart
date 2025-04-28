import 'package:flutter/material.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/enums.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/usecases/get_settings.dart';
import '../../domain/usecases/save_setting.dart';

class SettingsProvider extends ChangeNotifier {
  final GetSettings getSettings;
  final SaveSetting updateSetting;

  ThemeOption _selectedTheme = ThemeOption.dark;
  ThemeOption get selectedTheme => _selectedTheme;
  bool _useSystemShell = false;
  bool get useSystemShell => _useSystemShell;

  bool highlightError = false;
  bool autoComplete = false;
  bool codeBlock = false;
  bool lineHighlight = false;
  bool fontLigadures = false;
  double fontSize = 14;
  bool autoLineBreak = false;
  bool trimSpaces = false;
  List<String> extensions = [];
  List<String> customSymbols = [];
  bool lineNumbers = false;
  String fontFamily = 'Roboto';
  bool autoSave = false;
  CompileMode compileMode = CompileMode.debug;
  CompileArch compileArch = CompileArch.arm64;
  List<CompilePlatform> platforms = [];

  SettingsProvider({
    required this.getSettings,
    required this.updateSetting,
  }) {
    load();
  }

  Future<void> load() async {
    final res = await getSettings(NoParams());
    res.fold((_) {}, (s) {
      highlightError = s.highlightError;
      _selectedTheme = s.themeOption;
      fontLigadures = s.fontLigadures;
      compileMode = s.compileMode;
      compileArch = s.compileArch;
      compileArch = s.compileArch;
      codeBlock = s.codeBlock;
      autoComplete = s.autoComplete;
      lineHighlight = s.lineHighlight;
      _useSystemShell = s.useSystemShell;
      platforms = s.compilePlatforms;
      fontSize = s.fontSize;
      autoLineBreak = s.autoLineBreak;
      trimSpaces = s.trimSpaces;
      extensions = List.from(s.extensions);
      customSymbols = s.customSymbols;
      lineNumbers = s.lineNumbers;
      fontFamily = s.fontFamily;
      autoSave = s.autoSave;
      notifyListeners();
    });
  }

  void toggleHighlightError(bool v) async {
    highlightError = v;

    notifyListeners();
    await _save();
  }

  void selectTheme(ThemeOption? option) {
    if (option != null) {
      _selectedTheme = option;

      _save();
      notifyListeners();
    }
  }

  void toggleUseSystemShell(bool v) {
    _useSystemShell = v;
    _save();
    notifyListeners();
  }

  void toggleAutoComplete(bool v) async {
    autoComplete = v;

    notifyListeners();
    await _save();
  }

  void toggleCodeBlock(bool v) async {
    codeBlock = v;

    notifyListeners();
    await _save();
  }

  void toggleLineHighlight(bool v) async {
    lineHighlight = v;

    notifyListeners();
    await _save();
  }

  void toggleAutoLineBreak(bool v) async {
    autoLineBreak = v;

    notifyListeners();
    await _save();
  }

  void toggleTrimSpaces(bool v) async {
    trimSpaces = v;

    notifyListeners();
    await _save();
  }

  void toggleLineNumbers(bool v) async {
    lineNumbers = v;

    notifyListeners();
    await _save();
  }

  void toggleFontLigadures(bool v) async {
    fontLigadures = v;

    notifyListeners();
    await _save();
  }

  void toggleAutoSave(bool v) async {
    autoSave = v;

    notifyListeners();
    await _save();
  }

  // Setters
  void setFontSize(double size) async {
    fontSize = size;

    notifyListeners();
    await _save();
  }

  void setCustomSymbols(List<String> symbols) async {
    customSymbols = symbols;

    notifyListeners();
    await _save();
  }

  void setFontFamily(String family) async {
    fontFamily = family;

    notifyListeners();
    await _save();
  }

  void setCompileMode(CompileMode mode) async {
    compileMode = mode;

    notifyListeners();
    await _save();
  }

  void setCompileArch(CompileArch arch) async {
    compileArch = arch;

    notifyListeners();
    await _save();
  }

  void togglePlatform(CompilePlatform p) {
    if (platforms.contains(p)) {
      platforms.remove(p);
    } else {
      platforms.add(p);
    }
    _save();
    notifyListeners();
  }

  void selectMode(CompileMode m) {
    compileMode = m;
    _save();
    notifyListeners();
  }

  void selectArch(CompileArch a) {
    compileArch = a;
    _save();
    notifyListeners();
  }

  void setExtensions(List<CompilePlatform> exts) {
    //  extensions = List.from(exts);
    platforms = exts;
    _save();
    notifyListeners();
  }

  Future<void> _save() async {
    final s = SettingsEntity().copyWith(
      fontLigadures: fontLigadures,
      themeOption: _selectedTheme,
      highlightError: highlightError,
      autoComplete: autoComplete,
      compileMode: compileMode,
      compileArch: compileArch,
      codeBlock: codeBlock,
      useSystemShell: _useSystemShell,
      lineHighlight: lineHighlight,
      fontSize: fontSize,
      autoLineBreak: autoLineBreak,
      compilePlatforms: platforms,
      trimSpaces: trimSpaces,
      extensions: extensions,
      customSymbols: customSymbols,
      lineNumbers: lineNumbers,
      fontFamily: fontFamily,
      autoSave: autoSave,
    );
    await updateSetting(s);
  }
}
