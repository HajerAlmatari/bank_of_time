import 'package:bank_off_time/features/home/features/sections/features/section_details/presentation/view_model/section_category_details_view_model.dart';
import 'package:bank_off_time/features/home/features/sections/features/section_details/presentation/views/widgets/user_item_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UsersList extends ConsumerWidget {

  final int skillId;
  const UsersList({required this.skillId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final viewModel = ref.watch(sectionCategoryDetailsViewModel(skillId));
    return SliverLayoutBuilder(
      builder: (context, constraint) {

        if(viewModel.isLoading){
          return SliverFillRemaining(
            child: Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        if(viewModel.userList.isEmpty){
          return SliverFillRemaining(
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.no_data,
              ),
            ),
          );
        }


        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: viewModel.userList.length,
            (context, index) {
              return UserItemCard(
                user: viewModel.userList[index],
                skillId: skillId,
              );
            },
          ),
        );
      }
    );
  }
}
