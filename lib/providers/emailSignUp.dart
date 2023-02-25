import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';






     Future<void> signUp(
    String name,
    String email,
    String password,
    String confirmPassword,
    ) async {
  final auth = FirebaseAuth.instance;
  final usersRef = FirebaseFirestore.instance.collection('users');
  if (password != confirmPassword) {
    print('Passwords do not match');
    return;
  }
  try {
    UserCredential userCredential =
    await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('create user');

    User? user = userCredential.user;
    if (user != null) {
      await user.updateDisplayName(name);
      await usersRef.doc(user.uid).set({
        'name': name,
        'email': email,
      });
      print('User signed up successfully with email $email');
    }
  } on FirebaseAuthException catch (e) {
    print('Error during sign up: $e');
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
