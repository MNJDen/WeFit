// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:itec303/Components/MyPasswordField.dart';
// import 'package:itec303/Screens/TrackSave.dart';

// class TrackScreen extends StatefulWidget {
//   const TrackScreen({Key? key}) : super(key: key);

//   @override
//   State<TrackScreen> createState() => _TrackScreenState();
// }

// class _TrackScreenState extends State<TrackScreen> {
//   String sets = '0';
//   String reps = '0';
//   String weight = '0';

//   DateTime today = DateTime.now();
//   List<String> exercises = [];

//   void addExercise(String exercise) {
//     setState(() {
//       exercises.add(exercise);
//     });
//   }

//   void updateExerciseValues(String newSets, String newReps, String newWeight) {
//     setState(() {
//       sets = newSets;
//       reps = newReps;
//       weight = newWeight;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<String> muscleGroups = [
//       "Chest",
//       "Back",
//       "Legs",
//       "Shoulders",
//       "Arms",
//       "Abs",
//       "Cardio",
//       "Glutes"
//     ];

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             child: Column(
//               children: [
//                 SizedBox(height: 15.h),
//                 Row(
//                   children: [
//                     Text(
//                       "Progress Tracker",
//                       style: TextStyle(
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.w500,
//                           color: purpleColor),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 17.h),
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: muscleGroups.map((group) {
//                       return Container(
//                         margin: EdgeInsets.only(right: 8.w),
//                         child: InkWell(
//                           onTap: () {
//                             // Define onTap functionality if needed
//                           },
//                           child: Chip(
//                             label: Text(group),
//                             backgroundColor: Colors.black,
//                             labelStyle: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12.sp,
//                               fontWeight: FontWeight.w400,
//                             ),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20.0),
//                             ),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 SizedBox(height: 32.h),
//                 Column(
//                   children: [
//                     // Display the list of exercise cards
//                     ...exercises.map(
//                       (exercise) => SizedBox(
//                         width: 370.w,
//                         height: 115.h,
//                         child: Card(
//                           margin: EdgeInsets.symmetric(vertical: 8.h),
//                           child: ListTile(
//                             title: Text(
//                               exercise,
//                               style: TextStyle(
//                                 fontSize: 16.sp, // Example font size
//                                 fontWeight:
//                                     FontWeight.w600, // Example font weight
//                                 color: Colors.black, // Example text color
//                               ),
//                             ),
//                             contentPadding:
//                                 EdgeInsets.symmetric(horizontal: 16.w),
//                             trailing: Icon(
//                               Icons.edit, // Example icon
//                               size: 21.sp, // Example icon size
//                               color: purpleColor, // Example icon color
//                             ),
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => TrackSave(
//                                     addExercise: addExercise,
//                                     exerciseName: exercise,
//                                     initialSets: '0', // Provide initial values here
//                                     initialReps: '0', // Provide initial values here
//                                     initialWeight: '0 lbs', // Provide initial values here
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 8.h,
//                     ),
//                     // Display the button to add more exercises
//                     SizedBox(
//                       height: 100.h, // Set the height
//                       width: 320.w, // Set the width
//                       child: DottedBorder(
//                         dashPattern: [6, 5, 6, 5],
//                         color: purpleColor,
//                         strokeWidth: 1.w,
//                         borderType: BorderType.RRect,
//                         radius: Radius.circular(15),
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => TrackSave(
//                                   addExercise: addExercise,
//                                   exerciseName: 'this is the name', // Provide exercise name if needed
//                                   initialSets: '0', // Provide initial values here
//                                   initialReps: '0', // Provide initial values here
//                                   initialWeight: '0 lbs', // Provide initial values here
//                                 ),
//                               ),
//                             );
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.transparent,
//                             elevation: 0,
//                             padding: EdgeInsets.symmetric(
//                               vertical: 12.h,
//                               horizontal: 24.w,
//                             ),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Center(
//                                 child: Icon(
//                                   Icons.add_circle,
//                                   color: purpleColor,
//                                   size: 40.0,
//                                 ),
//                               ),
//                               SizedBox(height: 2.h),
//                               Text(
//                                 'Tap to add an exercise',
//                                 style: TextStyle(
//                                   fontSize: 10.sp,
//                                   fontWeight: FontWeight.w200,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.h,
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:itec303/Screens/TrackerPages/Tracker_WorkoutGuidePage.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({Key? key}) : super(key: key);

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  DateTime today = DateTime.now();
  List<String> exercises = [];

  void addExercise(String sets, String reps, String weight) {
    setState(() {
      exercises.add('Sets: $sets, Reps: $reps, Weight: $weight');
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
                          color: Colors.purple), // Example color, define purpleColor if needed
                    ),
                  ],
                ),
                SizedBox(height: 17.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: muscleGroups.map((group) {
                      return Container(
                        margin: EdgeInsets.only(right: 8.w),
                        child: InkWell(
                          onTap: () {
                            // Define onTap functionality if needed
                          },
                          child: Chip(
                            label: Text(group),
                            backgroundColor: Colors.black,
                            labelStyle: TextStyle(
                              color: Colors.white,
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
                    ...exercises.map(
                      (exercise) => SizedBox(
                        width: 370.w,
                        height: 115.h,
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          child: ListTile(
                            title: Text(
                              exercise,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                            trailing: Icon(
                              Icons.edit,
                              size: 21.sp,
                              color: Colors.purple, // Example color, define purpleColor if needed
                            ),
                            onTap: () {
                              // Define onTap functionality if needed
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    // Display the button to add more exercises
                    SizedBox(
                      height: 100.h,
                      width: 320.w,
                      child: DottedBorder(
                        dashPattern: [6, 5, 6, 5],
                        color: Colors.purple, // Example color, define purpleColor if needed
                        strokeWidth: 1.w,
                        borderType: BorderType.RRect,
                        radius: Radius.circular(15),
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tracker_WorkoutGuidePage(),
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
                                  color: Colors.purple, // Example color, define purpleColor if needed
                                  size: 40.0,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Tap to add an exercise',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.white,
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
