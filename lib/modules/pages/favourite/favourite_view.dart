import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'favourite_controller.dart';





class FavouriteView extends GetView<FavouriteController> {

  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite'),
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
