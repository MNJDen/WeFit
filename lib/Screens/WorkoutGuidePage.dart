import 'package:flutter/material.dart';
import 'package:itec303/Screens/HomeScreen.dart';

class WorkoutGuidePage extends StatefulWidget {
  const WorkoutGuidePage({super.key});

  @override
  State<WorkoutGuidePage> createState() => _WorkoutGuidePageState();
}

class _WorkoutGuidePageState extends State<WorkoutGuidePage> {
  final blackColor = const Color.fromRGBO(13, 13, 13, 1);
  final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
  final whiteColor = const Color.fromRGBO(251, 248, 255, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 10),
                  child: IconButton(
                    onPressed: () {Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context,
                            Animation<double> animation1,
                            Animation<double> animation2) {
                          return HomeScreen();
                        },
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ),
                    );},
                    icon: Icon(
                      Icons.arrow_circle_left_rounded,
                      color: purpleColor,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(width: 5.0),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Choose a muscle group you wish to learn",
                    style: TextStyle(
                        fontSize: 12,
                        color: whiteColor,
                        fontWeight: FontWeight.w100),
                  ),
                )
              ],
            ),
            const SizedBox(height: 5),
             Column(
               children: [
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        // direct to anitehr page
                      },
                      child: SizedBox(
                        width: 190,
                        child: Card(
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/chest.jpg',
                                height: 200,
                                width: 200,
                              ),
                              Positioned(
                                bottom: 8.0,
                                left: 20.0,
                                child: Text(
                                  'Card 1',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // direct to another page
                      },
                      child: SizedBox(
                        width: 190, 
                        child: Card(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/image2.jpg', 
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Card 2',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                             ],
                           ),
               ],
             ),
          ],
        ));
  }  
}
