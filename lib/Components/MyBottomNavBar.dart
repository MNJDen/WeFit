import 'package:flutter/material.dart';
import 'package:itec303/Screens/ChatScreen.dart';
import 'package:itec303/Screens/HomeScreen.dart';
import 'package:itec303/Screens/TrackScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

  int selectedIndex = 0;

  final screen = [
    HomeScreen(),
    TrackScreen(),
    ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: screen[selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: blackColor,
                spreadRadius: 1,
                blurRadius: 40,
                offset: Offset(0, 5)
              ),
            ],
          ),
          child: BottomAppBar(
            color: blackColor,
            elevation: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 75.h),
              child: SizedBox(
                height: 75.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconBottomBar(
                      icon: Icons.home_rounded,
                      selected: selectedIndex == 0,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                    ),
                    IconBottomBar(
                      icon: Icons.timeline_rounded,
                      selected: selectedIndex == 1,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                    IconBottomBar(
                      icon: Icons.forum_rounded,
                      selected: selectedIndex == 2,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class IconBottomBar extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  const IconBottomBar(
      {required this.icon,
      required this.selected,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon,
              size: 40.h,
              color: selected
                  ? Color.fromRGBO(169, 88, 237, 1)
                  : Color.fromRGBO(169, 88, 237, 0.3)),
        ),
      ],
    );
  }
}
