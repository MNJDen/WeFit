import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyUsernameField.dart';

class Shoulders_op extends StatefulWidget {
  const Shoulders_op({super.key});

  @override
  State<Shoulders_op> createState() => _Shoulders_opState();
}

class _Shoulders_opState extends State<Shoulders_op> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Back",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: whiteColor,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/Shoulders_op.png',
                      height: 150.h, // Adjust the height as needed
                      width: 320.w, // Adjust the width as needed
                      fit: BoxFit.cover,
                    ),
                  ],
                ).animate().fadeIn(delay: const Duration(milliseconds: 400)),
                SizedBox(
                  height: 17.h,
                ),
                Row(
                  children: [
                    Text(
                      "Overhead Press",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: const Duration(milliseconds: 500)),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Text(
                      "Primary Muscle Group: Shoulders",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w200,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: const Duration(milliseconds: 600)),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "1. Stand with the bar on your front shoulders, and your hands next to your shoulders.\n"
                  "2. Press the bar over your head, until it’s balanced over your shoulders and mid-foot.\n"
                  "3. Lock your elbows at the top, and shrug your shoulders to the ceiling.\n",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w200,
                    color: whiteColor,
                  ),
                ).animate().fadeIn(delay: const Duration(milliseconds: 700)),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: const Duration(milliseconds: 300));
  }
}
