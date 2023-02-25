import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

Future<UserCredential?> signUpWithGoogle() async {
  // Trigger the Google Sign-In flow.
  final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

  if (googleUser != null) {
    // Obtain the auth details from the request.
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    // Create a new credential.
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the Google credential.
    return await _auth.signInWithCredential(credential);
  }

  // Return null if user cancels the Google Sign-In flow.
  return null;
}

Future<void> signOutGoogle() async {
  await _googleSignIn.signOut();
}

Future<void> revokeAccessGoogle() async {
  await _googleSignIn.disconnect();
}

Future<void> chooseGoogleAccount() async {
  await _googleSignIn.signOut();
  await _googleSignIn.signIn();
}
