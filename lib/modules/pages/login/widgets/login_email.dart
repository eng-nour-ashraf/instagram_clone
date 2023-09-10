import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/login/login_controller.dart';

import '../../../../app/translations/locale_keys.dart';

class LoginEmail extends StatelessWidget {
  final LoginController controller;

  const LoginEmail({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => controller.isValidEmail ? null : LocalKeys.emailError.tr,
      controller: controller.emailController,
      decoration: InputDecoration(
        hintText: LocalKeys.enterEmail.tr,
        border: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context, color: Colors.red),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
