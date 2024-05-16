import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyPasswordField.dart';

class UserList extends StatelessWidget {
  final String user;
  final String profileImageUrl;
  final void Function()? onTap;

  const UserList({
    super.key,
    required this.user,
    required this.profileImageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: blackColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Card(
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: profileImageUrl !=
                      null 
                  ? Image.network(
                      profileImageUrl,
                      fit: BoxFit.cover,
                      width: 52.w,
                      height: 52.h,
                    )
                  : Image.asset(
                      'assets/images/default_profile_image.jpg',
                      fit: BoxFit.cover,
                      width: 52.w,
                      height: 52.h,
                    ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
