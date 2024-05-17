import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Services/Auth/Auth_Service.dart';
import 'package:itec303/Components/MyUsernameField.dart';
import 'package:itec303/Components/MyPasswordField.dart';
import 'package:itec303/Components/MyPurpleBtn.dart';
import 'package:itec303/Screens/SignInScreen.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itec303/Components/MyBottomNavBar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  File? _image;
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);
  bool _isLoading = false;

  void register(BuildContext context) async {
    final _auth = AuthService();

    setState(() {
      _isLoading = true;
    });

    try {
      String? downloadURL;
      if (_image != null) {
        // Get the current user
        User? currentUser = _auth.getCurrentUser();
        if (currentUser != null) {
          // If current user is not null, get the user's UID
          String userId = currentUser.uid;

          // Call uploadImage with both the image and the user's UID
          downloadURL = await _auth.uploadImage(_image!, userId);

          if (downloadURL != null) {
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
                      Icons.error_rounded,
                      color: Color.fromRGBO(49, 255, 49, 1),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Flexible(
                      child: Text(
                        'Image uploaded!', // Use the cleaned error message here
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
                      Icons.check_circle_rounded,
                      color: Color.fromRGBO(255, 49, 49, 1),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Flexible(
                      child: Text(
                        'Failed to upload image!', // Use the cleaned error message here
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
            return; // Exit function if image upload fails
          }
        } else {
          print(
              'Current user is null.'); // Handle case where current user is null
        }
      } else {
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
                Flexible(
                  child: Text(
                    'No image selected', // Use the cleaned error message here
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
      }

      UserCredential? userCredential = await _auth.signUpWithEmailPassword(
        _emailController.text,
        _passController.text,
        _usernameController.text,
        _image!,
      );

      if (userCredential != null) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return MyBottomNavBar();
            },
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );

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
                  Icons.check_circle_rounded,
                  color: Color.fromRGBO(49, 255, 49, 1),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Flexible(
                  child: Text(
                    'Sign Up Successful!', // Use the cleaned error message here
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
      }
    } catch (e) {
      String errorMessage;
      if (e is AuthServiceException) {
        errorMessage = e.message;
      } else {
        errorMessage = 'An unknown error occurred';
      }

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
              Flexible(
                child: Text(
                  errorMessage, // Use the cleaned error message here
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
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Logo-png.png",
                      height: 50.h,
                      width: 50.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 56.h,
                ),
                Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    color: purpleColor,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "Fill the following forms to continue.",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: whiteColor,
                  ),
                ).animate().fadeIn(delay: Duration(milliseconds: 400)),
                SizedBox(
                  height: 12.h,
                ),
                _image == null
                    ? Text('No image selected.')
                    : Center(
                        child: Card(
                          shape: const CircleBorder(),
                          clipBehavior: Clip.antiAlias,
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                            height: 120.h,
                            width: 120.h,
                          ),
                        ),
                      ),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () async {
                      final picker = ImagePicker();
                      final pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          _image = File(pickedFile.path);
                        });
                      }
                    },
                    child: Text("Upload Image"),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                MyUsernameField(
                  prefixIcon: Icons.email_rounded,
                  labelText: "Email",
                  controller: _emailController,
                ).animate().fadeIn(delay: Duration(milliseconds: 500)),
                SizedBox(
                  height: 16.h,
                ),
                MyUsernameField(
                  prefixIcon: Icons.person_rounded,
                  labelText: "Username",
                  controller: _usernameController,
                ).animate().fadeIn(delay: Duration(milliseconds: 500)),
                SizedBox(
                  height: 16.h,
                ),
                MyPasswordField(
                  prefixIcon: Icons.lock_rounded,
                  labelText: "Password",
                  suffixIcon: Icons.visibility_off_rounded,
                  controller: _passController,
                ).animate().fadeIn(delay: Duration(milliseconds: 600)),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  height: 32.h,
                ),
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : MyPurpleBtn(
                        name: "Continue",
                        onPressed: () => register(context),
                      ).animate().fadeIn(delay: Duration(milliseconds: 700)),
                SizedBox(
                  height: 32.h,
                ),
                Divider(
                  color: Color.fromRGBO(251, 248, 255, 0.3),
                  indent: 30.w,
                  endIndent: 30.w,
                  thickness: 1,
                ),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      spacing: 4.w,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: whiteColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) {
                                  return SignInScreen();
                                },
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: purpleColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: Duration(milliseconds: 300));
  }
}
