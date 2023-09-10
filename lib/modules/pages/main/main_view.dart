import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/main/widgets/main_appbar.dart';
import 'package:instagram_clone/modules/pages/main/widgets/main_post_item.dart';
import 'package:instagram_clone/modules/pages/main/widgets/main_post_list.dart';

import 'main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        controller: controller,
      ),
      body: MainPostList(controller: controller,),
    );
  }
}
