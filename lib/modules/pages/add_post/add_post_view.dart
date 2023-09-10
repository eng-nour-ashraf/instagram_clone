import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/add_post/widgets/add_post_post.dart';
import 'package:instagram_clone/modules/pages/add_post/widgets/add_post_upload.dart';

import 'add_post_controller.dart';

class AddPostView extends GetView<AddPostController> {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(id: controller.gtXIDChooseImg,builder: (AddPostController c) {
      return controller.isFileImg
          ? AddPostPost(controller: controller,)
          : AddPostUpload(
        controller: controller,
      );
    });
  }
}
