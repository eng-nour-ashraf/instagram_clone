import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_controller.dart';
import 'widgets/register_bio.dart';
import 'widgets/register_btn.dart';
import 'widgets/register_email.dart';
import 'widgets/register_img.dart';
import 'widgets/register_login.dart';
import 'widgets/register_password.dart';
import 'widgets/register_profile_pic.dart';
import 'widgets/register_username.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

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
                    const SizedBox(
                      height: 24,
                    ),
                    const RegisterImg(),
                    const SizedBox(
                      height: 24,
                    ),
                    RegisterProfilePic(controller : controller),
                    const SizedBox(
                      height: 24,
                    ),
                    RegisterUsername(controller : controller),
                    const SizedBox(
                      height: 24,
                    ),
                    RegisterEmail(controller : controller),
                    const SizedBox(
                      height: 24,
                    ),
                    RegisterPassword(controller : controller),
                    const SizedBox(
                      height: 24,
                    ),
                    RegisterBio(controller : controller),
                    const SizedBox(
                      height: 24,
                    ),
                    RegisterBtn(controller : controller),
                  ],
                )),
                RegisterLogin(controller : controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
