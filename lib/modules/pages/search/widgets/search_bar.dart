import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/pages/login/login_controller.dart';

import '../../../../app/translations/locale_keys.dart';
import '../search_controller.dart';

class SearchViewBar extends StatelessWidget {
  final SearchViewController controller;

  const SearchViewBar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: controller.gtXIDSearchBar,
      builder: (SearchViewController c) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextFormField(
            controller: controller.searchController,
            onChanged: controller.onSearchBarChange,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: LocalKeys.searchUsers.tr,
              border: OutlineInputBorder(
                borderSide: Divider.createBorderSide(context),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: Divider.createBorderSide(context),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: Divider.createBorderSide(context),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: Divider.createBorderSide(context, color: Colors.red),
              ),
              filled: true,
              contentPadding: const EdgeInsets.all(8),
              suffixIcon: const Icon(Icons.search,color: Colors.black,)
            ),
            keyboardType: TextInputType.text,
          ),
        );
      }
    );
  }
}
