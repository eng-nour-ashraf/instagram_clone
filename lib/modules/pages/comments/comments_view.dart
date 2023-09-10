import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/comments/widgets/comments_list.dart';
import 'package:instagram_clone/modules/pages/comments/widgets/comments_text_field.dart';
import 'comments_controller.dart';


class CommentsView extends GetView<CommentsController> {

  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Column(
        children: [
          CommentsList(controller: controller,),
          CommentsTextField(controller: controller,),
        ],
      ),
    );
  }
}
