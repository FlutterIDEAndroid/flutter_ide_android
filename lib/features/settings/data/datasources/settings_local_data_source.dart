import 'package:isar/isar.dart';

import '../../../../core/util/enums.dart';
import '../../domain/entities/settings_entity.dart';
import '../models/settings_model.dart';

abstract class SettingsLocalDataSource {
  Future<SettingsEntity> getSettings();
  Future<void> saveSettings(SettingsEntity settings);
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final Isar isar;
  SettingsLocalDataSourceImpl({required this.isar});

  @override
  Future<SettingsEntity> getSettings() async {
    final model = await isar.settingsModels.where().findFirst();
    if (model != null) return model.toEntity();
    return SettingsModel(
      fontLigadures: false,
      themeOption: ThemeOption.dark,
      highlightError: false,
      autoComplete: false,
      codeBlock: false,
      lineHighlight: false,
      fontSize: 14.0,
      autoLineBreak: true,
      trimSpaces: false,
      extensions: [],
      customSymbols: '',
      lineNumbers: true,
      fontFamily: 'Roboto',
      autoSave: false,
      compilePlatforms: [CompilePlatform.android],
      compileMode: CompileMode.debug,
      compileArch: CompileArch.arm64,
    );
  }

  @override
  Future<void> saveSettings(SettingsEntity settings) async {
    final model = SettingsModel.fromEntity(settings);
    await isar.writeTxn(() => isar.settingsModels.put(model));
  }
}
