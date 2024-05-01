import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyPasswordField.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/Pedro.jpg',
                height: 52.h,
                width: 52.w,
              ),
            ),
            SizedBox(width: 16.w,),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
