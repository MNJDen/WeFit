import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutGuidePage_Back extends StatefulWidget {
  const WorkoutGuidePage_Back({super.key});

  @override
  State<WorkoutGuidePage_Back> createState() => _WorkoutGuidePage_BackState();
}

class _WorkoutGuidePage_BackState extends State<WorkoutGuidePage_Back> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  // List of image paths
  final List<String> chestExerciseImages = [
    // 'assets/images/dbFlatBenchPress.png',
    // 'assets/images/dbInclineBenchPress.png',
    // 'assets/images/dbFlatBenchFlys.png',
    // 'assets/images/dbInclineBenchFlys.png',
    // Add more image paths as needed
  ];

  // List of exercise names corresponding to each image
  final List<String> chestExerciseNames = [
    'Lat Pull-Down',
    'Seated Cable Row',
    'Bent-Over Row',
    'Lat Pull-Over',
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
                      "Back",
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
                      "Choose a back exercise you wish to learn",
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
                  children: List.generate(chestExerciseImages.length, (index) {
                    return InkWell(
                      onTap: () {},
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
