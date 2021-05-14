import './enums.dart';

class Configuration {
  // Changes enviroment. Depends on what do you intent build for.
  static const EnumsEnvironment environment = EnumsEnvironment.Development;

  // Normally at first the system checks google services and uses if it installed.
  // If this variable set to true it skips checking google services and tries to use huawei services.
  static const bool forceToUseHuaweiServices = false;

  // If false, denies to connect to SignalR server
  static const bool signalREnabled = true;

  // If false, denies to receive Silent Push datas
  static const bool silentPushEnabled = true;
}
