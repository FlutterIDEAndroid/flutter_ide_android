import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_ide_android/features/onboarding/domain/usecases/get_android_sdk_versions.dart';
import 'package:flutter_ide_android/features/settings/presentation/providers/compile_settings_provider.dart';
import 'package:flutter_ide_android/features/settings/presentation/providers/editor_settings_provider.dart';
import 'package:flutter_ide_android/features/settings/presentation/providers/settings_provider.dart';
import 'package:flutter_ide_android/features/settings/presentation/providers/theme_settings_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/onboarding/data/datasources/sdk_remote_data_source.dart';
import '../features/onboarding/data/repositories/onboarding_repository_impl.dart';
import '../features/onboarding/domain/repositories/onboarding_repository.dart';
import '../features/onboarding/domain/usecases/get_sdk_versions.dart';
import '../features/onboarding/presentation/providers/onboarding_provider.dart';
import '../features/settings/data/datasources/settings_local_data_source.dart';
import '../features/settings/data/models/settings_model.dart';
import '../features/settings/data/repositories/settings_repository_impl.dart';
import '../features/settings/domain/repositories/settings_repository.dart';
import '../features/settings/domain/usecases/get_settings.dart';
import '../features/settings/domain/usecases/save_setting.dart';
import '../features/terminal/data/datasources/terminal_remote_data_source.dart';
import '../features/terminal/data/repositories/terminal_repository_impl.dart';
import '../features/terminal/domain/repositories/terminal_repository.dart';
import '../features/terminal/domain/usecases/execute_command.dart';
import '../features/terminal/presentation/providers/terminal_provider.dart';
import 'network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => prefs);

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [SettingsModelSchema],
    directory: dir.path,
  );
  sl.registerSingleton<Isar>(isar);

  sl.registerLazySingleton<SdkRemoteDataSource>(
    () => SdkRemoteDataSourceImpl(client: sl()),
  );
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(
      remoteDataSource: sl<SdkRemoteDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );
  sl.registerLazySingleton(() => GetSdkVersions(sl()));
  sl.registerLazySingleton(() => GetAndroidSdkVersions(sl()));
  sl.registerFactory(() => OnboardingProvider(
        getSdkVersions: sl(),
        networkInfo: sl(),
        getAndroidSdkVersions: sl(),
      ));

/*   sl.registerFactory(() => EditorProvider());
 */
  // Terminal
  // 1) Registrar o data source
  // --- DataSource ---
  sl.registerLazySingleton<TerminalRemoteDataSource>(
    () => TerminalRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<TerminalRepository>(
    () => TerminalRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton(
    () => ExecuteCommand(repository: sl()),
  );

  sl.registerFactory(
    () => TerminalProvider(
      executeCommand: sl(),
      remoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<SettingsLocalDataSource>(
    () => SettingsLocalDataSourceImpl(isar: sl()),
  );

  sl.registerLazySingleton<SettingsRepository>(
    () => SettingsRepositoryImpl(local: sl()),
  );

  sl.registerLazySingleton(
    () => GetSettings(repository: sl()),
  );
  sl.registerLazySingleton(
    () => SaveSetting(repository: sl()),
  );

  sl.registerFactory(
    () => ThemeSettingsProvider(
      getSettings: sl(),
      updateSetting: sl(),
    ),
  );
  sl.registerFactory(
    () => EditorSettingsProvider(
      getSettings: sl(),
      updateSetting: sl(),
    ),
  );
  sl.registerFactory(
    () => SettingsProvider(
      getSettings: sl(),
      saveSettings: sl(),
    ),
  );
  sl.registerFactory(
    () => CompileSettingsProvider(
      getSettings: sl(),
      updateSetting: sl(),
    ),
  );
}
