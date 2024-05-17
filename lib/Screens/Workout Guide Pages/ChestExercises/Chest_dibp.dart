import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyUsernameField.dart';

class Chest_dibp extends StatefulWidget {
  const Chest_dibp({super.key});

  @override
  State<Chest_dibp> createState() => _Chest_dibpState();
}

class _Chest_dibpState extends State<Chest_dibp> {
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
                      'assets/images/dbInclineBenchPress.png',
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
                      "Dumbbell Incline Bench Press",
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
                      "Primary Muscle Group: Chest",
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
                  "1. Sit on the bench and lean back. Hold a dumbbell in each hand, with hands positioned at your shoulders, elbows bent and angled down below your ribs. Relax your neck against the bench. Keep your feet flat on the floor.\n"
                  "2. Brace your core and press both dumbbells straight over your chest as you exhale. Keep your wrists straight (don't let them \"cock\" backward). At the top of the movement, the dumbbells should almost touch each other, and your arms should be perpendicular to the floor.\n"
                  "3. Reverse the movement and slowly lower the dumbbells to the top of your chest as you inhale. As you lower the dumbbells, your elbows should come down at roughly a 45-degree angle to your torso. They shouldn't splay out to the sides, pointing toward the side of the room. Instead, keep your elbows pointing to the floor.\n"
                  "4. Aim to complete sets of 8 to 12 reps. Start with one set and work up to two to three sets over time as you build strength. When you finish your set, safely exit the exercise by sitting up and placing the dumbbells on your knees before you stand up. Avoid dropping the dumbbells while you're lying on the incline bench.\n",
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
