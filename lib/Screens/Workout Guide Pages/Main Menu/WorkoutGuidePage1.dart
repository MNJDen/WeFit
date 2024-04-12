import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Screens/SignUpScreen.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/WorkoutGuidePage_Chest.dart';

class WorkoutGuidePage1 extends StatefulWidget {
  const WorkoutGuidePage1({super.key});

  @override
  State<WorkoutGuidePage1> createState() => _WorkoutGuidePage1State();
}

class _WorkoutGuidePage1State extends State<WorkoutGuidePage1> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

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
      backgroundColor: blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 27.h,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation1,
                                Animation<double> animation2) {
                              return SignUpScreen();
                            },
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_circle_left_rounded,
                          color: Color.fromRGBO(169, 88, 237, 1), size: 28),
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 27.h,
                ),
                Row(
                  children: [
                    Text(
                      "Chest",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: purpleColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Choose a chest exercise you wish to learn",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                // List of images displayed vertically
                Column(
                  children: List.generate(chestExerciseImages.length, (index) {
                    return InkWell(
                      onTap: () {
                         Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation1,
                                Animation<double> animation2) {
                              return WorkoutGuidePage_Chest();
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
                            Image.asset(
                              chestExerciseImages[index],
                              height: 75.h, // Adjust the height as needed
                              width: 320.w, // Adjust the width as needed
                              fit: BoxFit.cover,
                            ),
                            Positioned.fill(
                              child: Center(
                                child: Text(
                                  chestExerciseNames[index],
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
