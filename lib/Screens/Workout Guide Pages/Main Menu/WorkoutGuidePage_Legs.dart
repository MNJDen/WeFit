import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/LegExercises/Legs_bs.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/LegExercises/Legs_bss.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/LegExercises/Legs_le.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/LegExercises/Legs_lp.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/LegExercises/Legs_scr.dart';

class WorkoutGuidePage_Legs extends StatefulWidget {
  const WorkoutGuidePage_Legs({super.key});

  @override
  State<WorkoutGuidePage_Legs> createState() => _WorkoutGuidePage_LegsState();
}

class _WorkoutGuidePage_LegsState extends State<WorkoutGuidePage_Legs> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  //List of Route
  final List<Widget> legsExerciseScreens = [
    const Legs_bs(),
    const Legs_bss(),
    const Legs_le(),
    const Legs_lp(),
    const Legs_scr(),
  ];
  // List of image paths
  final List<String> legsExerciseImages = [
    'assets/images/Legs_bs.png',
    'assets/images/Legs_bss.png',
    'assets/images/Legs_le.png',
    'assets/images/Legs_lp.png',
    'assets/images/Legs_scr.png',
    // Add more image paths as needed
  ];

  // List of exercise names corresponding to each image
  final List<String> legsExerciseNames = [
    'Barbell Squat',
    'Bulgarian Split Squat',
    'Leg Extension',
    'Leg Press',
    'Standing Calf Raise',
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
                      "Legs",
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
                      "Choose a leg exercise you wish to learn",
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
                    legsExerciseImages.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return legsExerciseScreens[index];
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
                                  legsExerciseImages[index],
                                  height: 100.h, // Adjust the height as needed
                                  width: 320.w, // Adjust the width as needed
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    legsExerciseNames[index],
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
