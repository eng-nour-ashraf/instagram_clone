import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/assets/assets.dart';
import 'package:instagram_clone/modules/pages/register/register_controller.dart';

class RegisterProfilePic extends StatelessWidget {
  final RegisterController controller;
  const RegisterProfilePic({
    Key? key, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          GetBuilder(
            id: controller.gtXIDProfilePic,
            builder: (RegisterController c) {
              return controller.isFileImg
                  ? CircleAvatar(
                radius: 64,
                backgroundImage: FileImage(controller.fileImage!),
              )
                  :
              CircleAvatar(
                radius: 64,
                backgroundImage: AssetImage(
                    AppAssets.profile),
              );
            }
          ),
          Positioned(
            bottom: -10,
            left: 80,
            child: IconButton(
              onPressed: controller.onShowImageDialog,
              icon: const Icon(Icons.add_a_photo),
            ),
          )
        ],
      ),
    );
  }
}
