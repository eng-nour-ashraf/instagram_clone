import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/profile/widgets/profile_appbar.dart';
import 'package:instagram_clone/modules/pages/profile/widgets/profile_info.dart';
import 'package:instagram_clone/modules/pages/profile/widgets/profile_posts.dart';

import 'profile_controller.dart';






class ProfileView extends GetView<ProfileController> {

  const ProfileView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(controller: controller),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        children: [
          ProfileInfo(controller: controller,),
          ProfilePosts(controller: controller,),
        ],
      ),
    );
  }
}
