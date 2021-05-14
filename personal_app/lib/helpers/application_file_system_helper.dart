// Packages
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ApplicationFileSystemHelper {
  static dynamic temporaryDirectory() async => await getTemporaryDirectory();
  static dynamic applicationSupportDirectory() async => await getApplicationSupportDirectory();

  static Future<void> deleteTemporaryDirectory() async {
    final cacheDir = await getTemporaryDirectory();
    final file = File(cacheDir.path);
    final isExists = file.existsSync();
    if (isExists) {
      file.deleteSync(recursive: true);
    }
  }

  static Future<void> deleteApplicationSupportDirectory() async {
    final appDir = await getApplicationSupportDirectory();
    final file = File(appDir.path);
    final isExists = file.existsSync();
    if (isExists) {
      file.deleteSync(recursive: true);
    }
  }
}
