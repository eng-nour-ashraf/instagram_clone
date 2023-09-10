import 'package:flutter/material.dart';

import '../assets/assets.dart';
import 'app_colors.dart';




final darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade900,
  primaryColor: AppColor.colorBlack,
  fontFamily: AppAssets.fontFamily,
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(),
    brightness: Brightness.dark
);


final lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: AppColor.colorWhite,
  fontFamily: AppAssets.fontFamily,
  useMaterial3: true,
  colorScheme: const ColorScheme.light(),
  brightness: Brightness.light,
);
