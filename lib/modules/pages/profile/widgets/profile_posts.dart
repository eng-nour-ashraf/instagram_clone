import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/profile/profile_controller.dart';
import 'package:instagram_clone/modules/pages/profile/widgets/profile_btn.dart';

import '../../../../app/enum/app_status.dart';
import '../../../../app/translations/locale_keys.dart';
import '../../../general_widgets/app_loading.dart';

class ProfilePosts extends StatelessWidget {
  final ProfileController controller;

  const ProfilePosts({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        id: controller.gtXIDProfileList,
        builder: (ProfileController c) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: controller.appStatus2 == AppStatus.loading
                ? const AppLoadingWidget(
                    color: Colors.black,
                    size: 40,
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.postList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 1.5,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: controller.postList[index].postUrl,
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
                      );
                    },
                  ),
          );
        });
  }
}
