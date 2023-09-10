import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instagram_clone/app/enum/app_status.dart';
import 'package:instagram_clone/modules/pages/comments/comments_controller.dart';
import 'package:instagram_clone/modules/pages/comments/widgets/comments_list_item.dart';
import 'package:instagram_clone/modules/pages/main/main_controller.dart';
import '../../../general_widgets/app_loading.dart';

class CommentsList extends StatelessWidget {
  final CommentsController controller;

  const CommentsList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder(id: controller.gtXIDCommentsList,builder: (CommentsController c) {
        return controller.appStatus == AppStatus.loading
            ? const AppLoadingWidget(
                color: Colors.black,
              )
            : controller.commentList.isNotEmpty
                ? ListView.builder(
                    itemCount: controller.commentList.length,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    itemBuilder: (BuildContext context, int index) {
                      return CommentsListItem(controller: controller,comment : controller.commentList[index]);
                    },
                  )
                : const Center(
                    child: Text(
                    'No Comments',
                    style: TextStyle(fontSize: 30),
                  ));
      }),
    );
  }
}
