import 'package:cloud_firestore/cloud_firestore.dart';

class FCMPostModel {
  final String description;
  final String uid;
  final String username;
  final List likes;
  final String postId;
  final String datePublished;
  final String postUrl;
  final String profImage;
  int commentLen;
  final Timestamp createdAt;

  FCMPostModel(
      {required this.description,
        required this.uid,
        required this.username,
        required this.commentLen,
        required this.likes,
        required this.postId,
        required this.datePublished,
        required this.postUrl,
        required this.profImage,
        required this.createdAt,
      });

  static FCMPostModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return FCMPostModel(
        description: snapshot["description"],
        uid: snapshot["uid"],
        likes: snapshot["likes"],
        postId: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        username: snapshot["username"],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['profImage'],
        createdAt: snapshot['createdAt'],
        commentLen: snapshot['commentLen']
    );
  }

  Map<String, dynamic> toJson() => {
    "description": description,
    "uid": uid,
    "likes": likes,
    "username": username,
    "postId": postId,
    "datePublished": datePublished,
    'postUrl': postUrl,
    'profImage': profImage,
    'createdAt': createdAt,
    'commentLen': commentLen
  };
}