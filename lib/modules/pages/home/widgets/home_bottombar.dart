import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/home/home_controller.dart';

class HomeBottomBar extends StatelessWidget {
  final HomeController controller;

  const HomeBottomBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        id: controller.gtXIDBottomNavBar,
        builder: (HomeController c) {
          return CupertinoTabBar(
            onTap: controller.onBottomNavBarTap,
            currentIndex: controller.currentIndex,
            items: [
              _buildBottomNavigationBarItem(
                  index: 0,
                  currentIndex: controller.currentIndex,
                  icon: Icons.home),
              _buildBottomNavigationBarItem(
                  index: 1,
                  currentIndex: controller.currentIndex,
                  icon: Icons.search),
              _buildBottomNavigationBarItem(
                  index: 2,
                  currentIndex: controller.currentIndex,
                  icon: Icons.add_circle),
              _buildBottomNavigationBarItem(
                  index: 3,
                  currentIndex: controller.currentIndex,
                  icon: Icons.favorite),
              _buildBottomNavigationBarItem(
                  index: 4,
                  currentIndex: controller.currentIndex,
                  icon: Icons.person),
            ],
          );
        });
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      {required IconData icon, required int currentIndex, required int index}) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: currentIndex == index ? Colors.black : Colors.grey,
      ),
    );
  }
}
