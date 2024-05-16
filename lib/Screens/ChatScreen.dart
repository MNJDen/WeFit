import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/MyPasswordField.dart';
import 'package:itec303/Components/User_Tile.dart';
import 'package:itec303/Screens/ChatPage.dart';
import 'package:itec303/Screens/UserSelectionScreen.dart';
import 'package:itec303/Services/Auth/Auth_Service.dart';
import 'package:itec303/Services/Chat/Chat_Service.dart';

class ChatScreen extends StatefulWidget {
  static _ChatScreenState? of(BuildContext context) =>
      context.findAncestorStateOfType<_ChatScreenState>();

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  final Map<String, bool> _isNewMessageMap = {};

  List<Map<String, dynamic>> _users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.white12,
            height: 1,
          ),
        ),
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
      body: RefreshIndicator(
        onRefresh: _refreshChatList,
        child: _buildUserList(),
      ),
    );
  }

  Future<void> _refreshChatList() async {
    final data = await _chatService.getCurrentUserChatListStream().first;

    setState(() {
      _users = data ?? [];
    });
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

        _sortChatList(users);

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> user = users[index];
            return _buildUserTile(context, user, index);
          },
        );
      },
    );
  }

  void _sortChatList(List<Map<String, dynamic>> userList) {
    userList.sort((a, b) {
      Timestamp? timestampA = a['latestTimestamp'];
      Timestamp? timestampB = b['latestTimestamp'];

      if (timestampA == null && timestampB == null) {
        return 0;
      } else if (timestampA == null) {
        return 1;
      } else if (timestampB == null) {
        return -1;
      } else {
        return timestampB.compareTo(timestampA);
      }
    });
  }

  Widget _buildUserTile(
      BuildContext context, Map<String, dynamic> user, int index) {
    return StreamBuilder<Map<String, dynamic>>(
      stream: _chatService.getLatestMessageStream(user['uid']),
      builder: (context, messageSnapshot) {
        if (messageSnapshot.connectionState == ConnectionState.waiting) {
          return ListTile(
            title: Text(
              user['username'],
              style: TextStyle(color: whiteColor),
            ),
            subtitle: Center(child: CircularProgressIndicator()),
            onTap: () {
              _navigateToChatPage(user['username'], user['uid']);
            },
          );
        } else if (messageSnapshot.hasError) {
          print('Error fetching latest message: ${messageSnapshot.error}');
          return ListTile(
            title: Text(
              user['username'],
              style: TextStyle(color: whiteColor),
            ),
            subtitle: Text('Error fetching latest message'),
            onTap: () {
              _navigateToChatPage(user['username'], user['uid']);
            },
          );
        }

        Map<String, dynamic> latestData =
            messageSnapshot.data ?? {'message': '', 'timestamp': null};
        String latestMessage = latestData['message'] as String;
        DateTime? timestamp = latestData['timestamp']?.toDate();

        String currentUserId = _authService.getCurrentUser()?.uid ?? '';

        bool isReceiver = currentUserId == latestData['receiverID'];

        bool isNewMessage = isReceiver &&
            (timestamp != null &&
                DateTime.now().difference(timestamp).inSeconds < 5);

        return GestureDetector(
          onLongPress: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    'Removing a User',
                    style: TextStyle(
                      color: blackColor,
                    ),
                  ),
                  content: Text(
                    'Are you sure you want to remove ${user['username']} from your chat list?',
                    style: TextStyle(
                      color: blackColor,
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: blackColor, fontWeight: FontWeight.w300),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: Text('Yes'),
                      onPressed: () async {
                        await _chatService.removeUserFromChatList(user['uid']);

                        setState(() {
                          _users.removeAt(index);
                        });

                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: UserTile(
            r_user: user['username'],
            message: latestMessage,
            timestamp: timestamp,
            profileImageUrl: user['profileImageUrl'],
            onTap: () {
              _navigateToChatPage(user['username'], user['uid']);
            },
            isNewMessage: isNewMessage,
          ),
        );
      },
    );
  }

  void _resetFontWeight(String userID) {
    setState(() {
      _isNewMessageMap[userID] = false;
    });
  }

  void _markMessageAsRead(String userID) {
    setState(() {
      _isNewMessageMap[userID] = false;
    });
  }

  void _navigateToChatPage(String receiverUser, String receiverID) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation1,
            Animation<double> animation2) {
          return ChatPage(
            receiverUser: receiverUser,
            receiverID: receiverID,
          );
        },
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }
}
