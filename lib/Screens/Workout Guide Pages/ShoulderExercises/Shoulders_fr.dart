import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyUsernameField.dart';

class Shoulders_fr extends StatefulWidget {
  const Shoulders_fr({super.key});

  @override
  State<Shoulders_fr> createState() => _Shoulders_frState();
}

class _Shoulders_frState extends State<Shoulders_fr> {
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
                      'assets/images/Shoulders_fr.png',
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
                      "Front Raise",
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
                  "1. Grab two dumbbells and stand up straight. The dumbbells should be in front of your thighs with your hands facing down. This is the starting position.\n"
                  "2. While keeping your torso stationary, lift the dumbbells to the front. Your elbows should be slightly bent. Lift the dumbbells up until your arms are slightly above the level where they would be parallel to the floor. Exhale as you do so, and pause for a second when you get to the top.\n"
                  "3. Lower the dumbbells back to the starting position, inhaling as you do so.\n"
                  "4. Repeat for the desired number of reps.\n",
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
