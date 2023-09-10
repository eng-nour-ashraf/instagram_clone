import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart' as gt;
import 'package:instagram_clone/app/enum/app_status.dart';
import 'package:instagram_clone/app/fcm/firebase_auth_controller.dart';
import 'package:instagram_clone/app/fcm/firebase_firestore_controller.dart';
import 'package:instagram_clone/app/fcm/models/fcm_post_model.dart';
import 'package:instagram_clone/app/routes/app_routes.dart';
import 'package:instagram_clone/app/utils/utils_controller.dart';

import '../../../app/log/log_controller.dart';

class MainController extends gt.GetxController {
  //  controllers
  LogController logController = gt.Get.find();
  FirebaseFireStoreController firebaseFireStoreController = gt.Get.find();
  FirebaseAuthController firebaseAuthController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  AppStatus appStatus = AppStatus.init;
  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? onGetPostsStream;
  List<FCMPostModel> postList = [];
  User? currentUser;
  double likeOpacity = 0.0;
  double likeScale = 1.0;


  //***************************************************************************************************************

  //  getX Ids

  String gtXIDPostList = 'Main-PostList';
  String gtXIDPostItem = 'Main-PostItem';




  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.onRed(msg: 'init Main');
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


  onLikePost({required FCMPostModel fcmPostModel,required isDouble}) async {
    if(isDouble){
      likeOpacity = 1;
    }
    likeScale = 1.2;
    update(['$gtXIDPostItem${fcmPostModel.postId}']);
    await Future.delayed(const Duration(milliseconds: 400));
    likeOpacity = 0;
    likeScale = 1.0;
    update(['$gtXIDPostItem${fcmPostModel.postId}']);
    onUpdatePost(fcmPostModel : fcmPostModel);

  }

  void onUpdatePost({required FCMPostModel fcmPostModel}) {
    FCMPostModel newModel = fcmPostModel;
    if(newModel.likes.contains(currentUser!.uid)){
        newModel.likes.remove(currentUser!.uid);
    }else{
      newModel.likes.add(currentUser!.uid);
    }
    firebaseFireStoreController.onUpdatePost(fcmPostModel: newModel);
  }

  void onComments({required FCMPostModel fcmPostModel}){
    gt.Get.toNamed(Routes.comments,arguments: fcmPostModel);
  }
}
