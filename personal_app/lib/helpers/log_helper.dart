import 'dart:developer';

class LogHelper {
  static dynamic logException(String file, String action, Exception exception) {
    final String line = '══════════════════════════════════════════════════════════════';
    final String exceptionType = exception.runtimeType.toString();
    final String exceptionMessage = exception.toString();
    final String introMessage = 'Exception Found. Type : $exceptionType';

    log(line);
    log(introMessage);
    log('- An error occured in File : $file Action : $action().');
    log('- Exception Message: $exceptionMessage');
    log(line);
  }

  static dynamic logError(String file, String action, String message) {
    final String line = '═══\$════\$═════════\$═════════════\$══════════════════════════';
    final String introMessage = 'Custom Exception Found.';

    log(line);
    log(introMessage);
    log('- Unexpected ERROR occured in File : $file Action : $action().');
    log('- ERROR Log Message: $message');
    log(line);
  }

  static dynamic logMessage(String file, String action, String message) {
    final String line = '═══LOG════LOG═════════LOG═════════════LOG══════════════════════════';
    final String introMessage = 'Custom LOG Message';

    log(line);
    log(introMessage);
    log('- LOG: $file Action : $action().');
    log('- Log Message: $message');
    log(line);
  }

}
