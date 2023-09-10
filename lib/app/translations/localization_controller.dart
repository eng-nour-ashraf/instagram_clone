import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController {

  // update app local
  void onUpdateAppLocale({required String locale}) =>
      Get.updateLocale(Locale(locale));

  // get device local
  Locale? onGetDeviceLocale() => Get.deviceLocale;

  // get current app local
  Locale? onGetAppLocale() => Get.locale;
}
