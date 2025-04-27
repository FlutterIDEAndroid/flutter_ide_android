import 'package:flutter/material.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/util/enums.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/usecases/get_settings.dart';
import '../../domain/usecases/save_setting.dart';

class ThemeSettingsProvider extends ChangeNotifier {
  final GetSettings getSettings;
  final SaveSetting updateSetting;

  ThemeOption _selected = ThemeOption.dark;
  ThemeOption get selected => _selected;

  ThemeSettingsProvider(
      {required this.getSettings, required this.updateSetting}) {
    load();
  }

  Future<void> load() async {
    final res = await getSettings(NoParams());
    res.fold(
      (_) {},
      (settings) {
        _selected = settings.themeOption;
        notifyListeners();
      },
    );
  }

  void select(ThemeOption? option) {
    if (option != null) {
      _selected = option;

      _save();
      notifyListeners();
    }
  }

  Future<void> _save() async {
    final settings = SettingsEntity(themeOption: _selected);

    await updateSetting(settings);
  }
}
