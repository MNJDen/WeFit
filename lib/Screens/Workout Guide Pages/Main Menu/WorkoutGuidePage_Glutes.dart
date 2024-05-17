import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/GlutesExercises/Glutes_bht.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/GlutesExercises/Glutes_dbss.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/GlutesExercises/Glutes_rd.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/GlutesExercises/Glutes_rh.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/GlutesExercises/Glutes_sht.dart';

class WorkoutGuidePage_Glutes extends StatefulWidget {
  const WorkoutGuidePage_Glutes({super.key});

  @override
  State<WorkoutGuidePage_Glutes> createState() =>
      _WorkoutGuidePage_GlutesState();
}

class _WorkoutGuidePage_GlutesState extends State<WorkoutGuidePage_Glutes> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  //List of Route
  final List<Widget> glutesExerciseScreens = [
    const Glutes_bht(),
    const Glutes_dbss(),
    const Glutes_rd(),
    const Glutes_rh(),
    const Glutes_sht(),
  ];
  // List of image paths
  final List<String> glutesExerciseImages = [
    'assets/images/Glutes_bht.png',
    'assets/images/Legs_bss.png',
    'assets/images/Glutes_rd.png',
    'assets/images/Glutes_rh.png',
    'assets/images/Glutes_sht.png',
    // Add more image paths as needed
  ];

  // List of exercise names corresponding to each image
  final List<String> glutesExerciseNames = [
    'Barbell Hip Thrust',
    'Dumbbell Bulgarian Split Squats',
    'Romanian Deadlift',
    'Reverse Hyper',
    'Single Hip Thrust',
    // Add more exercise names as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Text(
                      "Glutes",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: purpleColor,
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: const Duration(milliseconds: 400)),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Text(
                      "Choose a glute exercise you wish to learn",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w100,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: const Duration(milliseconds: 500)),
                SizedBox(
                  height: 12.h,
                ),
                // List of images displayed vertically
                Column(
                  children: List.generate(
                    glutesExerciseImages.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return glutesExerciseScreens[index];
                              },
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    15), // Adjust the border radius as needed
                                child: Image.asset(
                                  glutesExerciseImages[index],
                                  height: 100.h, // Adjust the height as needed
                                  width: 320.w, // Adjust the width as needed
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    glutesExerciseNames[index],
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ).animate().fadeIn(delay: const Duration(milliseconds: 600)),
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: const Duration(milliseconds: 300));
  }
}
