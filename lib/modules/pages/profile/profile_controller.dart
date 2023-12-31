import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart' as gt;
import 'package:instagram_clone/app/enum/app_status.dart';
import 'package:instagram_clone/app/fcm/firebase_auth_controller.dart';
import 'package:instagram_clone/app/fcm/firebase_firestore_controller.dart';
import 'package:instagram_clone/app/fcm/models/fcm_post_model.dart';
import 'package:instagram_clone/app/fcm/models/fcm_user_model.dart';
import 'package:instagram_clone/app/routes/app_routes.dart';
import 'package:instagram_clone/app/utils/utils_controller.dart';

import '../../../app/alerts/snackbar_controller.dart';
import '../../../app/log/log_controller.dart';

class ProfileController extends gt.GetxController {
  //  controllers
  LogController logController = gt.Get.find();
  FirebaseAuthController firebaseAuthController = gt.Get.find();
  FirebaseFireStoreController firebaseFireStoreController = gt.Get.find();
  SnackBarController snackBarController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  late FCMUserModel currentUserModel;
  late FCMUserModel appUserModel;
  User? currentUser;
  AppStatus appStatus = AppStatus.init;
  AppStatus appStatus2 = AppStatus.init;
  List<FCMPostModel> postList = [];
  late StreamSubscription<QuerySnapshot<Map<String, dynamic>>>
      onGetUsersPostsStream;

  //***************************************************************************************************************

  //  getX Ids

  String gtXIDProfileInfo = 'Profile-Info';
  String gtXIDProfileList = 'Profile-List';

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.onRed(msg: 'init Profile');
    onGetAppUser();
    super.onInit();
  }

  @override
  void onReady() {
    logController.onRed(msg: 'ready Profile');
    super.onReady();
  }

  @override
  void onClose() {
    logController.onRed(msg: 'close Profile');
    onGetUsersPostsStream.cancel();
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  Future<void> onSignOut() async {
    try {
      await firebaseAuthController.onSignOut();
      gt.Get.deleteAll();
      gt.Get.toNamed(Routes.login);
    } catch (err) {
      snackBarController.onFailedSneakBar(text: err.toString());
    }
  }

  Future<void> onGetUsersPosts() async {
    try {
      appStatus2 = AppStatus.loading;
      update([gtXIDProfileList]);
      onGetUsersPostsStream = firebaseFireStoreController
          .onGetUserPosts(uid: currentUserModel.uid)
          .listen((event) {
        postList = event.docs
            .map((element) => FCMPostModel.fromSnap(element))
            .toList();
        appStatus2 = AppStatus.success;
        update([gtXIDProfileList, gtXIDProfileInfo]);
      });
      appStatus2 = AppStatus.success;
      update([gtXIDProfileList]);
    } catch (err) {
      appStatus2 = AppStatus.failed;
      update([gtXIDProfileList]);
    }
  }

  Future<void> onGetAppUser() async {
    try {
      appStatus = AppStatus.loading;
      update([gtXIDProfileInfo]);
      currentUser = firebaseAuthController.onGetCurrentUserAuth();
      appUserModel = await firebaseFireStoreController.onGetUserData(
          uid: currentUser!.uid);
      currentUserModel = appUserModel;
      appStatus = AppStatus.success;
      update([gtXIDProfileInfo]);
      onGetUsersPosts();
    } catch (err) {
      snackBarController.onFailedSneakBar(text: err.toString());
    }
  }
}
