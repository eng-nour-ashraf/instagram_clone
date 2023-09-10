import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseStorageController {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final String _profilePicFolder = 'profilePics';
  final String _postFolder = 'posts';

  // Adding profile Pic to firebase storage
  Future<String> onUploadProfilePicToStorage({required Uint8List file,required String uid}) async {
    Reference ref =
    _storage.ref().child(_profilePicFolder).child(uid);

    UploadTask uploadTask = ref.putData(
        file
    );

    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }

  // Adding profile Pic to firebase storage
  Future<String> onUploadPostToStorage({required Uint8List file,required String uid,required String postId}) async {
    Reference ref =
    _storage.ref().child(_postFolder).child(uid).child(postId);

    UploadTask uploadTask = ref.putData(
        file
    );

    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }
}
