import 'package:cloud_firestore/cloud_firestore.dart';

class FCMPostCommentModel {
  final String uid;
  final String username;
  final String commentId;
  final String datePublished;
  final String comment;
  final String profImage;
  final Timestamp createdAt;

  const FCMPostCommentModel(
      {
        required this.uid,
        required this.username,
        required this.commentId,
        required this.datePublished,
        required this.comment,
        required this.profImage,
        required this.createdAt,
      });

  static FCMPostCommentModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return FCMPostCommentModel(
        uid: snapshot["uid"],
        commentId: snapshot["commentId"],
        datePublished: snapshot["datePublished"],
        username: snapshot["username"],
        comment: snapshot['comment'],
        profImage: snapshot['profImage'],
        createdAt: snapshot['createdAt']
    );
  }

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "username": username,
    "commentId": commentId,
    "datePublished": datePublished,
    'comment': comment,
    'profImage': profImage,
    'createdAt': createdAt
  };
}