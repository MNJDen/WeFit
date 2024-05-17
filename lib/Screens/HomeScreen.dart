import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Screens/AccountSettingsScreen.dart';
import 'package:itec303/Screens/SetExercise.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Abs.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Arms.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Back.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Cardio.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Chest.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Glutes.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Legs.dart';
import 'package:itec303/Screens/Workout%20Guide%20Pages/Main%20Menu/WorkoutGuidePage_Shoulders.dart';
import 'package:itec303/Services/Auth/Auth_Service.dart';
import 'package:itec303/Screens/WorkoutGuidePage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime today = DateTime.now();
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SetExercise(
          today: today,
        ),
      ),
    );
  }

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  late Stream<DocumentSnapshot> _userStream;

  @override
  void initState() {
    super.initState();
    // Fetch the current user's ID from Firebase Authentication
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      // Fetch user data from Firestore based on the current user's ID
      _userStream = FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser.uid)
          .snapshots();
    } else {
      print('Current user is null. Make sure the user is authenticated.');
    }
  }

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
                  height: 4.h,
                ),
                Row(
                  children: [
                    StreamBuilder<DocumentSnapshot>(
                      stream: _userStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        if (!snapshot.hasData || !snapshot.data!.exists) {
                          return const Text('User data not found');
                        }
                        final username = snapshot.data!.get('username');
                        return Wrap(
                          children: [
                            Text(
                              'Welcome back, ',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                              ),
                            ),
                            Text(
                              '$username',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: purpleColor,
                              ),
                            ),
                            Text(
                              '!',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const Spacer(),
                    InkWell(
                      splashColor: purpleColor,
                      highlightColor: purpleColor,
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation1,
                                Animation<double> animation2) {
                              return const AccountSettingScreen();
                            },
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(1.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(120),
                          border: Border.all(
                            color: purpleColor,
                            width: 1.w,
                          ),
                        ),
                        child: StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            }
                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }
                            if (!snapshot.hasData || !snapshot.data!.exists) {
                              return const Text('User data not found');
                            }
                            final profileImageUrl =
                                snapshot.data!.get('profileImageUrl');
                            if (profileImageUrl != null) {
                              return Card(
                                shape: const CircleBorder(),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  profileImageUrl,
                                  fit: BoxFit.cover,
                                  width: 35.w,
                                  height: 35.h,
                                ),
                              );
                            } else {
                              return Card(
                                shape: const CircleBorder(),
                                clipBehavior: Clip.antiAlias,
                                child: Image.network(
                                  'assets/images/Default_Account_Image.png',
                                  fit: BoxFit.cover,
                                  width: 35.w,
                                  height: 35.h,
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: const Duration(milliseconds: 400)),
                SizedBox(
                  height: 4.h,
                ),
                TableCalendar(
                  locale: "en_US",
                  rowHeight: 40.h,
                  headerStyle: HeaderStyle(
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: whiteColor,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: whiteColor,
                      ),
                      titleTextStyle:
                          TextStyle(fontSize: 16.sp, color: whiteColor),
                      formatButtonVisible: false,
                      formatButtonShowsNext: true,
                      titleCentered: true),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2040, 10, 16),
                  onDaySelected: _onDaySelected,
                  focusedDay: today,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: purpleColor,
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: TextStyle(color: blackColor),
                    weekendTextStyle: TextStyle(color: purpleColor),
                    defaultTextStyle: TextStyle(color: whiteColor),
                    selectedTextStyle: TextStyle(color: blackColor),
                  ),
                ).animate().fadeIn(delay: const Duration(milliseconds: 500)),
                SizedBox(
                  height: 36.h,
                ),
                Row(
                  children: [
                    Text(
                      "Don't have a workout plan yet?",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: purpleColor,
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: const Duration(milliseconds: 600)),
                SizedBox(
                  height: 4.w,
                ),
                Row(
                  children: [
                    Text(
                      "Check out our suggested workouts",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: whiteColor,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation1,
                                Animation<double> animation2) {
                              return WorkoutGuidePage(selectedDate: today);
                            },
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                      child: Wrap(
                        spacing: 4.w,
                        children: [
                          Text(
                            "See all",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: whiteColor,
                            ),
                          ),
                          Icon(
                            Icons.arrow_circle_right_rounded,
                            color: whiteColor,
                            size: 20.w,
                          )
                        ],
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: const Duration(milliseconds: 600)),
                SizedBox(
                  height: 12.h,
                ),
                Column(
                  children: [
                    CarouselSlider(
                      items: [
                        _buildCarouselItem("Chest", "assets/images/chest.jpg",
                            () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return WorkoutGuidePage_Chest();
                              },
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        }),
                        _buildCarouselItem("Legs", "assets/images/Legs_lp.png",
                            () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return WorkoutGuidePage_Legs();
                              },
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        }),
                        _buildCarouselItem("Back", "assets/images/Back.jpg",
                            () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return WorkoutGuidePage_Back();
                              },
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        }),
                        _buildCarouselItem("Arms", "assets/images/Arms.png",
                            () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return WorkoutGuidePage_Arms();
                              },
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        }),
                        _buildCarouselItem("Abs", "assets/images/Abs.png", () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return WorkoutGuidePage_Abs();
                              },
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        }),
                        _buildCarouselItem(
                            "Shoulders", "assets/images/Shoulders_dsp.png", () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return WorkoutGuidePage_Shoulders();
                              },
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        }),
                        _buildCarouselItem("Cardio", "assets/images/Cardio.png",
                            () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return WorkoutGuidePage_Cardio();
                              },
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        }),
                        _buildCarouselItem("Glutes", "assets/images/Glutes.png",
                            () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) {
                                return WorkoutGuidePage_Glutes();
                              },
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        }),
                      ],
                      options: CarouselOptions(
                        height: 210.h,
                        initialPage: 1,
                        enableInfiniteScroll: true,
                        viewportFraction: 0.35,
                        aspectRatio: 16 / 10,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: const Duration(milliseconds: 700)),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: const Duration(milliseconds: 300));
  }

  Widget _buildCarouselItem(String text, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
