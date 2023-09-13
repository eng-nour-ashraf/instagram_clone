import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/app/fcm/models/fcm_post_comment_model.dart';

import 'models/fcm_post_model.dart';
import 'models/fcm_user_model.dart';

class FirebaseFireStoreController {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final String collectionUsers = 'users';
  final String collectionPosts = 'posts';
  final String collectionComments = 'comments';

  Future<void> onSignUpUser({
    required String email,
    required String password,
    required String profileUrl,
    required String username,
    required String uid,
    required String bio,
  }) async {
    FCMUserModel fcmUserModel = FCMUserModel(
      username: username,
      uid: uid,
      photoUrl: profileUrl,
      email: email,
      bio: bio,
      followers: [],
      following: [],
    );
    return await fireStore
        .collection(collectionUsers)
        .doc(uid)
        .set(fcmUserModel.toJson());
  }

  Future<FCMUserModel> onGetUserData({
    required String uid,
  }) async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await fireStore.collection(collectionUsers).doc(uid).get();

    return FCMUserModel.fromSnap(documentSnapshot);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> onGetPosts() {
    return fireStore
        .collection(collectionPosts)
        .orderBy('createdAt')
        .snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> onSearchUsers(
      {required String searchKeyWord}) {
    return fireStore
        .collection(collectionUsers)
        .where('username', isGreaterThanOrEqualTo: searchKeyWord)
        .get();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> onGetUserPosts(
      {required String uid}) {
    return fireStore
        .collection(collectionPosts)
        .where('uid', isEqualTo: uid)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> onGetPostComments(
      {required String postId}) {
    return fireStore
        .collection(collectionPosts)
        .doc(postId)
        .collection(collectionComments)
        .orderBy('createdAt')
        .snapshots();
  }

  Future<void> onUploadPost({
    required String description,
    required String uid,
    required String username,
    required String postId,
    required String postUrl,
    required String profImage,
  }) async {
    var now = DateTime.now();
    FCMPostModel fcmPostModel = FCMPostModel(
        description: description,
        uid: uid,
        username: username,
        likes: [],
        postId: postId,
        datePublished:
            DateTime(now.year, now.month, now.day).toString().split(' ')[0],
        postUrl: postUrl,
        profImage: profImage,
        createdAt: Timestamp.now(),
        commentLen: 0);

    return await fireStore
        .collection(collectionPosts)
        .doc(postId)
        .set(fcmPostModel.toJson());
  }

  Future<void> onUpdatePost({
    required FCMPostModel fcmPostModel,
  }) async {
    return await fireStore
        .collection(collectionPosts)
        .doc(fcmPostModel.postId)
        .update(fcmPostModel.toJson());
  }

  Future<void> onUpdateUser({
    required FCMUserModel fcmUserModel,
  }) async {
    return await fireStore
        .collection(collectionUsers)
        .doc(fcmUserModel.uid)
        .update(fcmUserModel.toJson());
  }

  Future<void> onDeletePost({
    required String postId,
  }) async {
    return await fireStore.collection(collectionPosts).doc(postId).delete();
  }

  Future<void> onUploadComments({
    required String uid,
    required String username,
    required String commentId,
    required String postId,
    required String comment,
    required String profImage,
  }) async {
    var now = DateTime.now();
    FCMPostCommentModel fcmPostCommentModel = FCMPostCommentModel(
        uid: uid,
        username: username,
        commentId: commentId,
        datePublished:
            DateTime(now.year, now.month, now.day).toString().split(' ')[0],
        profImage: profImage,
        comment: comment,
        createdAt: Timestamp.now());

    return await fireStore
        .collection(collectionPosts)
        .doc(postId)
        .collection(collectionComments)
        .doc(commentId)
        .set(fcmPostCommentModel.toJson());
  }
}
