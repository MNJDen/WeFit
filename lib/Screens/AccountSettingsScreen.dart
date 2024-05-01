import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyPasswordField.dart';
import 'package:itec303/Services/Auth/Auth_Service.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key});

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: purpleColor, width: 1.w),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/Pedro.jpg',
                          fit: BoxFit.cover,
                          width: 100.w,
                          height: 100.h,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Stefan0",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
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
                InkWell(
                  splashColor: purpleColor,
                  highlightColor: blackColor,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    logout();
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
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.person),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
