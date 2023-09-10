import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/app/assets/assets.dart';
import 'package:instagram_clone/app/fcm/models/fcm_post_comment_model.dart';
import 'package:instagram_clone/modules/pages/add_post/add_post_controller.dart';
import 'package:instagram_clone/modules/pages/comments/comments_controller.dart';

import '../../../general_widgets/app_loading.dart';

class CommentsListItem extends StatelessWidget {
  final CommentsController controller;
  final FCMPostCommentModel comment;

  const CommentsListItem(
      {Key? key, required this.controller, required this.comment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  width: 45,
                  height: 45,
                  imageUrl: comment.profImage,
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
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text:  TextSpan(
                          children: [
                            TextSpan(
                                text: comment.username,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            TextSpan(
                                text: ' ${comment.comment}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          comment.datePublished,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
