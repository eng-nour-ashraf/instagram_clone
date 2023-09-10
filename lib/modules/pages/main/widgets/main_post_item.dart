import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/app/fcm/models/fcm_post_model.dart';
import 'package:instagram_clone/modules/pages/main/main_controller.dart';
import '../../../general_widgets/app_loading.dart';

class MainPostItem extends StatelessWidget {
  final MainController controller;
  final FCMPostModel fcmPostModel;

  const MainPostItem(
      {Key? key, required this.controller, required this.fcmPostModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        id: '${controller.gtXIDPostItem}${fcmPostModel.postId}',
        builder: (MainController c) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 16,
                ).copyWith(right: 0),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        width: 35,
                        height: 35,
                        placeholder: (context, url) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                AppLoadingWidget(
                                  size: 35,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                        imageUrl: fcmPostModel.profImage,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              fcmPostModel.username,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    controller.currentUser!.uid == fcmPostModel.uid
                        ? IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert),
                          )
                        : Container(),
                  ],
                ),
              ),
              GestureDetector(
                onDoubleTap: () => controller.onLikePost(
                    fcmPostModel: fcmPostModel, isDouble: true),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: fcmPostModel.postUrl,
                      fit: BoxFit.cover,
                      height:
                          controller.utilsController.onGetHigh(dividedBy: 2.5),
                      width: double.infinity,
                      placeholder: (context, url) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              AppLoadingWidget(
                                size: 65,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AnimatedScale(
                      scale: controller.likeScale,
                      duration: const Duration(milliseconds: 400),
                      child: AnimatedOpacity(
                        opacity: controller.likeOpacity,
                        duration: const Duration(milliseconds: 200),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 100,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  AnimatedScale(
                    scale: controller.likeScale,
                    duration: const Duration(milliseconds: 400),
                    child: IconButton(
                        icon: fcmPostModel.likes.contains(controller.currentUser!.uid)
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                              ),
                        onPressed: () => controller.onLikePost(
                            fcmPostModel: fcmPostModel, isDouble: false)),
                  ),
                  IconButton(
                      icon: const Icon(
                        Icons.comment_outlined,
                      ),
                      onPressed: ()=>controller.onComments(fcmPostModel: fcmPostModel)),
                  IconButton(
                      icon: const Icon(
                        Icons.send,
                      ),
                      onPressed: () {}),
                  Expanded(
                      child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        icon: const Icon(Icons.bookmark_border),
                        onPressed: () {}),
                  ))
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DefaultTextStyle(
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w800),
                        child: Text(
                          '${fcmPostModel.likes.length} likes',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: '${fcmPostModel.username} : ',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: fcmPostModel.description,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child:  Text(
                            'View all ${fcmPostModel.commentLen} comments',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        onTap: () => controller.onComments(fcmPostModel: fcmPostModel)),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        fcmPostModel.datePublished,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }
}
