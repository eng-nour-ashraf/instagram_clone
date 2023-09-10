import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as gt;
import 'package:instagram_clone/app/alerts/dialog_controller.dart';
import 'package:instagram_clone/app/enum/app_status.dart';
import 'package:instagram_clone/app/fcm/firebase_firestore_controller.dart';
import 'package:instagram_clone/app/fcm/models/fcm_post_model.dart';
import 'package:instagram_clone/app/fcm/models/fcm_user_model.dart';
import 'package:instagram_clone/app/utils/utils_controller.dart';
import 'package:instagram_clone/modules/pages/home/home_controller.dart';
import 'package:instagram_clone/modules/pages/main/main_controller.dart';
import 'package:uuid/uuid.dart';

import '../../../app/fcm/firebase_auth_controller.dart';
import '../../../app/fcm/models/fcm_post_comment_model.dart';
import '../../../app/log/log_controller.dart';

class CommentsController extends gt.GetxController {
  //  controllers
  LogController logController = gt.Get.find();
  FirebaseFireStoreController firebaseFireStoreController = gt.Get.find();
  FirebaseAuthController firebaseAuthController = gt.Get.find();
  HomeController homeController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();
  MainController mainController = gt.Get.find();

  //***************************************************************************************************************

  //  variables
  AppStatus appStatus = AppStatus.init;
  TextEditingController commentEditingController = TextEditingController();
  User? currentUser;
  FCMUserModel? currentUserData;

  //***************************************************************************************************************

  //  getX Ids

  String gtXIDCommentsList = 'Comments-CommentsList';
  String gtXIDCommentsTextField = 'Comments-CommentsTextField';

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? onGetCommentsStream;

  List<FCMPostCommentModel> commentList = [];
  FCMPostModel? postModel;

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.onRed(msg: 'init Comments');
    postModel = gt.Get.arguments!;
    onGetUserData();
    onCommentsStream();
    super.onInit();
  }

  @override
  void onReady() {
    logController.onRed(msg: 'ready Comments');
    super.onReady();
  }

  @override
  void onClose() {
    logController.onRed(msg: 'close Comments');
    commentEditingController.dispose();
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  void onGetUserData() async {
    currentUser = firebaseAuthController.onGetCurrentUserAuth();
    currentUserData = homeController.currentUserData;
  }

  onCommentsStream() {
    appStatus = AppStatus.loading;
    update([gtXIDCommentsList]);
    onGetCommentsStream = firebaseFireStoreController
        .onGetPostComments(postId: postModel!.postId)
        .listen((event) {
      commentList = event.docs
          .map((element) => FCMPostCommentModel.fromSnap(element))
          .toList();
      appStatus = AppStatus.success;
      update([gtXIDCommentsList]);
    });
  }

  onPostComment() async {
    utilsController.onClearFocus();
    String commentId = const Uuid().v1();
    await firebaseFireStoreController.onUploadComments(
        uid: currentUserData!.uid,
        username: currentUserData!.username,
        commentId: commentId,
        postId: postModel!.postId,
        comment: commentEditingController.text,
        profImage: currentUserData!.photoUrl);
    commentEditingController.text = '';
    for (var element in mainController.postList) {
        if(element.postId == postModel!.postId){
          postModel!.commentLen = element.commentLen + 1;
        }
    }
    await firebaseFireStoreController.onUpdatePost(fcmPostModel: postModel!);
  }

  void onCommentChange(String value) {
    update([gtXIDCommentsTextField]);
  }
}
