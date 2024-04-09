import 'package:flutter/material.dart';
import 'package:itec303/Screens/SignInScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'WeFit',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'General Sans',
          ),
          home: const RootPage(),
        );
      },
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInScreen(),
    );
  }
}
