import '../environment.dart';

class DevelopmentEnvironment implements Environment {
  String apiBaseUrl = '';
  String apiSignalRUrl = '';

  // for upgrader
  String upgraderGoogleXmlLink = "";
  String upgraderHuaweiXmlLink = "";
}
