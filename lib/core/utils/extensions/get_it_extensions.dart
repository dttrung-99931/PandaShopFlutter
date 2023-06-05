import 'package:get_it/get_it.dart';

extension GetItEx on GetIt {
  void registerSingletonIfNot<T extends Object>(T instance) {
    if (!isRegistered<T>()) {
      registerSingleton(instance);
    }
  }

  void registerLazySingletonIfNot<T extends Object>(T Function() factoryFunc) {
    if (!isRegistered<T>()) {
      registerLazySingleton(factoryFunc);
    }
  }
}
