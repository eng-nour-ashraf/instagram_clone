import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instagram_clone/app/enum/app_status.dart';
import 'package:instagram_clone/modules/pages/comments/comments_controller.dart';
import '../../../general_widgets/app_loading.dart';

class CommentsTextField extends StatelessWidget {
  final CommentsController controller;

  const CommentsTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        id: controller.gtXIDCommentsTextField,
        builder: (CommentsController c) {
          return Container(
            height: kToolbarHeight,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: Row(
              children: [
                ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          width: 40,
                          height: 40,
                          imageUrl: controller.currentUserData!.photoUrl,
                          placeholder: (context, url) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  AppLoadingWidget(
                                    size: 30,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 8),
                    child: TextField(
                      onChanged: controller.onCommentChange,
                      controller: controller.commentEditingController,
                      decoration: InputDecoration(
                        hintText:
                            'Comment as ${controller.currentUserData!.username}',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: controller.commentEditingController.text == '' ? null : controller.onPostComment,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: const Text(
                      'Post',
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
