import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/login/login_controller.dart';

import '../../../../app/translations/locale_keys.dart';

class LoginPassword extends StatelessWidget {
  final LoginController controller;
  const LoginPassword({Key? key, required this.controller,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) =>
      controller.isValidPassword ? null : LocalKeys.passwordError.tr,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller.passwordController,
      decoration: InputDecoration(
        hintText: LocalKeys.enterPassword.tr,
        border: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context),
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(8),
        errorBorder: OutlineInputBorder(
          borderSide: Divider.createBorderSide(context,color: Colors.red),
        ),
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
    );
  }
}
