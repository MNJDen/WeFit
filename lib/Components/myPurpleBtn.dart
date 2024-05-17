import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final blackColor = const Color.fromRGBO(13, 13, 13, 1);
final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

Widget MyPurpleBtn({required String name, required VoidCallback onPressed}) {
  return SizedBox(
    width: double.infinity,
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(purpleColor),
        foregroundColor: MaterialStateProperty.all(whiteColor),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 12.h),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        name,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: whiteColor,
        ),
      ),
    ),
  );
}