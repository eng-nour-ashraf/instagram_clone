import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instagram_clone/app/enum/app_status.dart';
import 'package:instagram_clone/app/translations/locale_keys.dart';
import 'package:instagram_clone/modules/pages/comments/comments_controller.dart';
import 'package:instagram_clone/modules/pages/comments/widgets/comments_list_item.dart';
import 'package:instagram_clone/modules/pages/main/main_controller.dart';
import 'package:instagram_clone/modules/pages/search/search_controller.dart';
import 'package:instagram_clone/modules/pages/search/widgets/search_users_list_item.dart';
import '../../../general_widgets/app_loading.dart';

class SearchUsersList extends StatelessWidget {
  final SearchViewController controller;

  const SearchUsersList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder(id: controller.gtXIDUsersList,builder: (SearchViewController c) {
        return controller.appStatus == AppStatus.loading
            ? const AppLoadingWidget(
                color: Colors.black,
              )
            : controller.usersList.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.usersList.length,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    itemBuilder: (BuildContext context, int index) {
                      return SearchUsersListItem(controller: controller,user : controller.usersList[index]);
                    },
                  )
                : Center(
                    child: Text(
                    LocalKeys.noUsers.tr,
                    style: const TextStyle(fontSize: 30),
                  ));
      }),
    );
  }
}
