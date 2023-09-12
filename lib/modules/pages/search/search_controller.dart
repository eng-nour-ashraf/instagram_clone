import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart' as gt;
import 'package:instagram_clone/app/enum/app_status.dart';
import 'package:instagram_clone/app/fcm/firebase_firestore_controller.dart';
import 'package:instagram_clone/app/fcm/firebase_storage_controller.dart';
import 'package:instagram_clone/app/fcm/models/fcm_user_model.dart';

import '../../../app/log/log_controller.dart';

class SearchViewController extends gt.GetxController {
  //  controllers
  LogController logController = gt.Get.find();
  FirebaseFireStoreController firebaseFireStoreController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  var searchKeyword = ''.obs;
  AppStatus appStatus = AppStatus.init;
  List<FCMUserModel> usersList = [];
  TextEditingController searchController = TextEditingController();

  //***************************************************************************************************************

  //  getX Ids

  String gtXIDSearchBar = 'Search-SearchBar';
  String gtXIDUsersList = 'Search-UsersList';

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.onRed(msg: 'init Search');
    onSearchDebounce();
    super.onInit();
  }

  @override
  void onReady() {
    logController.onRed(msg: 'ready Search');
    super.onReady();
  }

  @override
  void onClose() {
    logController.onRed(msg: 'close Search');
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  void onSearchDebounce() {
    gt.debounce(searchKeyword, (_) async {
      try {
        if(searchKeyword.value == ''){
          usersList = [];
          update([gtXIDUsersList]);
        }else {
          appStatus = AppStatus.loading;
          update([gtXIDUsersList]);
          var querySnapshot = await firebaseFireStoreController.onSearchUsers(
              searchKeyWord: searchKeyword.value);
          usersList = querySnapshot.docs
              .map((element) => FCMUserModel.fromSnap(element))
              .toList();
          appStatus = AppStatus.success;
          update([gtXIDUsersList]);
        }
      } catch (err) {
        appStatus = AppStatus.failed;
        update([gtXIDUsersList]);
      }
    }, time: const Duration(seconds: 1));
  }

  void onSearchBarChange(String value) {
    searchKeyword.value = value;
  }
}
