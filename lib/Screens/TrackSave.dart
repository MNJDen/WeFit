// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:itec303/Components/MyPasswordField.dart';

// class TrackSave extends StatefulWidget {
//   final Function(String) addExercise;
//   final String exerciseName;
//   final String initialSets;
//   final String initialReps;
//   final String initialWeight;

//   const TrackSave({
//     Key? key,
//     required this.addExercise,
//     required this.exerciseName,
//     required this.initialSets,
//     required this.initialReps,
//     required this.initialWeight,
//   }) : super(key: key);

//   @override
//   State<TrackSave> createState() => _TrackSaveState();
// }

// class _TrackSaveState extends State<TrackSave> {
//   late TextEditingController setsController;
//   late TextEditingController repsController;
//   late TextEditingController weightController;

//   @override
//   void initState() {
//     super.initState();
//     setsController = TextEditingController(text: widget.initialSets);
//     repsController = TextEditingController(text: widget.initialReps);
//     weightController = TextEditingController(text: widget.initialWeight);
//   }

//   void increment(TextEditingController controller) {
//     int value = int.tryParse(controller.text) ?? 0;
//     setState(() {
//       controller.text = (value + 1).toString();
//     });
//   }

//   void decrement(TextEditingController controller) {
//     int value = int.tryParse(controller.text) ?? 0;
//     if (value > 0) {
//       setState(() {
//         controller.text = (value - 1).toString();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Back",
//               style: TextStyle(
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_circle_left_rounded,
//             color: purpleColor,
//             size: 30,
//           ),
//         ),
//         leadingWidth: 30.w,
//       ),
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             child: Column(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Image.asset(
//                     "assets/images/Chest_png.png",
//                     height: 150.h,
//                     width: 320.w,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 12.h,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       widget.exerciseName,
//                       style: TextStyle(
//                           fontSize: 16.sp,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.white),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 4.h,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       "Primary muscle group: ",
//                       style: TextStyle(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w200,
//                           color: Colors.white),
//                     ),
//                     SizedBox(width: 3.w),
//                     Text(
//                       "/Chest/",
//                       style: TextStyle(
//                           fontSize: 12.sp,
//                           fontWeight: FontWeight.w200,
//                           color: Colors.white),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 29.h,
//                 ),
//                 buildRow(
//                   label: "Number of Sets:",
//                   controller: setsController,
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 buildRow(
//                   label: "Number of Reps:",
//                   controller: repsController,
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 buildRow(
//                   label: "Number of Weight:",
//                   controller: weightController,
//                 ),
//                 SizedBox(height: 175.h),
//                 SizedBox(
//                   width: 320.w,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       String sets = setsController.text;
//                       String reps = repsController.text;
//                       String weight = weightController.text;

//                       // Update the respective controllers in TrackScreen
//                       widget.addExercise(
//                           'Sets: $sets, Reps: $reps, Weight: $weight');

//                       Navigator.pop(context);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: purpleColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       padding: EdgeInsets.symmetric(vertical: 12.h),
//                     ),
//                     child: Text(
//                       "Save",
//                       style: TextStyle(
//                           fontSize: 16.sp,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildRow(
//       {required String label, required TextEditingController controller}) {
//     return Row(
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             fontSize: 12.sp,
//             fontWeight: FontWeight.w200,
//             color: Colors.white,
//           ),
//         ),
//         Spacer(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               icon: Icon(Icons.remove_circle_outline),
//               iconSize: 30,
//               color: purpleColor,
//               onPressed: () {
//                 decrement(controller);
//               },
//             ),
//             SizedBox(width: 5.w),
//             Container(
//               width: 78.w,
//               height: 30.h,
//               child: TextFormField(
//                 controller: controller,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.white,
//                 ),
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.zero,
//                   isDense: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                   filled: true,
//                   fillColor: Colors.white.withOpacity(0.1),
//                 ),
//               ),
//             ),
//             SizedBox(width: 5.w),
//             IconButton(
//               icon: Icon(Icons.add_circle_outline),
//               iconSize: 30,
//               color: purpleColor,
//               onPressed: () {
//                 increment(controller);
//               },
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyPasswordField.dart';

class TrackSave extends StatefulWidget {
  final Function(String, String, String) addExercise;
  final String exerciseName;
  final String initialSets;
  final String initialReps;
  final String initialWeight;

  const TrackSave({
    Key? key,
    required this.addExercise,
    required this.exerciseName,
    required this.initialSets,
    required this.initialReps,
    required this.initialWeight,
  }) : super(key: key);

  @override
  State<TrackSave> createState() => _TrackSaveState();
}

class _TrackSaveState extends State<TrackSave> {
  late TextEditingController setsController;
  late TextEditingController repsController;
  late TextEditingController weightController;

  @override
  void initState() {
    super.initState();
    setsController = TextEditingController(text: widget.initialSets);
    repsController = TextEditingController(text: widget.initialReps);
    weightController = TextEditingController(text: widget.initialWeight);
  }

  void increment(TextEditingController controller) {
    int value = int.tryParse(controller.text) ?? 0;
    setState(() {
      controller.text = (value + 1).toString();
    });
  }

  void decrement(TextEditingController controller) {
    int value = int.tryParse(controller.text) ?? 0;
    if (value > 0) {
      setState(() {
        controller.text = (value - 1).toString();
      });
    }
  }

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
                color: Colors.white,
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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/Chest_png.png",
                    height: 150.h,
                    width: 320.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      widget.exerciseName,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  children: [
                    Text(
                      "Primary muscle group: ",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w200,
                          color: Colors.white),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      "/Chest/",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w200,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 29.h,
                ),
                buildRow(
                  label: "Number of Sets:",
                  controller: setsController,
                ),
                SizedBox(
                  height: 2.h,
                ),
                buildRow(
                  label: "Number of Reps:",
                  controller: repsController,
                ),
                SizedBox(
                  height: 2.h,
                ),
                buildRow(
                  label: "Number of Weight:",
                  controller: weightController,
                ),
                SizedBox(height: 175.h),
                SizedBox(
                  width: 320.w,
                  child: ElevatedButton(
                    onPressed: () {
                      String sets = setsController.text;
                      String reps = repsController.text;
                      String weight = weightController.text;

                      // Update the respective controllers in TrackScreen
                      widget.addExercise(sets, reps, weight);

                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purpleColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
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

  Widget buildRow(
      {required String label, required TextEditingController controller}) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              iconSize: 30,
              color: purpleColor,
              onPressed: () {
                decrement(controller);
              },
            ),
            SizedBox(width: 5.w),
            Container(
              width: 78.w,
              height: 30.h,
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            SizedBox(width: 5.w),
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              iconSize: 30,
              color: purpleColor,
              onPressed: () {
                increment(controller);
              },
            ),
          ],
        ),
      ],
    );
  }
}
