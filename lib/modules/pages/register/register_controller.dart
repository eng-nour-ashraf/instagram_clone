import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gt;
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/app/alerts/dialog_controller.dart';
import 'package:instagram_clone/app/alerts/snackbar_controller.dart';
import 'package:instagram_clone/app/fcm/firebase_auth_controller.dart';
import 'package:instagram_clone/app/fcm/firebase_firestore_controller.dart';
import 'package:instagram_clone/app/media/image_picker_controller.dart';
import 'package:instagram_clone/app/translations/locale_keys.dart';
import 'package:instagram_clone/app/utils/utils_controller.dart';

import '../../../app/enum/app_status.dart';
import '../../../app/fcm/firebase_storage_controller.dart';
import '../../../app/log/log_controller.dart';
import 'widgets/register_img_dialog.dart';

class RegisterController extends gt.GetxController {
  //  controllers
  LogController logController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();
  DialogController dialogController = gt.Get.find();
  ImagePickerController imagePickerController = gt.Get.find();
  SnackBarController snackBarController = gt.Get.find();
  FirebaseStorageController firebaseStorageController = gt.Get.find();
  FirebaseAuthController firebaseAuthController = gt.Get.find();
  FirebaseFireStoreController firebaseFireStoreController = gt.Get.find();

  //***************************************************************************************************************

  //  variables
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  bool get isValidEmail =>
      utilsController.onIsEmail(email: emailController.text);

  TextEditingController passwordController = TextEditingController();

  bool get isValidPassword => passwordController.text.length >= 6;

  TextEditingController usernameController = TextEditingController();

  bool get isValidUsername => usernameController.text.length >= 6;

  TextEditingController bioController = TextEditingController();

  bool get isValidBio => bioController.text.length >= 6;

  bool isFileImg = false;
  File? fileImage;
  Uint8List? profilePic;

  //***************************************************************************************************************
  // getX Ids

  String gtXIDProfilePic = 'Register-ProfilePic';

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.onRed(msg: 'init Register');
    super.onInit();
  }

  @override
  void onReady() {
    logController.onRed(msg: 'ready Register');
    super.onReady();
  }

  @override
  void onClose() {
    logController.onRed(msg: 'close Register');
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    bioController.dispose();
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  void onRegister() {
    utilsController.onClearFocus();
    if (formKey.currentState!.validate()) {
      if (!isFileImg) {
        snackBarController.onFailedSneakBar(text: LocalKeys.profileError.tr);
      } else {
        onRegisterServer();
      }
    }
  }

  void onLogin() {
    gt.Get.back();
  }

  void onShowImageDialog() {
    dialogController.onGetDialog(
        widget: RegisterImgDialog(
          controller: this,
        ),
        backgroundColor: Colors.white,
        borderRadius: 20);
  }

  void onPickImg(ImageSource source) {
    gt.Get.back();
    imagePickerController.onPickImage(type: source).then((value) async {
      if (value != null) {
        isFileImg = true;
        fileImage = File(value.path);
        update([gtXIDProfilePic]);
        profilePic = await value.readAsBytes();
      }
    });
  }

  Future<void> onRegisterServer() async {
    dialogController.onLoadingDialog();
    try {
      UserCredential userCredential = await firebaseAuthController.onSignUpUser(
          email: emailController.text, password: passwordController.text);
      var profilePicUrl = await firebaseStorageController
          .onUploadProfilePicToStorage(
          file: profilePic!, uid: userCredential.user!.uid);
      await firebaseFireStoreController.onSignUpUser(email: emailController.text,
          password: passwordController.text,
          profileUrl: profilePicUrl,
          username: usernameController.text,
          uid: userCredential.user!.uid,
          bio: bioController.text);
      gt.Get.back();
      snackBarController.onSuccessSneakBar();
    }
    catch (err) {
      gt.Get.back();
      snackBarController.onFailedSneakBar(text: err.toString());
    }
  }
}
