import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itec303/Components/Chat_Bubble.dart';
import 'package:itec303/Components/MyUsernameField.dart';
import 'package:itec303/Services/Auth/Auth_Service.dart';
import 'package:itec303/Services/Chat/Chat_Service.dart';

class ChatPage extends StatefulWidget {
  final String receiverUser;
  final String receiverID;

  ChatPage({
    super.key,
    required this.receiverUser,
    required this.receiverID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // Text controller
  final TextEditingController _messageController = TextEditingController();

  // Chat & Auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //for textfield focus
  // FocusNode myFocusNode = FocusNode();

  // @override
  // void initState() {
  //   super.initState();

  //   myFocusNode.addListener(() {
  //     if (myFocusNode.hasFocus) {
  //       Future.delayed(
  //         const Duration(milliseconds: 500),
  //         () => scrollDown(),
  //       );
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   myFocusNode.dispose();
  //   _messageController.dispose();
  //   super.dispose();
  // }

  // //scroll controller
  // final ScrollController _scrollController = ScrollController();

  // void scrollDown() {
  //   _scrollController.animateTo(
  //     _scrollController.position.maxScrollExtent,
  //     duration: const Duration(seconds: 1),
  //     curve: Curves.fastOutSlowIn,
  //   );
  // }

  // Send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverID, _messageController.text);

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
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
        title: Row(
          children: [
            FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(widget.receiverID)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError || !snapshot.hasData) {
                  return Text("Error");
                }
                var userData = snapshot.data!.data() as Map<String, dynamic>?;
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: userData != null &&
                              userData['profileImageUrl'] != null
                          ? Image.network(
                              userData['profileImageUrl'] as String,
                              fit: BoxFit.cover,
                              height: 40.h,
                              width: 40.w,
                            )
                          : Image.asset(
                              'assets/images/Default_Account_Image.png',
                              fit: BoxFit.cover,
                              height: 40.h,
                              width: 40.w,
                            ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              children: [
                Text(widget.receiverUser),
              ],
            )
          ],
        ),
        backgroundColor: blackColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildMessageList(),
          ),

          _buildUserInput(),
        ],
      ),
    ).animate().fadeIn(delay: const Duration(milliseconds: 300));
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessage(widget.receiverID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        return ListView.builder(
          reverse: true, 
          itemCount: snapshot.data!.docs
              .length, 
          itemBuilder: (context, index) {
            
            final doc =
                snapshot.data!.docs[snapshot.data!.docs.length - 1 - index];
            return _buildMessageItem(doc);
          },
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Column(
      crossAxisAlignment:
          isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          color: Color.fromRGBO(13, 13, 13, 0.3),
          alignment: alignment,
          child: ChatBubble(
            message: data['message'],
            isCurrentUser: isCurrentUser,
          ),
        ),
      ],
    );
  }

  Widget _buildUserInput() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          //textfield
          Expanded(
            child: TextFormField(
              // focusNode: myFocusNode,
              controller: _messageController,
              style: TextStyle(
                fontSize: 12.sp,
                color: whiteColor,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1.w, color: purpleColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: whiteColor,
                  ),
                ),
                hintText: "Type Here...",
                hintStyle: TextStyle(
                  fontSize: 12.sp,
                  color: whiteColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.h,
          ),
          //send button
          Container(
            decoration: BoxDecoration(
              color: purpleColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              splashColor: purpleColor,
              onPressed: sendMessage,
              icon: Icon(
                Icons.send_rounded,
                color: blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
