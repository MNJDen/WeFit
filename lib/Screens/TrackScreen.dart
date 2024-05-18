import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:itec303/Components/MyPasswordField.dart';
// import 'package:itec303/Constants/exercises_constants.dart';
import 'package:itec303/Models/exercise_progress.dart';
import 'package:itec303/Models/exercise_item.dart';
import 'package:itec303/Screens/TrackerPages/TrackSave.dart';
import 'package:itec303/Screens/TrackerPages/Tracker_WorkoutGuidePage.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  List<ExerciseProgress> exerciseProgresses = [];

  List<String> filteredMuscleGroups = [];

  @override
  void initState() {
    super.initState();
    // Call a method to fetch exercise progress data from Firestore
    fetchExerciseProgressData();
  }

  // Method to fetch exercise progress data from Firestore
  Future<void> fetchExerciseProgressData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final String uid = user!.uid;
    // You can replace 'users' and 'exerciseProgress' with your actual Firestore collection names
    final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('exerciseTracker')
        .doc(uid)
        .collection('exerciseProgress')
        .get();

    // Clear existing exerciseProgresses list
    setState(() {
      exerciseProgresses.clear();
    });

    // Loop through the documents and create ExerciseProgress objects
    snapshot.docs.forEach((doc) {
      ExerciseProgress exerciseProgress = ExerciseProgress(
        // Assuming the document fields match ExerciseProgress model fields
        numSets: doc['sets'],
        numReps: doc['reps'],
        numWeights: doc['weight'],
        mins: doc['minutes'],
        muscleGroup: doc['muscleGroup'],
        // You can add more fields as needed
        // Exercise ID, name, imagePath, etc.
        exercise: ExerciseItem(
          id: doc['exerciseId'],
          name: doc['exerciseName'],
          imagePath: doc['imagePath'],
        ),
      );

      // Add the ExerciseProgress object to the list
      setState(() {
        exerciseProgresses.add(exerciseProgress);
      });
    });
  }

  void handleFilterPressed(String muscleGroup) {
    setState(() {
      if (filteredMuscleGroups.contains(muscleGroup)) {
        filteredMuscleGroups.remove(muscleGroup);
      } else {
        filteredMuscleGroups.add(muscleGroup);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> muscleGroups = [
      "Chest",
      "Back",
      "Legs",
      "Shoulders",
      "Arms",
      "Abs",
      "Cardio",
      "Glutes"
    ];

    return Scaffold(
      backgroundColor: Colors.black,
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
                      "Progress Tracker",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: purpleColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 17.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: muscleGroups.map((group) {
                      final isSelected = filteredMuscleGroups.contains(group);
                      return Container(
                        margin: EdgeInsets.only(right: 8.w),
                        child: InkWell(
                          onTap: () => {handleFilterPressed(group)},
                          child: Chip(
                            label: Text(group),
                            backgroundColor:
                                isSelected ? purpleColor : blackColor,
                            labelStyle: TextStyle(
                              color: whiteColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 32.h),
                Column(
                  children: [
                    // Display the list of exercise cards
                    ...exerciseProgresses
                        .where((epItem) =>
                            filteredMuscleGroups.contains(epItem.muscleGroup) ||
                            filteredMuscleGroups.isEmpty)
                        .map(
                          (epItem) => Column(
                            children: [
                              SizedBox(
                                width: 370.w,
                                height: 115.h,
                                child: Stack(
                                  children: [
                                    // Background image
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              epItem.exercise.imagePath),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: ShaderMask(
                                        shaderCallback: (rect) {
                                          return LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Colors.black.withOpacity(0),
                                              Colors.black.withOpacity(0.3),
                                              Colors.black.withOpacity(0.7),
                                              Colors.black,
                                            ],
                                          ).createShader(rect);
                                        },
                                        blendMode: BlendMode.overlay,
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          color: Colors.black.withOpacity(0.1),
                                        ),
                                      ),
                                    ),
                                    // Card with ListTile
                                    Card(
                                      color: Colors.transparent,
                                      elevation: 0,
                                      child: ListTile(
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              epItem.exercise.name,
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                                color: whiteColor,
                                              ),
                                            ),
                                            SizedBox(height: 4.h),
                                            Row(
                                              children: [
                                                if (epItem.mins != 0)
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Mins: ' +
                                                            epItem.mins
                                                                .toString(),
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: whiteColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                if (epItem.mins == 0)
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Sets: ' +
                                                            epItem.numSets
                                                                .toString(),
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: whiteColor,
                                                        ),
                                                      ),
                                                      SizedBox(width: 4.w),
                                                      Text(
                                                        'Reps: ' +
                                                            epItem.numReps
                                                                .toString(),
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: whiteColor,
                                                        ),
                                                      ),
                                                      SizedBox(width: 4.w),
                                                      Text(
                                                        'Weight: ' +
                                                            epItem.numWeights
                                                                .toString() +
                                                            " lbs",
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: whiteColor,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                              ],
                                            ),
                                          ],
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        trailing: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder:
                                                    (BuildContext context,
                                                        Animation<double>
                                                            animation1,
                                                        Animation<double>
                                                            animation2) {
                                                  return TrackSave(
                                                    exercise: epItem.exercise,
                                                    categoryName:
                                                        epItem.muscleGroup,
                                                    initialReps: epItem.numReps,
                                                    initialSets: epItem.numSets,
                                                    initialWeight:
                                                        epItem.numWeights,
                                                  );
                                                },
                                                transitionDuration:
                                                    Duration.zero,
                                                reverseTransitionDuration:
                                                    Duration.zero,
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            size: 21.sp,
                                            color: purpleColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                    SizedBox(height: 8.h),
                    // Display the button to add more exercises
                    SizedBox(
                      height: 100.h,
                      width: 320.w,
                      child: DottedBorder(
                        dashPattern: [6, 5, 6, 5],
                        color: purpleColor,
                        strokeWidth: 1.w,
                        borderType: BorderType.RRect,
                        radius: Radius.circular(15),
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Tracker_WorkoutGuidePage(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 24.w,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Icon(
                                  Icons.add_circle,
                                  color: purpleColor,
                                  size: 40.0,
                                ),
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
                    SizedBox(height: 20.h),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
