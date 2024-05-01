import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/AbsExercises/Abs_c.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/AbsExercises/Abs_cc.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/AbsExercises/Abs_mc.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/AbsExercises/Abs_p.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/AbsExercises/Abs_rt.dart';

class WorkoutGuidePage_Abs extends StatefulWidget {
  const WorkoutGuidePage_Abs({super.key});

  @override
  State<WorkoutGuidePage_Abs> createState() => _WorkoutGuidePage_AbsState();
}

class _WorkoutGuidePage_AbsState extends State<WorkoutGuidePage_Abs> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  //List of Route
  final List<Widget> absExerciseScreens = [
    const Abs_c(),
    const Abs_cc(),
    const Abs_mc(),
    const Abs_p(),
    const Abs_rt(),
  ];
  // List of image paths
  final List<String> absExerciseImages = [
    'assets/images/Abs_c.png',
    'assets/images/Abs_cc.png',
    'assets/images/Abs_mc.png',
    'assets/images/Abs_p.png',
    'assets/images/Abs_rt.png',
    // Add more image paths as needed
  ];

  // List of exercise names corresponding to each image
  final List<String> absExerciseNames = [
    'Crunches',
    'Cable Crunches',
    'Mountain Climbers',
    'Plank',
    'Russian Twist',
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
                      "Abs",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: purpleColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Text(
                      "Choose an ab exercise you wish to learn",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w100,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                // List of images displayed vertically
                Column(
                  children: List.generate(absExerciseImages.length, (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation1,
                                Animation<double> animation2) {
                              return absExerciseScreens[index];
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
                              borderRadius: BorderRadius.circular(15), // Adjust the border radius as needed
                              child: Image.asset(
                                absExerciseImages[index],
                                height: 100.h, // Adjust the height as needed
                                width: 320.w, // Adjust the width as needed
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned.fill(
                              child: Center(
                                child: Text(
                                  absExerciseNames[index],
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
