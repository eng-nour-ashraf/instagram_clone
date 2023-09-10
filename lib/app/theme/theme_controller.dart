import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_theme.dart';


class ThemeController {

  // dark
  void onDarkMode(){
    Get.changeThemeMode(ThemeMode.dark);
    Get.changeTheme(darkTheme);

  }

  // light
  void onLightMode(){
    Get.changeThemeMode(ThemeMode.light);
    Get.changeTheme(lightTheme);
  }

  // system
  void onSystemMode(){
    Get.changeThemeMode(ThemeMode.system);
    Get.isPlatformDarkMode ? onDarkMode() : onLightMode();
  }

  // change from dark to light & light to dark
  void onSwitchDarkLight() => Get.isDarkMode ? onLightMode() : onDarkMode();

  // custom theme
  void onCustomTheme({required ThemeData theme}) => Get.changeTheme(theme);


}