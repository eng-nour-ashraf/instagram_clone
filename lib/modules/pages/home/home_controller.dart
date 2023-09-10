import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as gt;
import 'package:instagram_clone/app/fcm/models/fcm_user_model.dart';
import 'package:instagram_clone/modules/pages/add_post/add_post_view.dart';
import 'package:instagram_clone/modules/pages/main/main_view.dart';
import 'package:instagram_clone/modules/pages/profile/profile_view.dart';
import 'package:instagram_clone/modules/pages/search/search_view.dart';

import '../../../app/fcm/firebase_auth_controller.dart';
import '../../../app/fcm/firebase_firestore_controller.dart';
import '../../../app/log/log_controller.dart';
import '../favourite/favourite_view.dart';

class HomeController extends gt.GetxController {
  //  controllers
  LogController logController = gt.Get.find();
  FirebaseAuthController firebaseAuthController = gt.Get.find();
  FirebaseFireStoreController firebaseFireStoreController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  var currentIndex = 0;
  PageController pageController = PageController();
  List<Widget> homeScreenItems = [
    const MainView(),
    const SearchView(),
    const AddPostView(),
    const FavouriteView(),
    const ProfileView(),
  ];

  User? currentUser;
  FCMUserModel? currentUserData;


  //***************************************************************************************************************
  //  getX Ids

  String gtXIDBottomNavBar = 'Home-BottomNavBar';

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.onRed(msg: 'init Home');
    onGetUserData();
    super.onInit();
  }

  @override
  void onReady() {
    logController.onRed(msg: 'ready Home');
    super.onReady();
  }

  @override
  void onClose() {
    logController.onRed(msg: 'close Home');
    pageController.dispose();
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  void onBottomNavBarTap(int value) {
    currentIndex = value;
    pageController.jumpToPage(value);
    update([gtXIDBottomNavBar]);
  }

  void onPageChanged(int page) {
    currentIndex = page;
    update([gtXIDBottomNavBar]);
  }

  void onGetUserData() async {
    currentUser = firebaseAuthController.onGetCurrentUserAuth();
    if (currentUser != null) {
      currentUserData = await firebaseFireStoreController.onGetUserData(
          uid: currentUser!.uid.toString());
    }
  }
}
