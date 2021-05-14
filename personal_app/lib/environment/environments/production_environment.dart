import '../environment.dart';

class ProductionEnvironment implements Environment {
  String apiBaseUrl = '';
  String apiSignalRUrl = '';

  // for upgrader
  String upgraderGoogleXmlLink = "";
  String upgraderHuaweiXmlLink = "";
}
