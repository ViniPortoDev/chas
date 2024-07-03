import 'package:chas/src/controller/teas_controller.dart';
import 'package:chas/src/repositories/teas_local_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupProviders() {
  getIt.registerLazySingleton<TeasLocalRepository>(() => TeasLocalRepository());
  getIt.registerLazySingleton<TeasController>(
      () => TeasController(repository: getIt<TeasLocalRepository>()));
}
