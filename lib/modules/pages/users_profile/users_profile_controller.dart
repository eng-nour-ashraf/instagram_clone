import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart' as gt;
import 'package:instagram_clone/app/enum/app_status.dart';
import 'package:instagram_clone/app/fcm/firebase_auth_controller.dart';
import 'package:instagram_clone/app/fcm/firebase_firestore_controller.dart';
import 'package:instagram_clone/app/fcm/models/fcm_post_model.dart';
import 'package:instagram_clone/app/fcm/models/fcm_user_model.dart';
import 'package:instagram_clone/app/utils/utils_controller.dart';
import 'package:instagram_clone/modules/pages/profile/profile_controller.dart';

import '../../../app/alerts/snackbar_controller.dart';
import '../../../app/log/log_controller.dart';
import '../../../app/routes/app_routes.dart';

class UsersProfileController extends gt.GetxController {
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

  String gtXIDUsersProfileInfo = 'UsersProfile-Info';
  String gtXIDUsersProfileList = 'UsersProfile-List';

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.onRed(msg: 'init Users Profile');
    onGetAppUser();
    super.onInit();
  }

  @override
  void onReady() {
    logController.onRed(msg: 'ready Users Profile');
    super.onReady();
  }

  @override
  void onClose() {
    logController.onRed(msg: 'close Users Profile');
    onGetUsersPostsStream.cancel();
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  void onFollow() async {
    if (appUserModel.following.contains(currentUserModel.uid)) {
      appUserModel.following.remove(currentUserModel.uid);
      currentUserModel.followers.remove(appUserModel.uid);
    } else {
      appUserModel.following.add(currentUserModel.uid);
      currentUserModel.followers.add(appUserModel.uid);
    }
    try {
      await firebaseFireStoreController.onUpdateUser(
          fcmUserModel: appUserModel);
      await firebaseFireStoreController.onUpdateUser(
          fcmUserModel: currentUserModel);
      ProfileController profileController = gt.Get.find();
      profileController.onGetAppUser();
      update([gtXIDUsersProfileInfo]);
    } catch (err) {
      snackBarController.onFailedSneakBar(text: err.toString());
    }
  }

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
      update([gtXIDUsersProfileList]);
      onGetUsersPostsStream = firebaseFireStoreController
          .onGetUserPosts(uid: currentUserModel.uid)
          .listen((event) {
        postList = event.docs
            .map((element) => FCMPostModel.fromSnap(element))
            .toList();
        appStatus2 = AppStatus.success;
        update([gtXIDUsersProfileList, gtXIDUsersProfileInfo]);
      });
      appStatus2 = AppStatus.success;
      update([gtXIDUsersProfileList]);
    } catch (err) {
      appStatus2 = AppStatus.failed;
      update([gtXIDUsersProfileList]);
    }
  }

  Future<void> onGetAppUser() async {
    try {
      appStatus = AppStatus.loading;
      update([gtXIDUsersProfileInfo]);
      currentUser = firebaseAuthController.onGetCurrentUserAuth();
      appUserModel = await firebaseFireStoreController.onGetUserData(
          uid: currentUser!.uid);
      currentUserModel = gt.Get.arguments as FCMUserModel;
      currentUserModel = await firebaseFireStoreController.onGetUserData(
          uid: currentUserModel.uid);
      appStatus = AppStatus.success;
      update([gtXIDUsersProfileInfo]);
      onGetUsersPosts();
    } catch (err) {
      snackBarController.onFailedSneakBar(text: err.toString());
    }
  }
}
