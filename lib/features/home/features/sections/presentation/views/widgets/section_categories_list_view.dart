import 'package:bank_off_time/core/utils/constants.dart';
import 'package:bank_off_time/features/home/data/models/category.dart';
import 'package:bank_off_time/features/home/features/sections/presentation/views/widgets/section_categories_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SectionCategories extends StatelessWidget {
  const SectionCategories({Key? key, required this.list}) : super(key: key);
  final List<CategoryModel> list;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: list.length,
        (context, index) {
          return SectionCategoriesListViewItem(
            categoryModel: list[index],
          );
        },
      ),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

}
