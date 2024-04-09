import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final blackColor = const Color.fromRGBO(13, 13, 13, 1);
final purpleColor = const Color.fromRGBO(169, 88, 237, 1);
final whiteColor = const Color.fromRGBO(251, 248, 255, 1);

Widget myForm({required String label, required Icon prefixIcon, required bool obscure, IconButton? suffixIcon }) {
  return TextFormField(
    obscureText: obscure,
    style: TextStyle(
      fontSize: 12.sp,
      color: purpleColor,
    ),
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      labelText: label,
      labelStyle: TextStyle(
        fontSize: 12.sp,
        color: whiteColor,
      ),
      floatingLabelStyle: TextStyle(
        fontSize: 12.sp,
        color: purpleColor,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: whiteColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: purpleColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
