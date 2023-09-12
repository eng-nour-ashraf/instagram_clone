import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/app/translations/locale_keys.dart';
import '../main_controller.dart';

class MainDeleteDialog extends StatelessWidget {
  final MainController controller;
  final String postId;

  const MainDeleteDialog({Key? key, required this.controller, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          LocalKeys.deleteConfirmMsg.tr,
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
          onPressed: () => controller.onDeletePost(postId :postId),
          child: SizedBox(
            height: 50,
            width: 200,
            child: Center(
              child: Text(
                LocalKeys.delete.tr,
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
          onPressed: ()=>controller.onBack(),
          child: SizedBox(
            height: 50,
            width: 200,
            child: Center(
              child: Text(
                LocalKeys.cancel.tr,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
