import 'package:flutter/material.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/usecases/get_settings.dart';
import '../../domain/usecases/save_setting.dart';

class SettingsProvider extends ChangeNotifier {
  final GetSettings getSettings;
  final SaveSetting saveSettings;

  SettingsEntity _settings;
  bool _isLoading = false;
  String? _error;

  SettingsProvider({
    required this.getSettings,
    required this.saveSettings,
  }) : _settings = throw UnimplementedError();

  SettingsEntity get settings => _settings;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadSettings() async {
    _isLoading = true;
    notifyListeners();
    final result = await getSettings(NoParams());
    result.fold(
      (f) => _error = 'Erro ao carregar',
      (s) => _settings = s,
    );
    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateSettings(SettingsEntity newSettings) async {
    _isLoading = true;
    notifyListeners();
    final result = await saveSettings(newSettings);
    result.fold(
      (f) => _error = 'Erro ao salvar',
      (_) => _settings = newSettings,
    );
    _isLoading = false;
    notifyListeners();
  }
}
