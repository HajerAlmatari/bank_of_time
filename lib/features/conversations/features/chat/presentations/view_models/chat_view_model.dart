import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:bank_off_time/features/conversations/features/chat/data/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatViewModel = ChangeNotifierProvider((ref) => ChatService(ref));
class ChatService extends ChangeNotifier {

  final Ref ref;

  ChatService(this.ref);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage({required String receiverId, required String receiverEmail, required String message}) async {
    final String currentUserId = ref.watch(sessionProvider).authUser!.id.toString();
    final String currentUserEmail = ref.watch(sessionProvider).authUser!.email;
    final Timestamp timestamp = Timestamp.now();

    Message messageToSend = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join("_");

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(messageToSend.toMap());

    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .set({'email1' : receiverEmail,'email2' : currentUserEmail,
      'receiverId' : receiverId,
      'users' : [currentUserId, receiverId],

    });


    // await _firestore
    //     .collection('chat_rooms')
    //     .doc(chatRoomId)
    //     .set({});

  }

  Stream<QuerySnapshot> getMessages(String userId, String otherId){

    List<String> ids = [userId, otherId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy('timestamp', descending: false)
        .snapshots();

  }
}
