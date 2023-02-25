import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPagel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            UserCredential? userCredential = await signInWithGoogle();
            if (userCredential != null) {
              // Navigate to home screen or perform other actions
            } else {
              // Sign in failed
            }
          },
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}

Future<UserCredential?> signInWithGoogle() async {
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
