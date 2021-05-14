
import '../common/configuration.dart';
import '../common/enums.dart';
import '../environment/environments/production_environment.dart';
import '../environment/environments/test_environment.dart';

import 'environments/development_environment.dart';

abstract class Environment {
   factory Environment.getEnvironment() {
    EnumsEnvironment environment = Configuration.environment;

    switch (environment) {
      case EnumsEnvironment.Development:
        return DevelopmentEnvironment();
        break;
      case EnumsEnvironment.Test:
        return TestEnvironment();
        break;
      case EnumsEnvironment.Production:
        return ProductionEnvironment();
        break;
      default:
        throw Exception("Environment file is not found for $environment");
    }
  }

  String get apiBaseUrl;
  String get apiSignalRUrl;

  // for upgrader
  String get upgraderGoogleXmlLink;
  String get upgraderHuaweiXmlLink;
}
