import 'package:bank_off_time/features/home/data/models/category.dart';
import 'package:bank_off_time/features/home/features/sections/features/section_details/presentation/views/section_category_details_view.dart';
import 'package:bank_off_time/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class SectionCategoriesListViewItem extends ConsumerWidget {
  final CategoryModel categoryModel;
  const SectionCategoriesListViewItem({
    required this.categoryModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          // Navigate to the new page
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () {
                  // Handle the tap on the image if needed
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SectionCategoryDetailsView(title: ref.watch(mainProvider).isArabic ?  categoryModel.nameAr : categoryModel.nameEn, skillId: categoryModel.id,)));
                },
                child: Image.asset(
                  categoryModel.imgPath,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              ref.watch(mainProvider).isArabic ?  categoryModel.nameAr : categoryModel.nameEn,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
