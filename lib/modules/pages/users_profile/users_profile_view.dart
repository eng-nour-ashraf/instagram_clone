import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/users_profile/widgets/users_profile_appbar.dart';
import 'package:instagram_clone/modules/pages/users_profile/widgets/users_profile_info.dart';
import 'package:instagram_clone/modules/pages/users_profile/widgets/users_profile_posts.dart';

import 'users_profile_controller.dart';

class UsersProfileView extends GetView<UsersProfileController> {

  const UsersProfileView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UsersProfileAppBar(controller: controller),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        children: [
          UsersProfileInfo(controller: controller,),
          UsersProfilePosts(controller: controller,),
        ],
      ),
    );
  }
}
