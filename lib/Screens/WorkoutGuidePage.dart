import 'package:flutter/material.dart';
import 'package:itec303/Screens/HomeScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Abs.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Arms.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Back.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Cardio.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Chest.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Glutes.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Legs.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Shoulders.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WorkoutGuidePage extends StatefulWidget {
  final DateTime selectedDate;

  const WorkoutGuidePage({Key? key, required this.selectedDate})
      : super(key: key);

  @override
  State<WorkoutGuidePage> createState() => _WorkoutGuidePageState();
}

class _WorkoutGuidePageState extends State<WorkoutGuidePage> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);
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
                  height: 4.h,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Choose a muscle group you wish to learn",
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: whiteColor,
                              fontWeight: FontWeight.w100),
                        ),
                      ],
                    ).animate().fadeIn(delay: const Duration(milliseconds: 400)),
                    SizedBox(
                      height: 4.h,
                    ),
                    //firstRow
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
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
                          child: SizedBox(
                            height: 190.h,
                            width: 160.w,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  Ink.image(
                                    image:
                                        AssetImage('assets/images/chest.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: Text(
                                        'Chest',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) {
                                  return WorkoutGuidePage_Back();
                                },
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 190.h,
                            width: 160.w,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  Ink.image(
                                    image:
                                        AssetImage('assets/images/Backpng.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: Text(
                                        'Back',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).animate().fadeIn(delay: const Duration(milliseconds: 500)),
                    SizedBox(
                      height: 2.h,
                    ),
                    //secondRow
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) {
                                  return WorkoutGuidePage_Legs();
                                },
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 190.h,
                            width: 160.w,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  Ink.image(
                                    image:
                                        AssetImage('assets/images/Legs_lp.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: Text(
                                        'Legs',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) {
                                  return WorkoutGuidePage_Shoulders();
                                },
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 190.h,
                            width: 160.w,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  Ink.image(
                                    image: AssetImage(
                                        'assets/images/Shoulders_dsp.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: Text(
                                        'Shoulders',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).animate().fadeIn(delay: const Duration(milliseconds: 600)),
                    SizedBox(
                      height: 2.h,
                    ),
                    //thirdRow
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) {
                                  return WorkoutGuidePage_Arms();
                                },
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 190.h,
                            width: 160.w,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  Ink.image(
                                    image: AssetImage('assets/images/Arms.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: Text(
                                        'Arms',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) {
                                  return WorkoutGuidePage_Abs();
                                },
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 190.h,
                            width: 160.w,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  Ink.image(
                                    image: AssetImage('assets/images/Abs.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: Text(
                                        'Abs',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).animate().fadeIn(delay: const Duration(milliseconds: 700)),
                    SizedBox(
                      height: 2.h,
                    ),
                    //fourthRow
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) {
                                  return WorkoutGuidePage_Cardio();
                                },
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 190.h,
                            width: 160.w,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  Ink.image(
                                    image:
                                        AssetImage('assets/images/Cardio.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: Text(
                                        'Cardio',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) {
                                  return WorkoutGuidePage_Glutes();
                                },
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            );
                          },
                          child: SizedBox(
                            height: 190.h,
                            width: 160.w,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  Ink.image(
                                    image:
                                        AssetImage('assets/images/Glutes.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Center(
                                      child: Text(
                                        'Glutes',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).animate().fadeIn(delay: const Duration(milliseconds: 800)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: const Duration(milliseconds: 300));
  }
}
