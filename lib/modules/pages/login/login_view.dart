import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/login/widgets/login_btn.dart';
import 'package:instagram_clone/modules/pages/login/widgets/login_password.dart';

import 'login_controller.dart';
import 'widgets/login_email.dart';
import 'widgets/login_img.dart';
import 'widgets/login_sign_up.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: controller.utilsController.onGetWidth(),
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(
                        height:
                            controller.utilsController.onGetHigh(dividedBy: 4),
                      ),
                      const LoginImg(),
                      const SizedBox(
                        height: 64,
                      ),
                      LoginEmail(controller: controller),
                      const SizedBox(
                        height: 24,
                      ),
                      LoginPassword(controller: controller),
                      const SizedBox(
                        height: 24,
                      ),
                      LoginBtn(controller: controller),
                    ],
                  ),
                ),
                LoginSignUp(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
