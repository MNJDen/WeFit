import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itec303/Models/Message.dart';

class ChatService {
  //get instance of firestore & auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        return user;
      }).toList();
    });
  }

  // Send a message and update the latest message timestamp in the chat room
  Future<void> sendMessage(String receiverID, String message) async {
    // Get the current user information
    final currentUserID = _auth.currentUser!.uid;
    final currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // Create a new message
    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    // Construct chat room ID
    List<String> ids = [currentUserID, receiverID];
    ids.sort(); // Sort the IDs to create a unique chat room ID
    String chatRoomID = ids.join('_');

    // Add the new message to the chat room
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .add(newMessage.toMap());

    // Verify the existence of the chat room document
    DocumentSnapshot chatRoomDoc =
        await _firestore.collection('chat_rooms').doc(chatRoomID).get();

    // If the document does not exist, create it and update it with the latestTimestamp
    if (!chatRoomDoc.exists) {
      // Initialize the chat room document with default fields
      await _firestore.collection('chat_rooms').doc(chatRoomID).set({
        'participants': ids,
        'latestTimestamp': timestamp,
      });
    } else {
      // Update the existing chat room document with the latestTimestamp
      await _firestore.collection('chat_rooms').doc(chatRoomID).update({
        'latestTimestamp': timestamp,
      });
    }
  }

  //get messages
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
    // Get current user ID
    final String currentUserID = _auth.currentUser!.uid;

    // Construct chat room ID for the two users (sorted to ensure uniqueness)
    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    // Fetch the latest message in the chat room
    QuerySnapshot latestMessageSnapshot = await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: true)
        .limit(1)
        .get();

    if (latestMessageSnapshot.docs.isNotEmpty) {
      // Get the latest message from the snapshot
      DocumentSnapshot latestMessageDoc = latestMessageSnapshot.docs.first;
      Map<String, dynamic> latestMessageData =
          latestMessageDoc.data() as Map<String, dynamic>;

      return latestMessageData['message'];
    }

    // Return null if there are no messages
    return null;
  }

  // Fetch the latest message and its timestamp in a chat room
  Stream<Map<String, dynamic>> getLatestMessageStream(String receiverID) {
    final String currentUserID = _auth.currentUser!.uid;

    // Construct chat room ID
    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    // Fetch the latest message and its timestamp in the chat room
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
        // Include both the latest message and its timestamp in the return value
        return {
          'message': data['message'],
          'timestamp': data['timestamp'],
        };
      } else {
        return {
          'message': '',
          'timestamp': null,
        };
      }
    });
  }

  // Fetch the current user's chat list and sort it by the latest message timestamp
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

      // Fetch user IDs in the chat list
      List<String> userIDs = List<String>.from(docSnapshot['userIDs']);

      // Fetch user details and latest message timestamps
      List<Map<String, dynamic>> userDetails = [];
      for (String userID in userIDs) {
        DocumentSnapshot<Map<String, dynamic>> userDoc =
            await _firestore.collection('Users').doc(userID).get();

        if (userDoc.exists) {
          // Fetch the latest message timestamp for each user
          var chatRoomID = [currentUserID, userID]..sort();
          var chatRoomRef = _firestore
              .collection('chat_rooms')
              .doc(chatRoomID.join('_'))
              .collection('messages');

          // Query for the latest message in the chat room
          QuerySnapshot latestMessageQuery = await chatRoomRef
              .orderBy('timestamp', descending: true)
              .limit(1)
              .get();

          Timestamp? latestTimestamp;
          if (latestMessageQuery.docs.isNotEmpty) {
            latestTimestamp = latestMessageQuery.docs.first['timestamp'];
          }

          // Include user details and latest message timestamp
          // Cast the return type of userDoc.data() to Map<String, dynamic>?
          Map<String, dynamic>? userData =
              userDoc.data() as Map<String, dynamic>?;
          if (userData != null) {
            userData['uid'] = userID;
            userData['latestTimestamp'] = latestTimestamp;
            userDetails.add(userData);
          }
        }
      }

      // Sort the user details based on the latest message timestamp
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

  // Add a user to the current user's chat list
  Future<void> addUserToChatList(String userID) async {
    final String currentUserID = _auth.currentUser!.uid;

    // Add the user ID to the chat list for the current user
    await _firestore.collection('chat_lists').doc(currentUserID).update({
      'userIDs': FieldValue.arrayUnion([userID]),
    });
  }

  // Fetch the list of all users
  Stream<List<Map<String, dynamic>>> getAllUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    });
  }

  // Remove a user from the current user's chat list
  Future<void> removeUserFromChatList(String userID) async {
    final String currentUserID = _auth.currentUser!.uid;

    // Remove the user ID from the current user's chat list
    await _firestore.collection('chat_lists').doc(currentUserID).update({
      'userIDs': FieldValue.arrayRemove([userID]),
    });
  }
}
