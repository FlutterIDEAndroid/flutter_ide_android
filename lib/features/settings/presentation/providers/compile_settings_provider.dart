import 'package:flutter/material.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/enums.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/usecases/get_settings.dart';
import '../../domain/usecases/save_setting.dart';

class CompileSettingsProvider extends ChangeNotifier {
  final GetSettings getSettings;
  final SaveSetting updateSetting;

  List<CompilePlatform> platforms = [];
  CompileMode mode = CompileMode.debug;
  CompileArch arch = CompileArch.arm;
  List<String> extensions = [];
  CompileSettingsProvider(
      {required this.getSettings, required this.updateSetting}) {
    load();
  }

  Future<void> load() async {
    final res = await getSettings(NoParams());
    res.fold((_) {}, (s) {
      platforms = s.compilePlatforms;
      mode = s.compileMode;
      arch = s.compileArch;
      extensions = List.from(s.extensions);
      notifyListeners();
    });
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
    mode = m;
    _save();
    notifyListeners();
  }

  void selectArch(CompileArch a) {
    arch = a;
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
    final s = SettingsEntity(
        compilePlatforms: platforms,
        compileMode: mode,
        compileArch: arch,
        extensions: extensions);
    await updateSetting(s);
  }
}
