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
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, top: 40, bottom: 0,),
                child: Text(
                  "Welcome back, ",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: whiteColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 40,),
                child: Text(
                  "Stefan",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: purpleColor,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 10, right: 20),
                child: IconButton(
                  onPressed: () {
                    // direct to another page
                  },
                  icon: const Icon(Icons.person,
                      color: Color.fromRGBO(169, 88, 237, 1), size: 40),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: TableCalendar(
                locale: "en_US",
                rowHeight: 40,
                headerStyle: HeaderStyle(
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: whiteColor,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: whiteColor,
                    ),
                    titleTextStyle: TextStyle(fontSize: 20, color: whiteColor),
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
                )),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 0),
                child: Text(
                  "Don't have a workout plan yet?",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: purpleColor,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 0),
                child: Text(
                  "Check out our suggested workouts",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w100,
                    color: whiteColor,
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: whiteColor,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(
                        Icons.arrow_circle_right,
                        size: 20.0,
                        color: whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 3.h,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CarouselSlider(
                  items: [
                    _buildCarouselItem("Chest", "assets/images/Chest.png", () {Navigator.push(
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
                    );}),
                    _buildCarouselItem("Legs", "assets/images/Leg_Press.jpg", () {}),
                    _buildCarouselItem("Back", "assets/images/Back.jpg", () {}),
                    _buildCarouselItem("Arms", "assets/images/Arms.png", () {}),
                    _buildCarouselItem("Abs", "assets/images/Abs.jpg", () {}),
                    _buildCarouselItem("Shoulders", "assets/images/Shoulders.png", () {}),
                    _buildCarouselItem("Cardio", "assets/images/Cardio.png", () {}),
                    _buildCarouselItem("Glutes", "assets/images/Glutes.png", () {}),
                  ],
                  options: CarouselOptions(
                    height: 210,
                    initialPage: 1,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.33,
                    aspectRatio: 16 / 9,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () {
                    // direct to another page
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Color.fromRGBO(169, 88, 237, 1),
                    size: 50,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () {
                    // direct to another page
                  },
                  icon: const Icon(Icons.signal_cellular_alt_rounded,
                      color: Color.fromRGBO(169, 88, 237, 1), size: 50),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: IconButton(
                  onPressed: () {
                    // direct to another page
                  },
                  icon: const Icon(Icons.chat_bubble,
                      color: Color.fromRGBO(169, 88, 237, 1), size: 50),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(String text, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
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
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
