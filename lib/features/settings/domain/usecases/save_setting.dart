import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/settings_entity.dart';
import '../repositories/settings_repository.dart';

class SaveSetting implements UseCase<void, SettingsEntity> {
  final SettingsRepository repository;
  SaveSetting({required this.repository});

  @override
  Future<Either<Failure, void>> call(SettingsEntity settings) {
    return repository.saveSettings(settings);
  }
}
