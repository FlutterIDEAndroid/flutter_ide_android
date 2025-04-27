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
      return Right(settings);
    } catch (_) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> saveSettings(SettingsEntity settings) async {
    try {
      await local.saveSettings(settings);
      return const Right(null);
    } catch (_) {
      return Left(CacheFailure());
    }
  }
}
