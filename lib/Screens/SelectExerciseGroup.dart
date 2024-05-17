import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Constants/exercises_constants.dart';
import 'package:itec303/Models/exercise_item.dart';
import 'package:itec303/Screens/AddExercise.dart';

class SelectExerciseGroup extends StatefulWidget {
  final DateTime currentDate;
  const SelectExerciseGroup({
    required this.currentDate,
    Key? key,
  }) : super(key: key);

  @override
  State<SelectExerciseGroup> createState() => _SelectExerciseGroupState();
}

class _SelectExerciseGroupState extends State<SelectExerciseGroup> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  List<String> exerciseCategoryImages = [
    'Abs.png',
    'Arms.png',
    'Backpng.png',
    'Cardio.png',
    'chest.jpg',
    'Legs_lp.png',
    'Shoulders_dsp.png',
    'Glutes.png',
  ];

  List<String> exerciseCategoryNames = [
    'Abs',
    'Arms',
    'Back',
    'Cardio',
    'Chest',
    'Legs',
    'Shoulders',
    'Glutes',
  ];

  List<List<ExerciseItem>> allExercises = [
    ExercisesConstants.absExercises,
    ExercisesConstants.armsExercises,
    ExercisesConstants.backExercises,
    ExercisesConstants.cardioExercises,
    ExercisesConstants.chestExercises,
    ExercisesConstants.legExercises,
    ExercisesConstants.shoulderExercises,
    ExercisesConstants.gluteExercises,
  ];
  

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a muscle group you wish to do for the day',
              style: TextStyle(
                fontSize: 12.sp,
                color: whiteColor,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(height: 20.h), // Adding space between Text and GridView
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: List.generate(allExercises.length, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                              Animation<double> animation1,
                              Animation<double> animation2) {
                            return AddExercise(
                              exercises: allExercises[index],
                              categoryName: exerciseCategoryNames[index],
                              currentDate: widget.currentDate,
                            );
                          },
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: [
                          Ink.image(
                            image: AssetImage(
                                'assets/images/${exerciseCategoryImages[index]}'),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Center(
                              child: Text(
                                exerciseCategoryNames[index],
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
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
