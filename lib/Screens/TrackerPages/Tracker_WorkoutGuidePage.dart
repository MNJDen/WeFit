import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Constants/exercises_constants.dart';
import 'package:itec303/Models/exercise_item.dart';
import 'package:itec303/Screens/SetExercisePages/AddExercise.dart';
import 'package:itec303/Screens/TrackerPages/Tracker_AddExercise.dart';

class Tracker_WorkoutGuidePage extends StatefulWidget {
  const Tracker_WorkoutGuidePage({
    Key? key,
  }) : super(key: key);

  @override
  State<Tracker_WorkoutGuidePage> createState() => _Tracker_WorkoutGuidePageState();
}

class _Tracker_WorkoutGuidePageState extends State<Tracker_WorkoutGuidePage> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  List<String> exerciseCategoryImages = [
    'chest.jpg',
    'Backpng.png',
    'Legs_lp.png',
    'Shoulders_dsp.png',
    'Arms.png',
    'Abs.png',
    'Cardio.png',
    'Glutes.png',
  ];

  List<String> exerciseCategoryNames = [
    'Chest',
    'Back',
    'Legs',
    'Shoulders',
    'Arms',
    'Abs',
    'Cardio',
    'Glutes',
  ];

  List<List<ExerciseItem>> allExercises = [
    ExercisesConstants.chestExercises,
    ExercisesConstants.backExercises,
    ExercisesConstants.legExercises,
    ExercisesConstants.shoulderExercises,
    ExercisesConstants.armsExercises,
    ExercisesConstants.absExercises,
    ExercisesConstants.cardioExercises,
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
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                children: List.generate(allExercises.length, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                              Animation<double> animation1,
                              Animation<double> animation2) {
                            return Tracker_AddExercise(
                              exercises: allExercises[index],
                              categoryName: exerciseCategoryNames[index],
                            );
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
                                  'assets/images/${exerciseCategoryImages[index]}'),
                              fit: BoxFit.cover,
                            ),
                            Positioned(
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
