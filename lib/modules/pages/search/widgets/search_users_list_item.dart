import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/app/assets/assets.dart';
import 'package:instagram_clone/app/fcm/models/fcm_post_comment_model.dart';
import 'package:instagram_clone/app/fcm/models/fcm_user_model.dart';
import 'package:instagram_clone/modules/pages/add_post/add_post_controller.dart';
import 'package:instagram_clone/modules/pages/comments/comments_controller.dart';
import 'package:instagram_clone/modules/pages/search/search_controller.dart';

import '../../../general_widgets/app_loading.dart';

class SearchUsersListItem extends StatelessWidget {
  final SearchViewController controller;
  final FCMUserModel user;

  const SearchUsersListItem(
      {Key? key, required this.controller, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>controller.onProfile(userModel: user),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                width: 50,
                height: 50,
                imageUrl: user.photoUrl,
                placeholder: (context, url) => const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  user.username,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
