import 'package:firebase_auth/firebase_auth.dart';
Future<UserCredential?> signInWithEmail(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  } on FirebaseAuthException catch (e) {
    print("yesssssssssssss");
    return null;
  }
}
