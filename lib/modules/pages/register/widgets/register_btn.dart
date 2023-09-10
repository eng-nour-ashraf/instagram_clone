import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/translations/locale_keys.dart';
import 'package:instagram_clone/modules/pages/register/register_controller.dart';

class RegisterBtn extends StatelessWidget {
  final RegisterController controller;
  const RegisterBtn({
    Key? key, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: controller.utilsController.onGetWidth(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        onPressed: controller.onRegister,
        child: Text(LocalKeys.signUp.tr),
      ),
    );
  }
}
