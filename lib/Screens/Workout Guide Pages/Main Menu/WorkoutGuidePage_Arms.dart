import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ArmExercises/Arms_bc.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ArmExercises/Arms_hc.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ArmExercises/Arms_tpd.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ArmExercises/Arms_ur.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/ArmExercises/Arms_wc.dart';

class WorkoutGuidePage_Arms extends StatefulWidget {
  const WorkoutGuidePage_Arms({super.key});

  @override
  State<WorkoutGuidePage_Arms> createState() => _WorkoutGuidePage_ArmsState();
}

class _WorkoutGuidePage_ArmsState extends State<WorkoutGuidePage_Arms> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  //List of Route
  final List<Widget> armsExerciseScreens = [
    const Arms_bc(),
    const Arms_hc(),
    const Arms_tpd(),
    const Arms_ur(),
    const Arms_wc(),
  ];
  // List of image paths
  final List<String> armsExerciseImages = [
    'assets/images/Arms_bc.png',
    'assets/images/Arms_hc.png',
    'assets/images/Arms_tpd.png',
    'assets/images/Arms_ur.png',
    'assets/images/Arms_wc.png',
    // Add more image paths as needed
  ];

  // List of exercise names corresponding to each image
  final List<String> armsExerciseNames = [
    'Bicep Curls',
    'Hammer Curls',
    'Tricep Push-Down',
    'Upright Row',
    'Wrist Curl',
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
                      "Arms",
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
                      "Choose an arm exercise you wish to learn",
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
                  children: List.generate(armsExerciseImages.length, (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation1,
                                Animation<double> animation2) {
                              return armsExerciseScreens[index];
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
                                armsExerciseImages[index],
                                height: 100.h, // Adjust the height as needed
                                width: 320.w, // Adjust the width as needed
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned.fill(
                              child: Center(
                                child: Text(
                                  armsExerciseNames[index],
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
