import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gt;
import 'package:instagram_clone/app/alerts/dialog_controller.dart';
import 'package:instagram_clone/app/routes/app_routes.dart';
import 'package:instagram_clone/app/utils/utils_controller.dart';

import '../../../app/alerts/snackbar_controller.dart';
import '../../../app/enum/app_status.dart';
import '../../../app/fcm/firebase_auth_controller.dart';
import '../../../app/log/log_controller.dart';


class LoginController extends gt.GetxController {

  //  controllers
  LogController logController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();
  DialogController dialogController = gt.Get.find();
  SnackBarController snackBarController = gt.Get.find();
  FirebaseAuthController firebaseAuthController = gt.Get.find();

  //***************************************************************************************************************

  //  variables
  AppStatus appStatus = AppStatus.init;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool get isValidEmail => utilsController.onIsEmail(email: emailController.text);

  TextEditingController passwordController = TextEditingController();
  bool get isValidPassword => passwordController.text.length >= 6;

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.onRed(msg: 'init Login');
    super.onInit();
  }

  @override
  void onReady() {
    logController.onRed(msg: 'ready Login');
    super.onReady();
  }

  @override
  void onClose() {
    logController.onRed(msg: 'close Login');
    passwordController.dispose();
    emailController.dispose();
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  void onLogin(){
    utilsController.onClearFocus();
    if (formKey.currentState!.validate()) {
      onLoginServer();
    }
  }

  void onRegister(){
    gt.Get.toNamed(Routes.register);
  }

  Future<void> onLoginServer() async {
    dialogController.onLoadingDialog();
    try {
      await firebaseAuthController.onSignInUser(
          email: emailController.text, password: passwordController.text);
      gt.Get.back();
      snackBarController.onSuccessSneakBar();
      gt.Get.offAllNamed(Routes.home);
    }
    catch (err) {
      gt.Get.back();
      snackBarController.onFailedSneakBar(text: err.toString());
    }
  }

}
