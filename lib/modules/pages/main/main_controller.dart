import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gt;
import 'package:instagram_clone/app/alerts/dialog_controller.dart';
import 'package:instagram_clone/app/enum/app_status.dart';
import 'package:instagram_clone/app/fcm/firebase_auth_controller.dart';
import 'package:instagram_clone/app/fcm/firebase_firestore_controller.dart';
import 'package:instagram_clone/app/fcm/models/fcm_post_model.dart';
import 'package:instagram_clone/app/models/dropdown_model.dart';
import 'package:instagram_clone/app/routes/app_routes.dart';
import 'package:instagram_clone/app/utils/utils_controller.dart';
import 'package:instagram_clone/modules/pages/main/widgets/main_delete_dialog.dart';

import '../../../app/alerts/snackbar_controller.dart';
import '../../../app/fcm/firebase_storage_controller.dart';
import '../../../app/log/log_controller.dart';
import '../../../app/translations/locale_keys.dart';

class MainController extends gt.GetxController {
  //  controllers
  LogController logController = gt.Get.find();
  FirebaseStorageController firebaseStorageController = gt.Get.find();
  FirebaseFireStoreController firebaseFireStoreController = gt.Get.find();
  FirebaseAuthController firebaseAuthController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();
  DialogController dialogController = gt.Get.find();
  SnackBarController snackBarController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  AppStatus appStatus = AppStatus.init;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? onGetPostsStream;
  List<FCMPostModel> postList = [];
  User? currentUser;
  double likeOpacity = 0.0;
  double likeScale = 1.0;
  List<DropDownModel> popUpMenu = [];

  //***************************************************************************************************************

  //  getX Ids

  String gtXIDPostList = 'Main-PostList';
  String gtXIDPostItem = 'Main-PostItem';

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.onRed(msg: 'init Main');
    onInitPopUpMenu();
    onPostStream();
    onGetUserData();
    super.onInit();
  }

  @override
  void onReady() {
    logController.onRed(msg: 'ready Main');
    super.onReady();
  }

  @override
  void onClose() {
    logController.onRed(msg: 'close Main');
    onGetPostsStream!.cancel();
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  onPostStream() {
    appStatus = AppStatus.loading;
    update([gtXIDPostList]);
    onGetPostsStream = firebaseFireStoreController.onGetPosts().listen((event) {
      postList =
          event.docs.map((element) => FCMPostModel.fromSnap(element)).toList();
      appStatus = AppStatus.success;
      update([gtXIDPostList]);
    });
  }

  void onGetUserData() async {
    currentUser = firebaseAuthController.onGetCurrentUserAuth();
  }

  onLikePost({required FCMPostModel fcmPostModel, required isDouble}) async {
    if (isDouble) {
      likeOpacity = 1;
    }
    likeScale = 1.2;
    update(['$gtXIDPostItem${fcmPostModel.postId}']);
    await Future.delayed(const Duration(milliseconds: 400));
    likeOpacity = 0;
    likeScale = 1.0;
    update(['$gtXIDPostItem${fcmPostModel.postId}']);
    onUpdatePost(fcmPostModel: fcmPostModel);
  }

  void onUpdatePost({required FCMPostModel fcmPostModel}) {
    FCMPostModel newModel = fcmPostModel;
    if (newModel.likes.contains(currentUser!.uid)) {
      newModel.likes.remove(currentUser!.uid);
    } else {
      newModel.likes.add(currentUser!.uid);
    }
    firebaseFireStoreController.onUpdatePost(fcmPostModel: newModel);
  }

  void onComments({required FCMPostModel fcmPostModel}) {
    gt.Get.toNamed(Routes.comments, arguments: fcmPostModel);
  }

  void onInitPopUpMenu() {
    var modelDelete = DropDownModel(icon: Icons.delete_forever, text: LocalKeys.delete.tr, id: 1);
    popUpMenu.add(modelDelete);
  }

  void onPopMenuPress({required Object? popId,required String postId}){
    if(popId == 1){
      onDeletePostDialog(postId : postId);
    }
  }

  void onDeletePostDialog({required String postId}) {
    dialogController.onGetDialog(
        widget: MainDeleteDialog(
          controller: this,
          postId : postId,
        ),
        backgroundColor: Colors.white,
        borderRadius: 20);
  }

  Future<void> onDeletePost({required String postId}) async {
    gt.Get.back();
    dialogController.onLoadingDialog();
    try {
      await firebaseStorageController.onDeletePostImgFromStorage(uid: currentUser!.uid, postId: postId);
      await firebaseFireStoreController.onDeletePost(postId: postId,);
      gt.Get.back();
      snackBarController.onSuccessSneakBar();
    } catch (err) {
      gt.Get.back();
      snackBarController.onFailedSneakBar(text: err.toString());
    }
  }

  void onBack() {
    gt.Get.back();
  }


}
