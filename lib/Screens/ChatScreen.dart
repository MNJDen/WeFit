import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyPasswordField.dart';
import 'package:itec303/Components/User_Tile.dart';
import 'package:itec303/Screens/ChatPage.dart';
import 'package:itec303/Screens/UserSelectionScreen.dart';
import 'package:itec303/Services/Auth/Auth_Service.dart';
import 'package:itec303/Services/Chat/Chat_Service.dart';

class ChatScreen extends StatelessWidget {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        title: Text(
          "Chats",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: purpleColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_rounded, color: purpleColor),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation1,
                      Animation<double> animation2) {
                    return UserSelectionScreen();
                  },
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
          ),
        ],
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getCurrentUserChatListStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          print('Error fetching chat list: ${snapshot.error}');
          return Center(child: Text('Error fetching chat list'));
        }

        List<Map<String, dynamic>> users = snapshot.data ?? [];
        if (users.isEmpty) {
          return Center(child: Text('No chats available'));
        }

        // Use ListView.builder to display user data using UserTile component
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> user = users[index];
            return _buildUserTile(context, user);
          },
        );
      },
    );
  }

  Widget _buildUserTile(BuildContext context, Map<String, dynamic> user) {
    // Use StreamBuilder to listen to the latest message stream for each user
    return StreamBuilder<Map<String, dynamic>>(
      stream: _chatService.getLatestMessageStream(user['uid']),
      builder: (context, messageSnapshot) {
        if (messageSnapshot.connectionState == ConnectionState.waiting) {
          return ListTile(
            title: Text(
              user['email'],
              style: TextStyle(color: whiteColor),
            ),
            subtitle: Center(child: CircularProgressIndicator()),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation1,
                      Animation<double> animation2) {
                    return ChatPage(
                      receiverEmail: user['email'],
                      receiverID: user['uid'],
                    );
                  },
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
          );
        } else if (messageSnapshot.hasError) {
          print('Error fetching latest message: ${messageSnapshot.error}');
          return ListTile(
            title: Text(
              user['email'],
              style: TextStyle(color: whiteColor),
            ),
            subtitle: Text('Error fetching latest message'),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation1,
                      Animation<double> animation2) {
                    return ChatPage(
                      receiverEmail: user['email'],
                      receiverID: user['uid'],
                    );
                  },
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
          );
        }

        // Retrieve the latest message and timestamp from the snapshot
        Map<String, dynamic> latestData =
            messageSnapshot.data ?? {'message': '', 'timestamp': null};
        String latestMessage = latestData['message'] as String;
        DateTime? timestamp = latestData['timestamp']?.toDate();

        // Use the UserTile component to display the user data
        return UserTile(
          r_user: user['email'],
          message: latestMessage,
          timestamp: timestamp, // Pass timestamp to UserTile
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (BuildContext context,
                    Animation<double> animation1,
                    Animation<double> animation2) {
                  return ChatPage(
                    receiverEmail: user['email'],
                    receiverID: user['uid'],
                  );
                },
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          },
        );
      },
    );
  }
}
