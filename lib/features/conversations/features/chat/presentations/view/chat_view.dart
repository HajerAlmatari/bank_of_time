import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:bank_off_time/features/conversations/features/chat/presentations/view_models/chat_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatView extends ConsumerStatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;

  const ChatView({required this.receiverUserEmail, required this.receiverUserID, super.key});

  @override
  ConsumerState<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends ConsumerState<ChatView> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  void sendMessage(ChatService chatService) async {
    if (_messageController.text.isNotEmpty) {
      await chatService.sendMessage(
        message: _messageController.text ,
        receiverEmail: widget.receiverUserEmail,
        receiverId: widget.receiverUserID,
      );
      scrollToTheBottom();
      _messageController.clear();
    }
  }

  void scrollToTheBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 70,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final  _chatService = ref.watch(chatViewModel);


    return Scaffold(
      bottomSheet: _buildMessageInput(_chatService),
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 70),
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: _buildMessageList(_chatService),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

    final currentUser = data['senderId'] == ref.watch(sessionProvider).authUser!.id.toString();
    final alignment = currentUser ? Alignment.centerRight : Alignment.centerLeft;

    Timestamp timestamp = data['timestamp'];
    DateTime dateTime = timestamp.toDate();
    String formattedTime = "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";

    return Align(
      // color: Colors.red,
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: currentUser ? Theme.of(context).primaryColor : Colors.grey,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(currentUser ? 8 : 0),
            bottomRight: Radius.circular(currentUser ? 0 : 8),
            topLeft: const Radius.circular(8),
            topRight: const Radius.circular(8),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: currentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              data['message'],
              style: TextStyle(
                color: currentUser ? Colors.white : Colors.black,
              ),
            ),
            Text(
              formattedTime,
              style: TextStyle(
                color: currentUser ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList(ChatService chatService) {
    return StreamBuilder(
      stream: chatService.getMessages(ref.watch(sessionProvider).authUser!.id.toString(), widget.receiverUserID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error.toString()}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }

        return ListView(
          controller: scrollController,
          children: snapshot.data!.docs.map((document) => _buildMessageItem(document)).toList(),
        );
      },
    );
  }

  Widget _buildMessageInput(ChatService chatService) {
    return Row(
      children: [
        Expanded(
          child: MyTestField(
            controller: _messageController,
            hintText: "message",
            onTap: () => scrollToTheBottom(),
            obscure: false,
          ),
        ),
        IconButton(
          onPressed: () => sendMessage(chatService),
          icon: const Icon(
            Icons.send,
          ),
        ),
      ],
    );
  }
}

class MyTestField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final bool obscure;
  final TextAlign? alignment;
  final Function()? onTap;
  const MyTestField({super.key, required this.controller, required this.hintText, required this.obscure, this.onTap, this.alignment});


  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      textAlign: alignment??TextAlign.end,
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade200)
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1)
      ),
    );
  }
}
