import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyPasswordField.dart';

class UserTile extends StatelessWidget {
  final String r_user;
  final String message;
  final DateTime? timestamp;
  final String profileImageUrl; 
  final void Function()? onTap;
  final bool isNewMessage;

  const UserTile({
    super.key,
    required this.r_user,
    required this.message,
    this.timestamp,
    required this.profileImageUrl,
    required this.onTap,
    this.isNewMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    String timeString = timestamp != null
        ? '${timestamp!.hour}:${timestamp!.minute.toString().padLeft(2, '0')}'
        : '';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black38,
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
                      'assets/images/Default_Account_Image.png',
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
                    r_user,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          message,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: whiteColor,
                            fontWeight: isNewMessage
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (message.isNotEmpty)
                        Text(
                          timeString,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: whiteColor,
                          ),
                        ),
                    ],
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
