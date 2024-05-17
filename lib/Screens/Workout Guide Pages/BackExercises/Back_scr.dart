import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyUsernameField.dart';

class Back_scr extends StatefulWidget {
  const Back_scr({super.key});

  @override
  State<Back_scr> createState() => _Back_scrState();
}

class _Back_scrState extends State<Back_scr> {
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
                        'assets/images/Back_scr.png',
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
                      "Seated Cable Row",
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
                      "Primary Muscle Group: Back",
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
                  "1. Take a seat on the machine with your feet planted, a little wider than shoulder width. Drive the heels, and squeeze the glutes. Grab onto the cable handle.\n"
                  "2. Sit up tall with a slight bend through the knees. Tighten up the abs and low back to maintain a perpendicular angle to the floor with your torso.\n"
                  "3. Roll the shoulders back and down. Squeeze them together as you row, thinking about pinching a pencil in between them. As you do this, pull the handle back towards you, landing right above your belly button.\n"
                  "4. Pause here for a moment before returning the handle, still squeezing the shoulder blades. Once you've returned the weight to the stack, then allow the shoulder blades to relax, without pulling the torso forward.\n"
                  "5. Repeat to go for another rep.\n",
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
