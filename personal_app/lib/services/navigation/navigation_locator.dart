import './navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
void setupGlobalLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
