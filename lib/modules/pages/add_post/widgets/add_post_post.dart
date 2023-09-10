import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/app/assets/assets.dart';
import 'package:instagram_clone/modules/pages/add_post/add_post_controller.dart';

import '../../../general_widgets/app_loading.dart';

class AddPostPost extends StatelessWidget {
  final AddPostController controller;

  const AddPostPost({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(onTap: controller.onClearImg,child: const Icon(Icons.arrow_back, size: 25)),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Post to',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              const Spacer(),
              TextButton(
                onPressed: controller.onPost,
                child: const Text(
                  'Post',
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
            ],
          ),
          Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                width: 45,
                height: 45,
                imageUrl: controller.currentUserData!.photoUrl,
                placeholder: (context, url) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        AppLoadingWidget(
                          size: 30,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: TextField(
                controller: controller.captionTextEditingController,
                decoration: const InputDecoration(
                    hintText: "Write a caption...",
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(width: 10,),
            Image.file(controller.fileImage!,width: 50,height: 50,fit: BoxFit.fill,),
          ],)
        ],
      ),
    );
  }
}
