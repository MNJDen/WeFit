import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Services/Auth/Auth_Service.dart';
import 'package:itec303/Screens/SignInScreen.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);
  bool _isLoading = false;
  late Stream<DocumentSnapshot> _userStream;
  late User? _currentUser;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  void _getCurrentUser() {
    _currentUser = AuthService().getCurrentUser();
    if (_currentUser != null) {
      _userStream = FirebaseFirestore.instance
          .collection('Users')
          .doc(_currentUser!.uid)
          .snapshots();
    }
  }

  void logout(BuildContext context) async {
    final authService = AuthService();

    setState(() {
      _isLoading = true;
    });

    try {
      await authService.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation1,
              Animation<double> animation2) {
            return const SignInScreen();
          },
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
        (route) => false,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Error: $e"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
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
        leadingWidth: 40.w,
        backgroundColor: blackColor,
        title: Text(
          "Account Settings",
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
                StreamBuilder<DocumentSnapshot>(
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
                    final username = snapshot.data!.get('username');

                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
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
                          height: 12,
                        ),
                        Text(
                          username ?? 'Username',
                          style: TextStyle(
                            fontSize: 16,
                            color: whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 60.h,
                ),
                InkWell(
                  splashColor: purpleColor,
                  highlightColor: blackColor,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_rounded,
                          color: whiteColor,
                          size: 25.h,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Profile Details",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: whiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                InkWell(
                  splashColor: purpleColor,
                  highlightColor: blackColor,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Icon(
                          Icons.lock_rounded,
                          color: whiteColor,
                          size: 25.h,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Change Password",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: whiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                InkWell(
                  splashColor: purpleColor,
                  highlightColor: blackColor,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Icon(
                          Icons.image_rounded,
                          color: whiteColor,
                          size: 25.h,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          "Change Profile Picture",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: whiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : InkWell(
                        splashColor: purpleColor,
                        highlightColor: blackColor,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          logout(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10.w),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout_rounded,
                                color: whiteColor,
                                size: 25.h,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Text(
                                "Sign Out",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
