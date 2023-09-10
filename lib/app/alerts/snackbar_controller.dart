import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/app_colors.dart';
import '../translations/locale_keys.dart';


class SnackBarController {
  //Show Get SnackBar
  void onGetSnackBar({
    String title = '',
    String message = '',
    Widget? messageText,
    Widget? titleText,
    Widget? icon,
    double margin = 10,
    int duration = 1500,
    bool noMsg = true,
    double barBlur = 7,
    double overlayBlur = 0,
    double borderRadius = 15,
    SnackPosition position = SnackPosition.BOTTOM,
    Color colorText = Colors.black,
    Color? backgroundColor,
  }) {
    Get.snackbar(
      title,
      message,
      messageText: noMsg ? Container() : messageText,
      margin: EdgeInsets.all(margin),
      duration: Duration(milliseconds: duration),
      snackPosition: position,
      icon: icon,
      titleText: titleText,
      barBlur: barBlur,
      overlayBlur: overlayBlur,
      borderRadius: borderRadius,
      colorText: colorText,
      backgroundColor: backgroundColor,
    );
  }

  //Show Success SneakBar
  onSuccessSneakBar({String? text}) {
    onGetSnackBar(
        title: text ?? LocalKeys.success.tr,
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: AppColor.colorWhite,
        icon: const Icon(
          Icons.check_circle_rounded,
          color: AppColor.colorWhite,
          size: 25,
        ),
        barBlur: 3);
  }

  //Show Notification SneakBar
  onNotificationSneakBar({required String text, required String des}) {
    onGetSnackBar(
        duration: 2000,
        message: des,
        messageText: Text(
          des,
          style: const TextStyle(
              color: AppColor.colorWhite,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        noMsg: false,
        title: text,
        position: SnackPosition.TOP,
        backgroundColor: Colors.orange.withOpacity(0.8),
        colorText: AppColor.colorWhite,
        icon: const Icon(
          Icons.notifications_active_rounded,
          color: AppColor.colorWhite,
          size: 25,
        ),
        barBlur: 3);
  }
  //Show Error SneakBar
  onFailedSneakBar({String? text}) {
    onGetSnackBar(
        title: text ?? LocalKeys.failed.tr,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: AppColor.colorWhite,
        icon: const Icon(
          Icons.cancel_rounded,
          color: AppColor.colorWhite,
          size: 25,
        ),
        barBlur: 3);
  }

  //Show Normal SnackBar
  void onNormalSnackBar(
      {required BuildContext context, required String message}) {
    var snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
