import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Models/exercise_item.dart';
import 'package:itec303/Screens/SetExercise.dart';

class AddExercise extends StatefulWidget {
  final List<ExerciseItem> exercises;
  final String categoryName;
  final DateTime currentDate;

  const AddExercise({
    Key? key,
    required this.exercises,
    required this.categoryName,
    required this.currentDate,
  }) : super(key: key);

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  List<ExerciseItem> selectedExercises = [];

  void _toggleSelection(ExerciseItem selected) {
    setState(() {
      if (selectedExercises.contains(selected)) {
        selectedExercises.remove(selected);
      } else {
        selectedExercises.add(selected);
      }
    });
  }

  void _onNextButtonPressed() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation1,
            Animation<double> animation2) {
          return SetExercise(
            today: widget.currentDate,
            selectedExercises: selectedExercises,
          );
        },
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Back",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: whiteColor,
          ),
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
        actions: [
          Row(
            children: [
              Text(
                "Next",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: whiteColor,
                ),
              ),
              IconButton(
                onPressed: _onNextButtonPressed,
                icon: Icon(
                  Icons.arrow_circle_right_rounded,
                  color: purpleColor,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Text(
                      widget.categoryName,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: purpleColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Row(
                  children: [
                    Text(
                      "Choose ${widget.categoryName.toLowerCase()} exercise you wish to do for the day",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w100,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Column(
                  children: List.generate(widget.exercises.length, (index) {
                    final isSelected =
                        selectedExercises.contains(widget.exercises[index]);
                    return InkWell(
                      onTap: () => _toggleSelection(widget.exercises[index]),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected ? purpleColor : blackColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  widget.exercises[index].imagePath,
                                  height: 100.h,
                                  width: 320.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned.fill(
                                child: Center(
                                  child: Text(
                                    widget.exercises[index].name,
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
