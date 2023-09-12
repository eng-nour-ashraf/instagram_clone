import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/search/search_controller.dart';
import 'package:instagram_clone/modules/pages/search/widgets/search_bar.dart';
import 'package:instagram_clone/modules/pages/search/widgets/search_users_list.dart';





class SearchView extends GetView<SearchViewController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchViewBar(controller: controller,),
          SearchUsersList(controller: controller,),
        ],
      ),
    );
  }
}
