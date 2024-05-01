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

  //send message
  Future<void> sendMessage(String receiverID, message) async {
    //get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create new message
    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    //contruct chat room ID for the two users (sorted to ensure uniqueness)
    List<String> ids = [currentUserID, receiverID];
    ids.sort(); //sort the ids (this ensures the chat screen is the same for both user)
    String chatRoomID = ids.join('_');

    //add new message to database
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
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

  // Fetch the chat list for the current user
  Stream<List<Map<String, dynamic>>> getCurrentUserChatListStream() {
    final String currentUserID = _auth.currentUser!.uid;

    return _firestore
        .collection('chat_lists')
        .doc(currentUserID)
        .snapshots()
        .asyncMap((docSnapshot) async {
      // Initialize the chat list if the document doesn't exist
      if (!docSnapshot.exists) {
        await _firestore.collection('chat_lists').doc(currentUserID).set({
          'userIDs': [],
        });
        return [];
      }

      // Retrieve the list of user IDs from the document
      List<dynamic> userIDsDynamic = docSnapshot.data()?['userIDs'] ?? [];

      // Convert the list to a List<String> and handle any parsing issues
      List<String> userIDs;
      try {
        userIDs = List<String>.from(userIDsDynamic);
      } catch (e) {
        print('Error parsing user IDs: $e');
        return [];
      }

      // Fetch details of each user in the chat list
      List<Map<String, dynamic>> userDetails = [];
      for (String userID in userIDs) {
        DocumentSnapshot userDoc =
            await _firestore.collection("Users").doc(userID).get();
        if (userDoc.exists) {
          userDetails.add(userDoc.data() as Map<String, dynamic>);
        }
      }
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
