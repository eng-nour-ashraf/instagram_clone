import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/app/translations/locale_keys.dart';
import 'package:instagram_clone/modules/pages/add_post/add_post_controller.dart';
import 'package:instagram_clone/modules/pages/register/register_controller.dart';

class AddPostImgDialog extends StatelessWidget {
  final AddPostController controller;

  const AddPostImgDialog({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          LocalKeys.chooseImg.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 17,
              height: 1.5,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
          onPressed: () => controller.onPickImg(ImageSource.gallery),
          child: SizedBox(
            height: 50,
            width: 200,
            child: Center(
              child: Text(
                LocalKeys.gallery.tr,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),
          onPressed: () => controller.onPickImg(ImageSource.camera),
          child: SizedBox(
            height: 50,
            width: 200,
            child: Center(
              child: Text(
                LocalKeys.camera.tr,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
