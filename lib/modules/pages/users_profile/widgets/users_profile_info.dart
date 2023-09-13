import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/profile/profile_controller.dart';
import 'package:instagram_clone/modules/pages/users_profile/widgets/users_profile_btn.dart';

import '../../../../app/enum/app_status.dart';
import '../../../../app/translations/locale_keys.dart';
import '../../../general_widgets/app_loading.dart';
import '../users_profile_controller.dart';

class UsersProfileInfo extends StatelessWidget {
  final UsersProfileController controller;

  const UsersProfileInfo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        id: controller.gtXIDUsersProfileInfo,
        builder: (UsersProfileController c) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: controller.appStatus == AppStatus.loading
                ? const AppLoadingWidget(
                    color: Colors.black,
                    size: 40,
                  )
                : Column(
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              width: 70,
                              height: 70,
                              imageUrl: controller.currentUserModel.photoUrl,
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
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          '${controller.postList.length}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          LocalKeys.posts.tr,
                                          style:  TextStyle(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        )
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          '${controller.currentUserModel.followers.length}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18
                                          ),
                                        ),
                                        Text(
                                          LocalKeys.followers.tr,
                                          style:  TextStyle(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        )
                                      ],
                                    )),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          '${controller.currentUserModel.following.length}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          LocalKeys.following.tr,
                                          style:  TextStyle(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        )
                                      ],
                                    )),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                UsersProfileBtn(
                                  controller: controller,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
          );
        });
  }
}
