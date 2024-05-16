import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itec303/Models/Message.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  Future<void> sendMessage(String receiverID, String message) async {
    final currentUserID = _auth.currentUser!.uid;
    final currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .add(newMessage.toMap());

    DocumentSnapshot chatRoomDoc =
        await _firestore.collection('chat_rooms').doc(chatRoomID).get();

    if (!chatRoomDoc.exists) {
      await _firestore.collection('chat_rooms').doc(chatRoomID).set({
        'participants': ids,
        'latestTimestamp': timestamp,
      });
    } else {
      await _firestore.collection('chat_rooms').doc(chatRoomID).update({
        'latestTimestamp': timestamp,
      });
    }

    await _updateUserChatList(receiverID);
  }

  Stream<QuerySnapshot> getMessage(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }

  Future<String?> getLatestMessage(String receiverID) async {
    final String currentUserID = _auth.currentUser!.uid;
    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    QuerySnapshot latestMessageSnapshot = await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .limit(1)
        .get();

    if (latestMessageSnapshot.docs.isNotEmpty) {
      DocumentSnapshot latestMessageDoc = latestMessageSnapshot.docs.first;
      Map<String, dynamic> latestMessageData =
          latestMessageDoc.data() as Map<String, dynamic>;

      return latestMessageData['message'];
    }

    return null;
  }

  Stream<Map<String, dynamic>> getLatestMessageStream(String receiverID) {
    final String currentUserID = _auth.currentUser!.uid;
    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .limit(1)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        DocumentSnapshot doc = snapshot.docs.first;
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return {
          'message': data['message'],
          'timestamp': data['timestamp'],
          'receiverID': data['receiverID'],
        };
      } else {
        return {
          'message': '',
          'timestamp': null,
          'receiverID': null,
        };
      }
    });
  }

  Stream<List<Map<String, dynamic>>> getCurrentUserChatListStream() {
    final currentUserID = _auth.currentUser!.uid;

    return _firestore
        .collection('chat_lists')
        .doc(currentUserID)
        .snapshots()
        .asyncMap((docSnapshot) async {
      if (!docSnapshot.exists) {
        return [];
      }

      List<String> userIDs = List<String>.from(docSnapshot['userIDs']);
      List<Map<String, dynamic>> userDetails = [];
      for (String userID in userIDs) {
        DocumentSnapshot<Map<String, dynamic>> userDoc =
            await _firestore.collection('Users').doc(userID).get();

        if (userDoc.exists) {
          var chatRoomID = [currentUserID, userID]..sort();
          var chatRoomRef = _firestore
              .collection('chat_rooms')
              .doc(chatRoomID.join('_'))
              .collection('messages');

          QuerySnapshot latestMessageQuery = await chatRoomRef
              .orderBy('timestamp', descending: true)
              .limit(1)
              .get();

          Timestamp? latestTimestamp;
          if (latestMessageQuery.docs.isNotEmpty) {
            latestTimestamp = latestMessageQuery.docs.first['timestamp'];
          }

          Map<String, dynamic>? userData =
              userDoc.data() as Map<String, dynamic>?;
          if (userData != null) {
            userData['uid'] = userID;
            userData['latestTimestamp'] = latestTimestamp;
            userDetails.add(userData);
          }
        }
      }

      userDetails.sort((a, b) {
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

      return userDetails;
    });
  }

  Future<void> _updateUserChatList(String userID) async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception("User is not authenticated");
      }
      final String currentUserID = currentUser.uid;

      DocumentReference userChatListDocRef =
          _firestore.collection('chat_lists').doc(userID);

      DocumentSnapshot userChatListDocSnapshot = await userChatListDocRef.get();

      if (!userChatListDocSnapshot.exists) {
        await userChatListDocRef.set({
          'userIDs': [currentUserID],
        });
      } else {
        await userChatListDocRef.update({
          'userIDs': FieldValue.arrayUnion([currentUserID]),
        });
      }
    } catch (e) {
      print('Error updating user chat list: $e');
    }
  }

  Future<void> addUserToChatList(String userID) async {
    try {
      final User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception("User is not authenticated");
      }
      final String currentUserID = currentUser.uid;

      DocumentReference chatListDocRef =
          _firestore.collection('chat_lists').doc(currentUserID);

      DocumentSnapshot chatListDocSnapshot = await chatListDocRef.get();

      if (!chatListDocSnapshot.exists) {
        await chatListDocRef.set({
          'userIDs': [userID],
        });
      } else {
        await chatListDocRef.update({
          'userIDs': FieldValue.arrayUnion([userID]),
        });
      }
    } catch (e) {
      print('Error adding user to chat list: $e');
    }
  }

  Stream<List<Map<String, dynamic>>> getAllUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    });
  }

  Future<void> removeUserFromChatList(String userID) async {
    final String currentUserID = _auth.currentUser!.uid;

    await _firestore.collection('chat_lists').doc(currentUserID).update({
      'userIDs': FieldValue.arrayRemove([userID]),
    });
  }
}
