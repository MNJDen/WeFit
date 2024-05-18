import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyBottomNavBar.dart';
import 'package:itec303/Components/MyPasswordField.dart';
import 'package:itec303/Models/exercise_item.dart';
import 'package:itec303/Screens/TrackScreen.dart';

class TrackSave extends StatefulWidget {
  final Function(String, String, String)? addExercise;
  final ExerciseItem exercise;
  final String categoryName;
  final int? initialSets;
  final int? initialReps;
  final double? initialWeight;
  final int? initialMins;

  const TrackSave({
    Key? key,
    this.addExercise,
    required this.exercise,
    required this.categoryName,
    this.initialSets,
    this.initialReps,
    this.initialWeight,
    this.initialMins,
  }) : super(key: key);

  @override
  State<TrackSave> createState() => _TrackSaveState();
}

class _TrackSaveState extends State<TrackSave> {
  late TextEditingController setsController;
  late TextEditingController repsController;
  late TextEditingController weightController;
  late TextEditingController minutesController;

  @override
  void initState() {
    super.initState();
    setsController = TextEditingController(text: widget.initialSets.toString());
    repsController = TextEditingController(text: widget.initialReps.toString());
    weightController =
        TextEditingController(text: widget.initialWeight.toString());
    minutesController =
        TextEditingController(text: widget.initialMins.toString());
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

  Future<void> handleSave() async {
    int numSets = int.tryParse(setsController.text) ?? 0;
    int numReps = int.tryParse(repsController.text) ?? 0;
    double numWeights = double.tryParse(weightController.text) ?? 0.0;
    int mins = int.tryParse(minutesController.text) ?? 0;
    String muscleGroup = widget.categoryName;

    await _saveExerciseProgressToFirestore(
      numSets,
      numReps,
      numWeights,
      mins,
      muscleGroup,
    );

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation1,
            Animation<double> animation2) {
          return const MyBottomNavBar(selectedIndex: 1);
        },
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  Future<void> _saveExerciseProgressToFirestore(
    int numSets,
    int numReps,
    double numWeights,
    int mins,
    String muscleGroup,
  ) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;

    if (user != null) {
      final String uid = user.uid;

      // Check if the document already exists
      final QuerySnapshot<Map<String, dynamic>> existingDocs =
          await FirebaseFirestore.instance
              .collection('exerciseTracker')
              .doc(uid)
              .collection('exerciseProgress')
              .where('exerciseId', isEqualTo: widget.exercise.id)
              .limit(1)
              .get();

      if (existingDocs.docs.isNotEmpty) {
        // Document already exists, update it
        final docId = existingDocs.docs.first.id;
        await FirebaseFirestore.instance
            .collection('exerciseTracker')
            .doc(uid)
            .collection('exerciseProgress')
            .doc(docId)
            .update({
          'sets': numSets,
          'reps': numReps,
          'weight': numWeights,
          'minutes': mins,
          'muscleGroup': muscleGroup,
          'timestamp': FieldValue.serverTimestamp(),
        });
      } else {
        // Document does not exist, add it
        await FirebaseFirestore.instance
            .collection('exerciseTracker')
            .doc(uid)
            .collection('exerciseProgress')
            .add({
          'uid': uid,
          'exerciseName': widget.exercise.name,
          'imagePath': widget.exercise.imagePath,
          'exerciseId': widget.exercise.id,
          'sets': numSets,
          'reps': numReps,
          'weight': numWeights,
          'minutes': mins,
          'muscleGroup': muscleGroup,
          'timestamp': FieldValue.serverTimestamp(),
        });
      }
    } else {
      // Handle the case when the user is not logged in
      print('User not logged in');
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
                    widget.exercise.imagePath,
                    height: 150.h,
                    width: 320.w,
                    fit: BoxFit.cover,
                  ),
                ).animate().fadeIn(delay: const Duration(milliseconds: 400)),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    Text(
                      widget.exercise.name,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: whiteColor),
                    ),
                  ],
                ).animate().fadeIn(delay: const Duration(milliseconds: 500)),
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
                          color: whiteColor),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      widget.categoryName,
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w200,
                          color: whiteColor),
                    ),
                  ],
                ).animate().fadeIn(delay: const Duration(milliseconds: 600)),
                SizedBox(
                  height: 29.h,
                ),
                if (widget.exercise.isNeedTimer)
                  Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      buildRow(
                        label: "Number of Minutes:",
                        controller: minutesController,
                      ),
                      SizedBox(height: 70.h),
                    ],
                  ).animate().fadeIn(delay: const Duration(milliseconds: 700)),
                SizedBox(
                  height: 2.h,
                ),
                if (!widget.exercise.isNeedTimer)
                  Column(
                    children: [
                      buildRow(
                        label: "Number of Sets:",
                        controller: setsController,
                      ).animate().fadeIn(delay: const Duration(milliseconds: 800)),
                      buildRow(
                        label: "Number of Reps:",
                        controller: repsController,
                      ).animate().fadeIn(delay: const Duration(milliseconds: 900)),
                    ],
                  ),
                SizedBox(
                  height: 2.h,
                ),
                if (widget.exercise.isNeedWeights)
                  Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      buildRow(
                        label: "Number of Weight (lbs):",
                        controller: weightController,
                      ).animate().fadeIn(delay: const Duration(milliseconds: 950)),
                    ],
                  ),
                SizedBox(height: 175.h),
                SizedBox(
                  width: 320.w,
                  child: ElevatedButton(
                    onPressed: () {
                      handleSave();
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
                          color: whiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ).animate().fadeIn(delay: const Duration(milliseconds: 1000)),
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: const Duration(milliseconds: 300));
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
            color: whiteColor,
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
                  color: whiteColor,
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
