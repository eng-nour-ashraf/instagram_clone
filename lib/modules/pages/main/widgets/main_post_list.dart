import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instagram_clone/app/enum/app_status.dart';
import 'package:instagram_clone/modules/pages/main/main_controller.dart';
import '../../../general_widgets/app_loading.dart';
import 'main_post_item.dart';

class MainPostList extends StatelessWidget {
  final MainController controller;
  const MainPostList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: controller.gtXIDPostList,
      builder: (MainController c) {
        return controller.appStatus == AppStatus.loading ? const AppLoadingWidget(color: Colors.black,): controller.postList.isNotEmpty ?
         ListView.builder(
          itemCount: controller.postList.length,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          itemBuilder: (BuildContext context, int index) {
            return MainPostItem(fcmPostModel : controller.postList[index],controller: controller);
          },
        ) : const Center(child: Text('No Posts',style: TextStyle(fontSize: 30),));
      }
    );
  }
}
