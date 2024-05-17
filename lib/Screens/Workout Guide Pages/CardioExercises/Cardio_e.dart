import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyUsernameField.dart';

class Cardio_e extends StatefulWidget {
  const Cardio_e({super.key});

  @override
  State<Cardio_e> createState() => _Cardio_eState();
}

class _Cardio_eState extends State<Cardio_e> {
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
                        'assets/images/Cardio_e.png',
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
                      "Elliptical",
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
                      "Primary Muscle Group: Cardio",
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
                  "1. Stand up tall with your shoulder blades gently pulled back. Pull your head up and back while tucking your chin to ensure proper upper body posture.\n"
                  "2. Let your upper trap muscles relax and lose any tension that is lifting your shoulders.\n"
                  "3. Naturally, extend your arm to grab onto the handlebars. Let your elbows maintain a soft, comfortable bend.\n"
                  "4. Gently hold onto the handlebars with minimal tension in your hands. Over gripping leads to unnecessary and extra muscle activation in your hands and forearms.\n"
                  "5. Slightly pulling your hips forward takes your low back out of hyperextension to properly align your spine. This position also activates your glutes and abdominal muscles to help build postural strength.\n"
                  "6. Your heel typically comes off the foot pedal, and you push through the ball of your foot to drive forward. This motion should feel natural.\n"
                  "7. The entire foot stays flat to pull back with your hamstrings and cycle the pedal back to its starting motion. This portion of the cycle is beneficial for taking pressure off the knees by strengthening the back of your leg.\n"
                  "8. During the motion, the foot and knees point forward to keep proper body alignment.\n"
                  "9. The entire revolution feels smooth and rhythmic. Like running or biking, you can get into a groove, and each pedal stroke leads into the next.\n",
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
