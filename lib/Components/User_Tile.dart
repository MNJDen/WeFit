import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyPasswordField.dart';

class UserTile extends StatelessWidget {
  final String r_user;
  final String message;
  final DateTime? timestamp;
  final void Function()? onTap;
  final bool isNewMessage;

  const UserTile({
    super.key,
    required this.r_user,
    required this.message,
    this.timestamp,
    required this.onTap,
    this.isNewMessage = false,
  });

  TextStyle _getMessageStyle(bool isNewMessage) {
    return TextStyle(
      fontSize: 12.sp,
      color: whiteColor,
      fontWeight: isNewMessage ? FontWeight.w600 : FontWeight.normal, // Adjust font weight based on isNewMessage
    );
  }

  @override
  Widget build(BuildContext context) {
    // Format the timestamp to a user-friendly time format
    String timeString = timestamp != null
        ? '${timestamp!.hour}:${timestamp!.minute.toString().padLeft(2, '0')}'
        : '';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Avatar image for the user
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/images/Pedro.jpg',
                fit: BoxFit.cover,
                height: 52.h,
                width: 52.w,
              ),
            ),
            SizedBox(width: 16.w),
            // Expanded column for user email, message, and time
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display user email
                  Text(
                    r_user,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: whiteColor,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  // Display latest message and time with vertical bar
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          // Truncate the message and handle overflow
                          message,
                          style: _getMessageStyle(isNewMessage), // Use the custom message style
                          maxLines: 1, // Limit the message to one line
                          overflow:
                              TextOverflow.ellipsis, // Truncate with ellipsis
                        ),
                      ),
                      // Display the time
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