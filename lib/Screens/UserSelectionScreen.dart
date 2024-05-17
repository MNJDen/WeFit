import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyPasswordField.dart';
import 'package:itec303/Components/UserList.dart';
import 'package:itec303/Services/Chat/Chat_Service.dart';

class UserSelectionScreen extends StatelessWidget {
  final ChatService _chatService = ChatService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Users"),
        backgroundColor: blackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_circle_left_rounded,
            color: purpleColor,
            size: 30,
          ),
        ),
        leadingWidth: 30.w,
      ),
      body: Container(
        color: blackColor,
        child: StreamBuilder(
          stream: _chatService.getAllUsersStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text("Error loading users");
            } else {
              List<Map<String, dynamic>> users = snapshot.data ?? [];
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> user = users[index];
                  return UserList(
                    user: user['username'],
                    profileImageUrl: user['profileImageUrl'],
                    onTap: () async {
                      // Add selected user to the current user's chat list
                      await _chatService.addUserToChatList(user['uid']);
                      // Go back to ChatScreen
                      Navigator.pop(context);
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
