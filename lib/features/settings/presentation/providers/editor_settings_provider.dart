import 'package:flutter/material.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/enums.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/usecases/get_settings.dart';
import '../../domain/usecases/save_setting.dart';

class EditorSettingsProvider extends ChangeNotifier {
  final GetSettings getSettings;
  final SaveSetting updateSetting;

  bool highlightError = false;
  bool autoComplete = false;
  bool codeBlock = false;
  bool lineHighlight = false;
  bool fontLigadures = false;
  double fontSize = 14;
  bool autoLineBreak = false;
  bool trimSpaces = false;
  List<String> extensions = [];
  String customSymbols = '';
  bool lineNumbers = false;
  String fontFamily = 'Roboto';
  bool autoSave = false;
  CompileMode compileMode = CompileMode.debug;
  CompileArch compileArch = CompileArch.arm64;

  EditorSettingsProvider({
    required this.getSettings,
    required this.updateSetting,
  }) {
    load();
  }

  Future<void> load() async {
    final res = await getSettings(NoParams());
    res.fold((_) {}, (s) {
      highlightError = s.highlightError;
      fontLigadures = s.fontLigadures;
      compileMode = s.compileMode;
      compileArch = s.compileArch;
      compileArch = s.compileArch;
      codeBlock = s.codeBlock;
      lineHighlight = s.lineHighlight;
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

  void toggleHighlightError(bool v) {
    highlightError = v;
    _save();
    notifyListeners();
  }

  void toggleAutoComplete(bool v) {
    autoComplete = v;
    _save();
    notifyListeners();
  }

  void toggleCodeBlock(bool v) {
    codeBlock = v;
    _save();
    notifyListeners();
  }

  void toggleLineHighlight(bool v) {
    lineHighlight = v;
    _save();
    notifyListeners();
  }

  void toggleAutoLineBreak(bool v) {
    autoLineBreak = v;
    _save();
    notifyListeners();
  }

  void toggleTrimSpaces(bool v) {
    trimSpaces = v;
    _save();
    notifyListeners();
  }

  void toggleLineNumbers(bool v) {
    lineNumbers = v;
    _save();
    notifyListeners();
  }

  void toggleFontLigadures(bool v) {
    fontLigadures = v;
    _save();
    notifyListeners();
  }

  void toggleAutoSave(bool v) {
    autoSave = v;
    _save();
    notifyListeners();
  }

  // Setters
  void setFontSize(double size) {
    fontSize = size;
    _save();
    notifyListeners();
  }

  void setExtensions(List<String> exts) {
    extensions = List.from(exts);
    _save();
    notifyListeners();
  }

  void setCustomSymbols(String symbols) {
    customSymbols = symbols;
    _save();
    notifyListeners();
  }

  void setFontFamily(String family) {
    fontFamily = family;
    _save();
    notifyListeners();
  }

  void setCompileMode(CompileMode mode) {
    compileMode = mode;
    _save();
    notifyListeners();
  }

  void setCompileArch(CompileArch arch) {
    compileArch = arch;
    _save();
    notifyListeners();
  }

  Future<void> _save() async {
    final s = SettingsEntity(
      fontLigadures: fontLigadures,
      highlightError: highlightError,
      autoComplete: autoComplete,
      compileMode: compileMode,
      compileArch: compileArch,
      codeBlock: codeBlock,
      lineHighlight: lineHighlight,
      fontSize: fontSize,
      autoLineBreak: autoLineBreak,
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
