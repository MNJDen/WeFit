import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class AuthService {
  //instance of auth & firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

// sign in
  Future<UserCredential?> signInWithEmailPassword(
      String email, String password, String username) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Retrieve user data from Firestore
      DocumentSnapshot userDoc = await _firestore
          .collection("Users")
          .doc(userCredential.user!.uid)
          .get();

      // Check if the username exists in Firestore
      if (!userDoc.exists) {
        throw Exception("User data not found in Firestore");
      }

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

// sign up
  Future<UserCredential?> signUpWithEmailPassword(
      String email, String password, String username, File image) async {
    try {
      // Create user
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.updateDisplayName(username);

      // Upload image
      String? imageUrl = await uploadImage(
          image, userCredential.user!.uid); // Pass the user's UID as userId

      // Save user info along with image URL in Firestore
      await _firestore.collection("Users").doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
          'username': username,
          'profileImageUrl': imageUrl, // Add the image URL to Firestore
        },
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<String?> uploadImage(File image, String userId) async {
    try {
      // Generate a unique filename for the image
      String fileName = '$userId-${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Create a reference to the location you want to upload to in Firestore
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child(fileName); // Set the unique filename as the child

      // Upload the file to Firestore
      await ref.putFile(image);

      // Once uploaded, get the download URL
      String downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } catch (e) {
      print('Error uploading image: $e');
      return null; // Return null if upload fails
    }
  }

// sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
