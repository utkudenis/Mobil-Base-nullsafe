import 'package:flutter/material.dart';

import '../common/localization/localization.dart';

String localize(BuildContext context, String key) {
  return Localization.of(context).getTranslatedValue(key);
}
