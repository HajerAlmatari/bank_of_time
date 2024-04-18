import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:bank_off_time/core/widgets/custom_app_bar.dart';
import 'package:bank_off_time/features/conversations/features/chat/presentations/view/chat_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../view_models/conversations_view_model.dart';

class ConversationsView extends ConsumerStatefulWidget {
  const ConversationsView({super.key});

  @override
  ConsumerState<ConversationsView> createState() => _ConversationsViewState();
}

class _ConversationsViewState extends ConsumerState<ConversationsView> {
  @override
  Widget build(BuildContext context) {

    final viewModel = ref.watch(conversationsViewModel);



    return  Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: CustomAppBar()),
                const SliverToBoxAdapter(child: SizedBox(height: 10,)),
                _buildUsersList()
              ],
            ),
          ),
        )
    );
  }

  Widget _buildUsersList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('chat_rooms').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SliverToBoxAdapter(child: const Text("Error"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(child: const Text("loading.."));
        }

        final conversations = snapshot.data!.docs;

        return  SliverList(

          delegate: SliverChildBuilderDelegate(
            childCount: conversations.length,
            (context, index) {
              return _buildUsersListItem(conversations[index]);
            },
          ),
        );
      },
    );
  }

  Widget _buildUsersListItem(QueryDocumentSnapshot<Object?> doc) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;

    if (ref.watch(sessionProvider).authUser!.email != data['email']) {
      return Container(
        margin: const  EdgeInsets.symmetric(vertical: 5),
        child: Card(
          color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
          child: ListTile(
            title: Text(data['email']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatView(
                    receiverUserEmail: data['email'],
                    receiverUserID: data['receiverId'],
                  ),
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
