import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/general_widgets/app_loading.dart';
import '../theme/app_colors.dart';
import '../translations/locale_keys.dart';


class DialogController {

  // Show Loading Dialog
  onLoadingDialog({String text = LocalKeys.loading, bool noBack = true}) {
    onGetDialog(
        widget: AppLoadingWidget(
          withText: true,
          color: Colors.black,
          text: text,
        ),
        noBack: noBack,
        backgroundColor: AppColor.colorWhite,
        borderRadius: 20);
  }


  //Show Custom Dialog
  void onGetDialog({
    double borderRadius = 0,
    Color? backgroundColor,
    required Widget widget,
    bool noBack = false,
  }) {
    Get.defaultDialog(
        titlePadding: EdgeInsets.zero,
        onWillPop: noBack ? _onWillPop : null,
        content: widget,
        title: '',
        backgroundColor: backgroundColor,
        radius: borderRadius);
  }

  //remove back action from dialog
  Future<bool> _onWillPop() async {
    return false;
  }

  //Show Bottom Sheet Dialog
  void onGetBottomSheet({
    required Widget widget,
    double elevation = 0,
    bool enableDrag = true,
    bool ignoreSafeArea = false,
    bool isDismissible = true,
  }) {
    Get.bottomSheet(
      widget,
      isDismissible: isDismissible,
      isScrollControlled: true,
      ignoreSafeArea: ignoreSafeArea,
      enableDrag: enableDrag,
      elevation: elevation,
    );
  }

  //Show Alert Dialog
  void onGetAlertDialog({
    required Color backgroundColor,
    double borderRadius = 0,
    required Color cancelTextColor,
    required Color confirmTextColor,
    required Color confirmButtonColor,
    String title = '',
    String message = '',
    required Function() onCancel,
    required Function() onConfirm,
    required String textCancel,
    required String textConfirm,
  }) {
    Get.defaultDialog(
      radius: borderRadius,
      buttonColor: confirmButtonColor,
      backgroundColor: backgroundColor,
      title: title,
      middleText: message,
      onCancel: onCancel,
      onConfirm: onConfirm,
      cancelTextColor: cancelTextColor,
      confirmTextColor: confirmTextColor,
      textCancel: textCancel,
      textConfirm: textConfirm,
    );
  }


  // Show Normal Dialog
  onNormalDialog({required EdgeInsets padding,required BuildContext context,required Widget child}){
    showDialog(context: context, builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: padding,
        child: child,
      );
    });
  }
}
