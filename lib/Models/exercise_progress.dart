import 'package:itec303/Models/exercise_item.dart';

class ExerciseProgress {
  int numSets;
  int numReps;
  double numWeights;
  int mins;
  ExerciseItem exercise;
  String muscleGroup;

  ExerciseProgress({
    required this.numSets,
    required this.numReps,
    required this.mins,
    required this.muscleGroup,
    required this.exercise,
    this.numWeights = 0,
  });

  static fromFirestore(Map<String, dynamic> data) {}
}
