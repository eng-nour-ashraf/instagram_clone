import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/translations/locale_keys.dart';
import 'package:instagram_clone/modules/pages/login/login_controller.dart';
import 'package:instagram_clone/modules/pages/profile/profile_controller.dart';

class ProfileBtn extends StatelessWidget {
  final ProfileController controller;

  const ProfileBtn({
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
        onPressed: controller.onSignOut,

        child: Text(
          LocalKeys.signOut.tr,
          style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
        ),
      ),
    );
  }
}
