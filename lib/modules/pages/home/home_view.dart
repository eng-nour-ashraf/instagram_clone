import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagr'
    'am_clone/modules/pages/home/home_controller.dart';

import 'widgets/home_bottombar.dart';
import 'widgets/home_pageview.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomeBottomBar(controller: controller,),
      body: HomePageView(controller: controller,),
    );
  }
}
