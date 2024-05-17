import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/CardioExercises/Cardio_b.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/CardioExercises/Cardio_c.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/CardioExercises/Cardio_e.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/CardioExercises/Cardio_jr.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/CardioExercises/Cardio_rj.dart';

class WorkoutGuidePage_Cardio extends StatefulWidget {
  const WorkoutGuidePage_Cardio({super.key});

  @override
  State<WorkoutGuidePage_Cardio> createState() =>
      _WorkoutGuidePage_CardioState();
}

class _WorkoutGuidePage_CardioState extends State<WorkoutGuidePage_Cardio> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  //List of Route
  final List<Widget> cardioExerciseScreens = [
    const Cardio_b(),
    const Cardio_c(),
    const Cardio_e(),
    const Cardio_jr(),
    const Cardio_rj(),
  ];
  // List of image paths
  final List<String> cardioExerciseImages = [
    'assets/images/Cardio_b.png',
    'assets/images/Cardio_c.png',
    'assets/images/Cardio_e.png',
    'assets/images/Cardio_jr.png',
    'assets/images/Cardio_rj.png',
    // Add more image paths as needed
  ];

  // List of exercise names corresponding to each image
  final List<String> cardioExerciseNames = [
    'Burpee',
    'Cycling',
    'Elliptical',
    'Jump Rope',
    'Running/Jogging',
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
                      "Cardio",
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
                      "Choose a cardio exercise you wish to learn",
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
                    cardioExerciseImages.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return cardioExerciseScreens[index];
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
                                  cardioExerciseImages[index],
                                  height: 100.h, // Adjust the height as needed
                                  width: 320.w, // Adjust the width as needed
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    cardioExerciseNames[index],
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
