import 'package:flutter/material.dart';
import 'package:itec303/Screens/SignInScreen.dart';
import 'package:itec303/Screens/SignUpScreen.dart';

class SignInOrSignUp extends StatefulWidget {
  const SignInOrSignUp({super.key});

  @override
  State<SignInOrSignUp> createState() => _SignInOrSignUpState();
}

class _SignInOrSignUpState extends State<SignInOrSignUp> {
  bool showSignInPage = true;

  void togglePage() {
    setState(() {
      showSignInPage = !showSignInPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInPage) {
      return const SignInScreen();
    } else {
      return const SignUpScreen();
    }
  }
}
