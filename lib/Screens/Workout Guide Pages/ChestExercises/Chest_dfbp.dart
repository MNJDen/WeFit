import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyUsernameField.dart';

class Chest_dfbp extends StatefulWidget {
  const Chest_dfbp({super.key});

  @override
  State<Chest_dfbp> createState() => _Chest_dfbpState();
}

class _Chest_dfbpState extends State<Chest_dfbp> {
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
                      'assets/images/dbFlatBenchPressFull.png',
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
                      "Dumbbell Flat Bench Press",
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
                  "1. Lie on a flat bench holding a dumbbell in each hand with an overhand grip.\n"
                  "2. Start by holding the dumbbells slightly wider than shoulder width apart above your shoulders. Your palms should be facing forward.\n"
                  "3. Slowly bend your elbows until they are at a 90 degree angle and your upper arms are parallel to the ground.\n"
                  "4. Push the weights up by straightening your arms.\n"
                  "5. As you push the weights up, move your arms in an arc to bring the dumbbells together, until they meet over the center of your chest. Hold for a count of one.\n"
                  "6. Lower the dumbbells by slowly bending your elbows back to 90 degrees.\n"
                  "7. Continue lowering your arms until they are a little lower than parallel to the floor. (Your elbows should be pointing slightly towards the floor and you should feel a stretch in your chest muscles and shoulders.)",
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
