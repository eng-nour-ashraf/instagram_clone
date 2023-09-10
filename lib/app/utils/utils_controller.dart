
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class UtilsController {

  //Screen Width
  double onGetWidth({double dividedBy = 1}) => Get.width / dividedBy;

  //Screen High
  double onGetHigh({double dividedBy = 1}) => Get.height / dividedBy;

  //Email Validators
  bool onIsEmail({required String email}) => GetUtils.isEmail(email);

  //Url Validators
  bool onIsUrl({required String url}) => GetUtils.isURL(url);

  //Username Validators
  bool onIsUsername({required String username}) => GetUtils.isUsername(username);

  //DateTime Validators
  bool onIsDateTime({required String date}) => GetUtils.isDateTime(date);

  //Num Validators
  bool onIsNum({required String num}) => GetUtils.isNum(num);

  //Phone Validators
  bool onIsPhone({required String phone}) => GetUtils.isPhoneNumber(phone);

  //Matching Validators
  bool onIsMatch({required String text, required String pattern}) =>
      GetUtils.hasMatch(text, pattern);

  //Platform Validators
  bool onIsAndroid() => GetPlatform.isAndroid;

  //Clear Focus Node
  void onClearFocus() => FocusManager.instance.primaryFocus?.unfocus();

  //Landscape Validators
  bool onIsLandscape(BuildContext context) => context.isLandscape;

  //Tablet Validators
  bool onIsTablet(BuildContext context) => context.isTablet;

  //File
  Future<File> onFile({required String path,required String fileName}) async {
    final bytes = await rootBundle.load(path);
    final list = bytes.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/$fileName').create();
    file.writeAsBytesSync(list);
    return file;
  }
}
