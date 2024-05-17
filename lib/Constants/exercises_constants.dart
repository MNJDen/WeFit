import 'package:itec303/Models/exercise_item.dart';

class ExercisesConstants{
  static final List<ExerciseItem> absExercises = [
  ExerciseItem(name: 'Crunches', imagePath: 'assets/images/Abs_c.png', id: 'absc',),
  ExerciseItem(name: 'Cable Crunches', imagePath: 'assets/images/Abs_cc.png', id: 'abscc'),
  ExerciseItem(name: 'Mountain Climbers', imagePath: 'assets/images/Abs_mc.png', id: 'absmc'),
  ExerciseItem(name: 'Plank', imagePath: 'assets/images/Abs_p.png', id: 'absp'),
  ExerciseItem(name: 'Russian Twist', imagePath: 'assets/images/Abs_rt.png', id: 'absrt'),
];
static final List<ExerciseItem> armsExercises = [
  ExerciseItem(name: 'Bicep Curls', imagePath: 'assets/images/Arms_bc.png', id: 'armsbc'),
  ExerciseItem(name: 'Hammer Curls', imagePath: 'assets/images/Arms_hc.png', id: 'armshc'),
  ExerciseItem(name: 'Tricep Push-Down', imagePath: 'assets/images/Arms_tpd.png', id: 'armstpd'),
  ExerciseItem(name: 'Upright Row', imagePath: 'assets/images/Arms_ur.png', id: 'armsur'),
  ExerciseItem(name: 'Wrist Curl', imagePath: 'assets/images/Arms_wc.png', id: 'armswc'),
];   
static final List<ExerciseItem> backExercises = [
  ExerciseItem(name: 'Bent-over Row', imagePath: 'assets/images/Back_bor.png', id: 'backbor'),
  ExerciseItem(name: 'Lat Pull-down', imagePath: 'assets/images/Back_lpd.png', id: 'backlpd'),
  ExerciseItem(name: 'Lat Pull-over', imagePath: 'assets/images/Back_lpo.png', id: 'backlpo'),
  ExerciseItem(name: 'Seated Cable Row', imagePath: 'assets/images/Back_scr.png', id: 'backscr'),
];
static final List<ExerciseItem> cardioExercises = [
  ExerciseItem(name: 'Burpee', imagePath: 'assets/images/Cardio_b.png', id: 'cardiob'),
  ExerciseItem(name: 'Cycling', imagePath: 'assets/images/Cardio_c.png', id: 'cardioc'),
  ExerciseItem(name: 'Elliptical', imagePath: 'assets/images/Cardio_e.png', id: 'cardioe'),
  ExerciseItem(name: 'Jump Rope', imagePath: 'assets/images/Cardio_jr.png', id: 'cardiojr'),
  ExerciseItem(name: 'Running/Jogging', imagePath: 'assets/images/Cardio_rj.png', id: 'cardiorj'),
];
static final List<ExerciseItem> chestExercises = [
  ExerciseItem(name: 'Dumbbell Flat Bench Press', imagePath: 'assets/images/dbFlatBenchPress.png', id: 'chestdfbp'),
  ExerciseItem(name: 'Dumbbell Incline Bench Press', imagePath: 'assets/images/dbInclineBenchPress.png', id: 'chestdibp'),
  ExerciseItem(name: 'Dumbbell Flat Bench Flys', imagePath: 'assets/images/dbFlatBenchFlys.png', id: 'chestdfbf'),
  ExerciseItem(name: 'Dumbbell Incline Bench Flys', imagePath: 'assets/images/dbInclineBenchFlys.png', id: 'chestdibf'),
];
static final List<ExerciseItem> gluteExercises = [
  ExerciseItem(name: 'Barbell Hip Thrust', imagePath: 'assets/images/Glutes_bht.png', id: 'glutesbht'),
  ExerciseItem(name: 'Dumbbell Bulgarian Split Squats', imagePath: 'assets/images/Legs_bss.png', id: 'glutesbss'),
  ExerciseItem(name: 'Romanian Deadlift', imagePath: 'assets/images/Glutes_rd.png', id: 'glutesrd'),
  ExerciseItem(name: 'Reverse Hyper', imagePath: 'assets/images/Glutes_rh.png', id: 'glutesrh'),
  ExerciseItem(name: 'Single Hip Thrust', imagePath: 'assets/images/Glutes_sht.png', id: 'glutessht'),
];
static final List<ExerciseItem> legExercises = [
  ExerciseItem(name: 'Barbell Squat', imagePath: 'assets/images/Legs_bs.png', id: 'legsbs'),
  ExerciseItem(name: 'Bulgarian Split Squat', imagePath: 'assets/images/Legs_bss.png', id: 'legsbss'),
  ExerciseItem(name: 'Leg Extension', imagePath: 'assets/images/Legs_le.png', id: 'legsle'),
  ExerciseItem(name: 'Leg Press', imagePath: 'assets/images/Legs_lp.png', id: 'legslp'),
  ExerciseItem(name: 'Standing Calf Raise', imagePath: 'assets/images/Legs_scr.png', id: 'legsscr'),
];
static final List<ExerciseItem> shoulderExercises = [
  ExerciseItem(name: 'Dumbbell Shoulder Press', imagePath: 'assets/images/Shoulders_dsp.png', id: 'shouldersdsp'),
  ExerciseItem(name: 'Front Raise', imagePath: 'assets/images/Shoulders_fr.png', id: 'shouldersfr'),
  ExerciseItem(name: 'Overhead Press', imagePath: 'assets/images/Shoulders_op.png', id: 'shouldersop'),
  ExerciseItem(name: 'Reverse Flyes', imagePath: 'assets/images/Shoulders_rf.png', id: 'shouldersrf'),
  ExerciseItem(name: 'Side Lateral Raise', imagePath: 'assets/images/Shoulders_slr.png', id: 'shouldersslr'),
];
}