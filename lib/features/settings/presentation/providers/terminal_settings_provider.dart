import 'package:flutter/material.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/usecases/get_settings.dart';
import '../../domain/usecases/save_setting.dart';

class TerminalSettingsProvider extends ChangeNotifier {
  final GetSettings getSettings;
  final SaveSetting updateSetting;

  bool _useSystemShell = false;
  bool get useSystemShell => _useSystemShell;
  TerminalSettingsProvider({
    required this.getSettings,
    required this.updateSetting,
  }) {
    load();
  }

  Future<void> load() async {
    final res = await getSettings(NoParams());
    res.fold((_) {}, (s) {
      _useSystemShell = s.useSystemShell;
      notifyListeners();
    });
  }

  void toggleUseSystemShell(bool v) {
    _useSystemShell = v;
    _save();
    notifyListeners();
  }

  Future<void> _save() async {
    final s = SettingsEntity(
      useSystemShell: _useSystemShell,
    );
    await updateSetting(s);
  }
}
