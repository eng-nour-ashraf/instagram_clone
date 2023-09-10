import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/translations/locale_keys.dart';
import 'package:instagram_clone/modules/pages/register/register_controller.dart';

class RegisterLogin extends StatelessWidget {
  final RegisterController controller;
  const RegisterLogin({
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
            LocalKeys.haveAccount.tr,
          ),
        ),
        GestureDetector(
          onTap: controller.onLogin,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              LocalKeys.login.tr,
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
