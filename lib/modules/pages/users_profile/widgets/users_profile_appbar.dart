import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/app/assets/assets.dart';
import 'package:instagram_clone/modules/pages/main/main_controller.dart';

import '../users_profile_controller.dart';

class UsersProfileAppBar extends StatelessWidget implements PreferredSizeWidget{
  final UsersProfileController controller;
  const UsersProfileAppBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      centerTitle: false,
      title: SvgPicture.asset(
        AppAssets.icInstagram,
        height: 32,
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.messenger_outline,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
