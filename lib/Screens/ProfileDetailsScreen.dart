import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:itec303/Components/MyPasswordField.dart';
import 'package:itec303/Components/MyUsernameField.dart';
import 'package:itec303/Components/myPurpleBtn.dart';
import 'package:itec303/Screens/ChangePasswordScreen.dart';
import 'package:itec303/Services/Auth/Auth_Service.dart';

final blackColor = const Color.fromRGBO(13, 13, 13, 1);
final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  late Stream<DocumentSnapshot> _userStream;
  late User? _currentUser;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    _currentUser = AuthService().getCurrentUser();
    if (_currentUser != null) {
      _emailController.text = _currentUser!.email ?? '';
      _userStream = FirebaseFirestore.instance
          .collection('Users')
          .doc(_currentUser!.uid)
          .snapshots();

      _userStream.listen((documentSnapshot) {
        if (documentSnapshot.exists) {
          final username = documentSnapshot.get('username');
          if (username != _usernameController.text) {
            _usernameController.text = username;
          }
        }
      });
    }
  }

  Future<void> _changeProfilePicture() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      try {
        // Delete the previous profile image from Firebase Storage if it exists
        final userDoc = await FirebaseFirestore.instance
            .collection('Users')
            .doc(_currentUser!.uid)
            .get();
        final oldImageUrl = userDoc.get('profileImageUrl');
        if (oldImageUrl != null) {
          final oldImageRef = FirebaseStorage.instance.refFromURL(oldImageUrl);
          await oldImageRef.delete();
        }

        // Upload the new image to Firebase Storage
        final File imageFile = File(image.path);
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('profile_images')
            .child('${_currentUser!.uid}.jpg');
        await storageRef.putFile(imageFile);

        // Get the download URL of the uploaded image
        final newImageUrl = await storageRef.getDownloadURL();

        // Update the profile image URL in Firestore
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(_currentUser!.uid)
            .update({'profileImageUrl': newImageUrl});
      } catch (e) {
        print('Failed to change profile picture: $e');
      }
    }
  }

  Future<void> _updateUsername(String newUsername) async {
    if (newUsername.length <= 10) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(_currentUser!.uid)
          .update({'username': newUsername});

          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            width: MediaQuery.of(context).size.width * 0.95,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Color.fromRGBO(34, 109, 34, 1),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Color.fromRGBO(49, 255, 49, 1),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Flexible(
                  child: Text(
                    'Changed Username Succesfully!', 
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
    } else {
      // Show an error message or handle the error appropriately
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          width: MediaQuery.of(context).size.width * 0.95,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color.fromRGBO(59, 23, 23, 1),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.error_rounded,
                color: Color.fromRGBO(255, 49, 49, 1),
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                'Username must be 10 characters or less',
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  void _saveProfile() {
    final newUsername = _usernameController.text;
    _updateUsername(newUsername);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_circle_left_rounded,
            color: purpleColor,
            size: 30,
          ),
        ),
        leadingWidth: 30.w,
        backgroundColor: blackColor,
        title: Text(
          "Profile Details",
          style: TextStyle(
            color: purpleColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Center(
                  child: StreamBuilder<DocumentSnapshot>(
                    stream: _userStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (!snapshot.hasData || !snapshot.data!.exists) {
                        return Text('User data not found');
                      }
                      final profileImageUrl =
                          snapshot.data!.get('profileImageUrl');

                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(color: purpleColor, width: 1),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: profileImageUrl != null
                                  ? Image.network(
                                      profileImageUrl,
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    )
                                  : Image.asset(
                                      'assets/images/Pedro.jpg',
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          TextButton(
                            onPressed: _changeProfilePicture,
                            child: Text('Change Profile Picture'),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                MyUsernameField(
                  prefixIcon: Icons.person_rounded,
                  labelText: "Username",
                  controller: _usernameController,
                ),
                SizedBox(
                  height: 12.h,
                ),
                MyUsernameField(
                  prefixIcon: Icons.email_rounded,
                  labelText: "Email",
                  controller: _emailController,
                  enable: false,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation1,
                                Animation<double> animation2) {
                              return const ChangePasswordScreen();
                            },
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                      child: Text(
                        "Change Your Password?",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: purpleColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 140.h,
                ),
                MyPurpleBtn(
                  name: "Save",
                  onPressed: _saveProfile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
