import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Screens/WorkoutGuidePage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
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
                    Text(
                      "Welcome back, ",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: whiteColor,
                      ),
                    ),
                    Text(
                      "Stefan",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: purpleColor,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        // direct to another page
                      },
                      icon: const Icon(Icons.person,
                          color: Color.fromRGBO(169, 88, 237, 1), size: 40),
                    ),
                  ],
                ),
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
                ),
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
                ),
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
                              return WorkoutGuidePage();
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
                ),
                SizedBox(
                  height: 12.h,
                ),
                Column(
                  children: [
                    CarouselSlider(
                      items: [
                        _buildCarouselItem(
                            "Chest", "assets/images/chest.jpg", () {}),
                        _buildCarouselItem(
                            "Legs", "assets/images/Leg_Press.jpg", () {}),
                        _buildCarouselItem(
                            "Back", "assets/images/Back.jpg", () {}),
                        _buildCarouselItem(
                            "Arms", "assets/images/Arms.png", () {}),
                        _buildCarouselItem(
                            "Abs", "assets/images/Abs.png", () {}),
                        _buildCarouselItem(
                            "Shoulders", "assets/images/Shoulders.png", () {}),
                        _buildCarouselItem(
                            "Cardio", "assets/images/Cardio.png", () {}),
                        _buildCarouselItem(
                            "Glutes", "assets/images/Glutes.png", () {}),
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
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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