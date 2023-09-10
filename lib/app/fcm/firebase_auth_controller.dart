import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> onSignUpUser({
    required String email,
    required String password,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> onSignInUser({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  User? onGetCurrentUserAuth() {
    return _auth.currentUser;
  }
}
