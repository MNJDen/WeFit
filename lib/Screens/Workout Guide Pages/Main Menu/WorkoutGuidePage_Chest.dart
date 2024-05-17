import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ChestExercises/Chest_dfbf.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ChestExercises/Chest_dfbp.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ChestExercises/Chest_dibf.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ChestExercises/Chest_dibp.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WorkoutGuidePage_Chest extends StatefulWidget {
  const WorkoutGuidePage_Chest({super.key});

  @override
  State<WorkoutGuidePage_Chest> createState() => _WorkoutGuidePage_ChestState();
}

class _WorkoutGuidePage_ChestState extends State<WorkoutGuidePage_Chest> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  //List of Route
  final List<Widget> chestExerciseScreens = [
    const Chest_dfbp(),
    const Chest_dibp(),
    const Chest_dfbf(),
    const Chest_dibf(),
  ];
  // List of image paths
  final List<String> chestExerciseImages = [
    'assets/images/dbFlatBenchPress.png',
    'assets/images/dbInclineBenchPress.png',
    'assets/images/dbFlatBenchFlys.png',
    'assets/images/dbInclineBenchFlys.png',
    // Add more image paths as needed
  ];

  // List of exercise names corresponding to each image
  final List<String> chestExerciseNames = [
    'Dumbbell Flat Bench Press',
    'Dumbbell Incline Bench Press',
    'Dumbbell Flat Bench Flys',
    'Dumbbell Incline Bench Flys',
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
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      "Chest",
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
                      "Choose a chest exercise you wish to learn",
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
                    chestExerciseImages.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return chestExerciseScreens[index];
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
                                  chestExerciseImages[index],
                                  height: 100.h, // Adjust the height as needed
                                  width: 320.w, // Adjust the width as needed
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    chestExerciseNames[index],
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
