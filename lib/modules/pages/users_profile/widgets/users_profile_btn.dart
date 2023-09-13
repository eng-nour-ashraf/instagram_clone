import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/translations/locale_keys.dart';

import '../users_profile_controller.dart';

class UsersProfileBtn extends StatelessWidget {
  final UsersProfileController controller;

  const UsersProfileBtn({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: controller.utilsController.onGetWidth(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        onPressed:
            controller.currentUser!.uid == controller.currentUserModel.uid
                ? controller.onSignOut
                : controller.onFollow,
        child: Text(
          controller.currentUser!.uid == controller.currentUserModel.uid
              ? LocalKeys.signOut.tr
              : controller.appUserModel.following.contains(controller
              .currentUserModel.uid) ? LocalKeys.unFollow.tr : LocalKeys.follow.tr,
          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
        ),
      ),
    );
  }
}
