import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyUsernameField.dart';

class Cardio_b extends StatefulWidget {
  const Cardio_b({super.key});

  @override
  State<Cardio_b> createState() => _Cardio_bState();
}

class _Cardio_bState extends State<Cardio_b> {
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
                      '',
                      height: 150.h, // Adjust the height as needed
                      width: 320.w, // Adjust the width as needed
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(
                  height: 17.h,
                ),
                Row(
                  children: [
                    Text(
                      "Burpee",
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
                  "1. Start standing with your feet shoulder-width apart.\n"
                  "2. Squat down, placing your hands flat on the floor inside your feet.\n"
                  "3. Leap your feet back into a pushup position, squeezing your shoulder blades, abs, and glutes. Your feet should be slightly wider than shoulder-width apart.\n"
                  "4. Bend at the elbows to lower your chest down to the floor. Control this movement rather than throwing yourself straight down.\n"
                  "5. Press back up into the pushup.\n"
                  "6. Leap your feet forward back to the initial squatting position.\n"
                  "7. Explode straight up into the air powerfully, with triple extension through the ankle, knee, and hip.\n"
                  "8. Land back on the floor under control.\n",
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
