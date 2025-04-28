import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/settings_entity.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_local_data_source.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource local;
  SettingsRepositoryImpl({required this.local});

  @override
  Future<Either<Failure, SettingsEntity>> getSettings() async {
    try {
      final settings = await local.getSettings();
      print(settings.themeOption);
      return Right(settings);
    } catch (f) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, SettingsEntity>> saveSettings(
      SettingsEntity settings) async {
    try {
      // local.saveSettings não retorna void, mas a entidade
      final saved = await local.saveSettings(settings);

      // Atenção: remova o `const` aqui, pois `saved` não é constante
      return Right(saved);
    } catch (_) {
      return Left(CacheFailure());
    }
  }
}
