import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gt;
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/app/alerts/dialog_controller.dart';
import 'package:instagram_clone/app/fcm/firebase_storage_controller.dart';
import 'package:instagram_clone/app/fcm/models/fcm_post_model.dart';
import 'package:instagram_clone/app/media/image_picker_controller.dart';
import 'package:instagram_clone/modules/pages/add_post/widgets/add_post_img_dialog.dart';
import 'package:instagram_clone/modules/pages/home/home_controller.dart';
import 'package:uuid/uuid.dart';

import '../../../app/alerts/snackbar_controller.dart';
import '../../../app/fcm/firebase_auth_controller.dart';
import '../../../app/fcm/firebase_firestore_controller.dart';
import '../../../app/fcm/models/fcm_user_model.dart';
import '../../../app/log/log_controller.dart';

class AddPostController extends gt.GetxController {
  //  controllers
  LogController logController = gt.Get.find();
  ImagePickerController imagePickerController = gt.Get.find();
  DialogController dialogController = gt.Get.find();
  FirebaseAuthController firebaseAuthController = gt.Get.find();
  FirebaseFireStoreController firebaseFireStoreController = gt.Get.find();
  FirebaseStorageController firebaseStorageController = gt.Get.find();
  SnackBarController snackBarController = gt.Get.find();
  HomeController homeController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  bool isFileImg = false;
  File? fileImage;
  Uint8List? postPic;

  User? currentUser;
  FCMUserModel? currentUserData;
  TextEditingController captionTextEditingController = TextEditingController();

  //***************************************************************************************************************
  // getX Ids

  String gtXIDChooseImg = 'AddPost-ChooseImg';

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.onRed(msg: 'init AddPost');
    onGetUserData();
    super.onInit();
  }

  @override
  void onReady() {
    logController.onRed(msg: 'ready AddPost');
    super.onReady();
  }

  @override
  void onClose() {
    logController.onRed(msg: 'close AddPost');
    captionTextEditingController.dispose();
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  void onShowImageDialog() {
    dialogController.onGetDialog(
        widget: AddPostImgDialog(
          controller: this,
        ),
        backgroundColor: Colors.black,
        borderRadius: 20);
  }

  void onPickImg(ImageSource source) {
    gt.Get.back();
    imagePickerController.onPickImage(type: source).then((value) async {
      if (value != null) {
        isFileImg = true;
        fileImage = File(value.path);
        update([gtXIDChooseImg]);
        postPic = await value.readAsBytes();
      }
    });
  }

  void onGetUserData() async {
    currentUser = firebaseAuthController.onGetCurrentUserAuth();
    currentUserData = homeController.currentUserData;
  }

  void onClearImg() {
    isFileImg = false;
    fileImage = null;
    postPic = null;
    captionTextEditingController.text = '';
    update([gtXIDChooseImg]);
  }

  Future<void> onPost() async {
    dialogController.onLoadingDialog();
    try {
      String postId = const Uuid().v1();
      var postUrl = await firebaseStorageController.onUploadPostToStorage(
          file: postPic!, uid: currentUser!.uid, postId: postId);

      await firebaseFireStoreController.onUploadPost(
          description: captionTextEditingController.text,
          uid: currentUserData!.uid,
          username: currentUserData!.username,
          postId: postId,
          postUrl: postUrl,
          profImage: currentUserData!.photoUrl);

      gt.Get.back();
      snackBarController.onSuccessSneakBar();
      onClearImg();
    } catch (err) {
      gt.Get.back();
      snackBarController.onFailedSneakBar(text: err.toString());
    }
  }
}
