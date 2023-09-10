import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/assets/assets.dart';
import 'package:instagram_clone/app/translations/locale_keys.dart';
import 'package:instagram_clone/modules/pages/login/login_controller.dart';

class LoginSignUp extends StatelessWidget {
  final LoginController controller;
  const LoginSignUp({
    Key? key, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child:  Text(
            LocalKeys.noAccount.tr,
          ),
        ),
        GestureDetector(
          onTap: controller.onRegister,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              LocalKeys.signUp.tr,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
