import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/myForm.dart';
import 'package:itec303/Components/myPurpleBtn.dart';
import 'package:itec303/Screens/SignInScreen.dart';
import 'package:itec303/Screens/SignUpScreen1.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

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
                  height: 48.h,
                ),
                myForm(
                  label: "Username",
                  prefixIcon: Icon(
                    Icons.person_rounded,
                    color: purpleColor,
                  ),
                  obscure: false,
                ).animate().fadeIn(delay: Duration(milliseconds: 500)),
                SizedBox(
                  height: 16.h,
                ),
                myForm(
                  label: "Password",
                  prefixIcon: Icon(
                    Icons.lock_rounded,
                    color: purpleColor,
                  ),
                  obscure: true,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility_off_rounded),
                    color: purpleColor,
                  ),
                ).animate().fadeIn(delay: Duration(milliseconds: 600)),
                SizedBox(
                  height: 16.h,
                ),
                myForm(
                  label: "Confirm Password",
                  prefixIcon: Icon(
                    Icons.lock_rounded,
                    color: purpleColor,
                  ),
                  obscure: true,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility_off_rounded),
                    color: purpleColor,
                  ),
                ).animate().fadeIn(delay: Duration(milliseconds: 700)),
                SizedBox(
                  height: 32.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      spacing: 10.w,
                      children: [
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(169, 88, 237, 1),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Container(
                          width: 8.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(169, 88, 237, 0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 32.h,
                ),
                myPurpleBtn(
                  name: "Continue",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen1();
                        },
                      ),
                    );
                  },
                ).animate().fadeIn(delay: Duration(milliseconds: 800)),
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
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SignInScreen();
                                },
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
