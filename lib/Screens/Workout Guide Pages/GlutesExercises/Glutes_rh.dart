import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyUsernameField.dart';

class Glutes_rh extends StatefulWidget {
  const Glutes_rh({super.key});

  @override
  State<Glutes_rh> createState() => _Glutes_rhState();
}

class _Glutes_rhState extends State<Glutes_rh> {
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
                      child: Image.asset(
                        'assets/images/Glutes_rh.png',
                        height: 150.h, // Adjust the height as needed
                        width: 320.w, // Adjust the width as needed
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 17.h,
                ),
                Row(
                  children: [
                    Text(
                      "Reverse Hyper",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Text(
                      "Primary Muscle Group: Glutes",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w200,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "1. Performing a Reverse Hyper begins with lying flat on a reverse hyperextension machine, hips aligned with the pad’s edge, gripping the handles for stability, and allowing your legs to hang off the bench.\n"
                  "2. With slightly bent knees, lift your legs using your glutes and hips until they’re parallel to the ground or slightly above.\n"
                  "3. The movement should be controlled, not powered by momentum, and you should keep a strong core throughout the exercise.\n",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w200,
                    color: whiteColor,
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
