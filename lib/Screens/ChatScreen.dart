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
    @override
    _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
    final ChatService _chatService = ChatService();
    final AuthService _authService = AuthService();

    // Initialize _users list as an empty list
    List<Map<String, dynamic>> _users = [];

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
            // Wrap the ListView.builder in a RefreshIndicator
            body: RefreshIndicator(
                onRefresh: _refreshChatList, // Refresh callback function
                child: _buildUserList(),
            ),
        );
    }

    // Refresh callback function to refresh the chat list
    Future<void> _refreshChatList() async {
        // Refresh data from the chat list stream
        final data = await _chatService.getCurrentUserChatListStream().first;

        // Update the state with the new data
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

                // Get the list of users from the snapshot
                List<Map<String, dynamic>> users = snapshot.data ?? [];

                // Sort the users based on the latest message timestamp
                _sortChatList(users);

                // Use ListView.builder to display the sorted list of users
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
                // Compare timestamps in descending order
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
                Map<String, dynamic> latestData = messageSnapshot.data ?? {'message': '', 'timestamp': null};
                String latestMessage = latestData['message'] as String;
                DateTime? timestamp = latestData['timestamp']?.toDate();

                // Wrap UserTile with GestureDetector to handle long press
                return GestureDetector(
                    onLongPress: () {
                        // Show confirmation dialog on long press
                        showDialog(
                            context: context,
                            builder: (context) {
                                return AlertDialog(
                                    title: Text('Remove user?'),
                                    content: Text(
                                        'Are you sure you want to remove ${user['email']} from your chat list?'
                                    ),
                                    actions: [
                                        TextButton(
                                            child: Text('Cancel'),
                                            onPressed: () {
                                                Navigator.pop(context);
                                            },
                                        ),
                                        TextButton(
                                            child: Text('Yes'),
                                            onPressed: () async {
                                                await _chatService.removeUserFromChatList(user['uid']);

                                                // Update state to remove the user
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
                        r_user: user['email'],
                        message: latestMessage,
                        timestamp: timestamp,
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
                    ),
                );
            },
        );
    }
}
