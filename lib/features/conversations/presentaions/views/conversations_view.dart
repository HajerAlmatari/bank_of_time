import 'package:bank_off_time/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../view_models/conversations_view_model.dart';

class ConversationsView extends ConsumerWidget {
  const ConversationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final viewModel = ref.watch(conversationsViewModel);



    return  Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(child: CustomAppBar()),
                const SliverToBoxAdapter(child: SizedBox(height: 10,)),

              ],
            ),
          ),
        )
    );
  }
}
