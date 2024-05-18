class ExerciseItem {
  String name;
  String imagePath;
  String id;
  bool isNeedWeights;
  bool isNeedTimer;

  ExerciseItem(
      {required this.name,
      required this.imagePath,
      required this.id,
      this.isNeedWeights = true,
      this.isNeedTimer = false,
      });
}
