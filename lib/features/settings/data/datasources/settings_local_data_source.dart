import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/settings_entity.dart';
import '../models/settings_model.dart';

abstract class SettingsLocalDataSource {
  Future<SettingsEntity> getSettings();
  Future<SettingsEntity> saveSettings(SettingsEntity settings);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  static const _settingsKey = 'setting';
  // SharedPreferences prefs;

  SettingsLocalDataSourceImpl(/* {required this.prefs} */);

  @override
  Future<SettingsEntity> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_settingsKey);
    if (json == null) {
      //  print('null');
      return SettingsModel();
    } else {
      //  print(json);
      return SettingsEntity.fromJson(json);
    }
  }

  @override
  Future<SettingsEntity> saveSettings(SettingsEntity settings) async {
    /*   final prefs = await SharedPreferences.getInstance();
    final model = SettingsModel.fromEntity(settings);
    final jsonString = json.encode(model.toJson());
    await prefs.setString(_settingsKey, jsonString); */
    // devolve a entidade salva
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_settingsKey, settings.toJson());
    // print(settings);
    // print(settings.toJson());
    return settings;
  }
}
