import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SetExercise extends StatefulWidget {
  final DateTime today;

  const SetExercise({Key? key, required this.today}) : super(key: key);

  @override
  State<SetExercise> createState() => _SetExerciseState();
}

class _SetExerciseState extends State<SetExercise> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  @override
  Widget build(BuildContext context) {
    DateTime today = widget.today;
    String monthName = DateFormat('MMMM').format(today);
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
        leadingWidth: 40.w,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                // Your text widgets
                Row(
                  children: [
                    Text(
                      monthName,
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: purpleColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 9.w,
                    ),
                    Text(
                      today.day.toString(),
                      style: TextStyle(
                        fontSize: 48.sp,
                        color: purpleColor,
                        fontWeight: FontWeight.w700,
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
                      "Here are the exercises you have for the day",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w100,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                InkWell(
                  onTap: () {
                    //   Navigator.push(
                    //         context,
                    //         PageRouteBuilder(
                    //           pageBuilder: (BuildContext context,
                    //               Animation<double> animation1,
                    //               Animation<double> animation2) {
                    //             return ;
                    //           },
                    //           transitionDuration: Duration.zero,
                    //           reverseTransitionDuration: Duration.zero,
                    //         ),
                    //       );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: DottedBorder(
                      dashPattern: [6, 5, 6, 5],
                      color: purpleColor,
                      strokeWidth: 1.w,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(15),
                      child: Container(
                        height: 100.h,
                        width: 320.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle,
                              color: purpleColor,
                              size: 40.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'Tap to add an exercise',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w200,
                                color: whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
