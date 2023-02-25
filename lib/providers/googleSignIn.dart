import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential?> signInWithGoogle() async {
  try {
    // Trigger the Google Authentication flow.
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the Google Authentication credential.
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a Firebase credential from the Google Authentication credential.
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the Firebase credential.
    final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential;
  } on FirebaseAuthException catch (e) {
    print('Failed to sign in with Google: ${e.code}');
    return null;
  }
}
