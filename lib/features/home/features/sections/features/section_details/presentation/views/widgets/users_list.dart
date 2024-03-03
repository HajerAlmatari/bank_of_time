import 'package:bank_off_time/features/home/features/sections/features/section_details/presentation/view_model/section_category_details_view_model.dart';
import 'package:bank_off_time/features/home/features/sections/features/section_details/presentation/views/widgets/user_item_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersList extends ConsumerWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final viewModel = ref.watch(sectionCategoryDetailsViewModel);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: viewModel.usersList.length,
        (context, index) {
          return UserItemCard(
            user: viewModel.usersList[index],
          );
        },
      ),
    );
  }
}
