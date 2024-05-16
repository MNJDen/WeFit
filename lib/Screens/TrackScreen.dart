import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyUsernameField.dart';
import 'package:flutter/src/material/navigation_bar.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Abs.dart';

class TrackScreen extends StatefulWidget {
  const TrackScreen({super.key});

  @override
  State<TrackScreen> createState() => _TrackScreenState();
}

class _TrackScreenState extends State<TrackScreen> {
  //Navigate to pages----?(not sure if will be used)
  // void _onChipTapped(BuildContext context, String chipLabel) {
  //   switch (chipLabel) {
  //     case "Chest":
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => ChestPage()),
  //       );
  //       break;
  //     case "Back":
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => BackPage()),
  //       );
  //       break;
  //     case "Legs":
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => LegsPage()),
  //       );
  //       break;
  //     case "Arms":
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => ArmsPage()),
  //       );
  //       break;
  //     case "Shoulders":
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => ShouldersPage()),
  //       );
  //       break;
  //     case "Abs":
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => AbsPage()),
  //       );
  //       break;
  //     case "Cardio":
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => CardioPage()),
  //       );
  //       break;
  //     case "Glutes":
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => GlutesPage()),
  //       );
  //       break;
  //     default:
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
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
                SizedBox(
                  height: 17.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Wrap(
                        children: [
                          InkWell(
                            //onTap: () => _onChipTapped(context, "Chest"),
                            child: Chip(
                              label: Text("Chest"),
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
                          SizedBox(width: 8.w),
                          InkWell(
                            //onTap: () => _onChipTapped(context, "Back"),
                            child: Chip(
                              label: Text("Back"),
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
                          SizedBox(width: 8.w),
                          InkWell(
                            //onTap: () => _onChipTapped(context, "Legs"),
                            child: Chip(
                              label: Text("Legs"),
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
                          SizedBox(width: 8.w),
                          InkWell(
                            //onTap: () => _onChipTapped(context, "Shoulders"),
                            child: Chip(
                              label: Text("Shoulders"),
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
                          SizedBox(width: 8.w),
                          InkWell(
                            //onTap: () => _onChipTapped(context, "Arms"),
                            child: Chip(
                              label: Text("Arms"),
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
                          SizedBox(width: 8.w),
                          InkWell(
                            //onTap: () => _onChipTapped(context, "Abs"),
                            child: Chip(
                              label: Text("Abs"),
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
                          SizedBox(width: 8.w),
                          InkWell(
                            //onTap: () => _onChipTapped(context, "Cardio"),
                            child: Chip(
                              label: Text("Cardio"),
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
                          SizedBox(width: 8.w),
                          InkWell(
                            //onTap: () => _onChipTapped(context, "Glutes"),
                            child: Chip(
                              label: Text("Glutes"),
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
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                InkWell(
                  onTap: () {
                    //   Navigator.push(
                    //         context,
                    //         PageRouteBuilder(
                    //           pageBuilder: (BuildContext context,
                    //               Animation<double> animation1,
                    //               Animation<double> animation2) {
                    //             return ;
                    //           },
                    //           transitionDuration: Duration.zero,
                    //           reverseTransitionDuration: Duration.zero,
                    //         ),
                    //       );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: DottedBorder(
                      dashPattern: [6, 5, 6, 5],
                      color: purpleColor,
                      strokeWidth: 1.w,
                      borderType: BorderType.RRect,
                      radius: Radius.circular(15),
                      child: Container(
                        height: 100.h,
                        width: 320.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle,
                              color: purpleColor,
                              size: 40.0,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

