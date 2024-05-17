import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyPasswordField.dart';
import 'package:itec303/Components/myPurpleBtn.dart';
import 'package:itec303/Services/Auth/Auth_Service.dart';

final blackColor = const Color.fromRGBO(13, 13, 13, 1);
final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late Stream<DocumentSnapshot> _userStream;
  late User? _currentUser;
  late TextEditingController _oldPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _oldPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
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

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

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
                    final username = snapshot.data!.get('username');

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
                          height: 12.h,
                        ),
                        Text(
                          username ?? 'Username',
                          style: TextStyle(
                            fontSize: 20,
                            color: whiteColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 60.h,
                        ),
                        MyPasswordField(
                          prefixIcon: Icons.lock_rounded,
                          suffixIcon: Icons.visibility_off_rounded,
                          labelText: "Old Password",
                          controller: _oldPasswordController,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        MyPasswordField(
                          prefixIcon: Icons.lock_rounded,
                          suffixIcon: Icons.visibility_off_rounded,
                          labelText: "New Password",
                          controller: _newPasswordController,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        MyPasswordField(
                          prefixIcon: Icons.lock_rounded,
                          suffixIcon: Icons.visibility_off_rounded,
                          labelText: "Confirm Password",
                          controller: _confirmPasswordController,
                        ),
                        SizedBox(height: 140.h,),
                        MyPurpleBtn(name: "Save", onPressed: () {} ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
