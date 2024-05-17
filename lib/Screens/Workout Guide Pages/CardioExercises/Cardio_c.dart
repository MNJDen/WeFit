import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyUsernameField.dart';

class Cardio_c extends StatefulWidget {
  const Cardio_c({super.key});

  @override
  State<Cardio_c> createState() => _Cardio_cState();
}

class _Cardio_cState extends State<Cardio_c> {
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
                      'assets/images/Cardio_c.png',
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
                      "Cycling",
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
                      "Primary Muscle Group: Cardio",
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
                  "1. Relax your shoulders and bring them down, away from your ears. If you have been pushing hard on a climb, you may notice those shoulders stiffen and start to creep up again.\n"
                  "2. Lowering your shoulders away from your ears will free up your head, making it easier to turn and look for traffic and actually helps you stay more alert!\n"
                  "3. Bend your elbows! Just like on a mountain bike, riding with relaxed, bent elbows allows your arms to act like suspension. If you hit a pothole or bump in the road, your arms can help you absorb impact. Unlike mountain bike body position, your elbows should be tucked into your sides instead of out wide like wings. Keeping your elbows bent will also reduce strain in your shoulders and allow you to ride with less pressure in your hands.\n"
                  "4. There should not, however, be a bend in your wrists. Maintain a straight line from your elbow through your fingers on the brakes. If this is hard, it might be a bike setup issue. You should discuss brake lever and hood position with your professional bike fitter.\n"
                  "5. Maintain a neutral spine. What does that mean? Well, it’s kind of like yoga. If you are familiar with the Cat and Cow positions in yoga, either of those positions while in the saddle could cause pain down below and inefficiency on the bike. Your back should be relaxed, keeping a fairly straight line between your hips and your shoulders. The best way to check this position while you are riding is to ask yourself: Is my core engaged? If your abdominal muscles are taking a break while cycling, it could result in a slouched riding position that could put pressure on your hands, shoulders or parts of your crotch.\n"
                  "6. Make sure your knee is tracking over the ball of your foot/pedal. If your knees are bowing out to the side when you ride, it may look a little funny and it will definitely cause inefficiency and pain.\n",
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
