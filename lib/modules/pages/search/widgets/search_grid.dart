import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/enum/app_status.dart';
import 'package:instagram_clone/app/translations/locale_keys.dart';
import 'package:instagram_clone/modules/pages/search/search_controller.dart';
import '../../../general_widgets/app_loading.dart';

class SearchGrid extends StatelessWidget {
  final SearchViewController controller;

  const SearchGrid({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        id: controller.gtXIDUsersGrid,
        builder: (SearchViewController c) {
          return controller.appStatus2 == AppStatus.loading
              ? const AppLoadingWidget(
                  color: Colors.black,
                )
              : controller.postList.isNotEmpty
                  ? MasonryGridView.count(
                      crossAxisCount: 3,
                      padding: const EdgeInsets.all(15),
                      itemCount: controller.postList.length,
                      itemBuilder: (context, index) =>
                          CachedNetworkImage(
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
                          ),
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    )
                  : Center(
                      child: Text(
                      LocalKeys.noUsers.tr,
                      style: const TextStyle(fontSize: 30),
                    ));
        });
  }
}
