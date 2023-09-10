import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_controller.dart';






class ProfileView extends GetView<ProfileController> {

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        children: [

        ],
      ),
    );
  }
}
