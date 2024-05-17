import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ShoulderExercises/Shoulders_dsp.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ShoulderExercises/Shoulders_fr.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ShoulderExercises/Shoulders_op.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ShoulderExercises/Shoulders_rf.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ShoulderExercises/Shoulders_slr.dart';

class WorkoutGuidePage_Shoulders extends StatefulWidget {
  const WorkoutGuidePage_Shoulders({super.key});

  @override
  State<WorkoutGuidePage_Shoulders> createState() =>
      _WorkoutGuidePage_ShouldersState();
}

class _WorkoutGuidePage_ShouldersState
    extends State<WorkoutGuidePage_Shoulders> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  //List of Route
  final List<Widget> shouldersExerciseScreens = [
    const Shoulders_dsp(),
    const Shoulders_fr(),
    const Shoulders_op(),
    const Shoulders_rf(),
    const Shoulders_slr(),
  ];

  // List of image paths
  final List<String> shouldersExerciseImages = [
    'assets/images/Shoulders_dsp.png',
    'assets/images/Shoulders_fr.png',
    'assets/images/Shoulders_op.png',
    'assets/images/Shoulders_rf.png',
    'assets/images/Shoulders_slr.png',
    // Add more image paths as needed
  ];

  // List of exercise names corresponding to each image
  final List<String> shouldersExerciseNames = [
    'Dumbbell Shoulder Press',
    'Front Raise',
    'Overhead Press',
    'Reverse Flyes',
    'Side Lateral Raise',
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
                      "Shoulders",
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
                      "Choose a shoulder exercise you wish to learn",
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
                    shouldersExerciseImages.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return shouldersExerciseScreens[index];
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
                                  shouldersExerciseImages[index],
                                  height: 100.h, // Adjust the height as needed
                                  width: 320.w, // Adjust the width as needed
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    shouldersExerciseNames[index],
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
