import 'package:bank_off_time/core/utils/constants.dart';
import 'package:bank_off_time/features/home/presentation/view/widgets/volunteer_sections_list_view_item.dart';
import 'package:bank_off_time/features/home/presentation/view_models/home_view_model.dart';
import 'package:flutter/material.dart';

class VolunteerSections extends StatelessWidget {
   const VolunteerSections({Key? key, required this.viewModel}) : super(key: key);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !viewModel.isLoading,
      replacement: const SliverFillRemaining(
        child: Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      child: SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: viewModel.categoryList.length,
            (context, index) {
              return VolunteerSectionsListViewItem(
                categoryModel: viewModel.categoryList[index],
              );
            },
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
      ),
    );
  }
}
