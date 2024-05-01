import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyPasswordField.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isCurrentUser ? EdgeInsets.only(left: 50.w) : EdgeInsets.only(right: 15.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 8.h),
        margin: EdgeInsets.symmetric(horizontal: 15.h, vertical: 5.h),
        decoration: BoxDecoration(
          color: isCurrentUser ? purpleColor : Color.fromRGBO(59, 59, 59, 0.298),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message,
          style: TextStyle(
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
