import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itec303/Services/Auth/SignIn_or_SignUp.dart';
import 'package:itec303/Components/MyBottomNavBar.dart';
import 'package:itec303/Screens/HomeScreen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MyBottomNavBar();
          } else {
            return const SignInOrSignUp();
          }
        },
      ),
    );
  }
}
