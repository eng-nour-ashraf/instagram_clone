import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/profile/profile_controller.dart';
import 'package:instagram_clone/modules/pages/profile/widgets/profile_btn.dart';

import '../../../../app/enum/app_status.dart';
import '../../../../app/translations/locale_keys.dart';
import '../../../general_widgets/app_loading.dart';

class ProfileInfo extends StatelessWidget {
  final ProfileController controller;

  const ProfileInfo({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        id: controller.gtXIDProfileInfo,
        builder: (ProfileController c) {
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
                                ProfileBtn(
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
