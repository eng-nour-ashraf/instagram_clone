import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/app/assets/assets.dart';
import 'package:instagram_clone/modules/pages/add_post/add_post_controller.dart';

class AddPostUpload extends StatelessWidget {
  final AddPostController controller;
  const AddPostUpload({
    Key? key,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(
          Icons.upload,
          size: 100,
        ),
        onPressed: controller.onShowImageDialog,
      ),
    );
  }
}
