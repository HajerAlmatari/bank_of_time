import 'package:bank_off_time/features/home/data/models/category.dart';
import 'package:bank_off_time/features/home/features/sections/presentation/views/section_categories_view.dart';
import 'package:bank_off_time/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VolunteerSectionsListViewItem extends ConsumerWidget {
  final CategoryModel categoryModel;

  const VolunteerSectionsListViewItem({
    required this.categoryModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () {
                  if(categoryModel.hasSkills){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SectionCategoriesView(
                          categoryModel: categoryModel,
                        ),
                      ),
                    );

                  }
                },
                child: Image.asset(
                  categoryModel.imgPath,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              ref.watch(mainProvider).isArabic ?  categoryModel.nameAr: categoryModel.nameEn,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  int getSectionId(String imageName) {
    if (imageName.contains('education.png')) {
      return 1;
    } else if (imageName.contains('health.png')) {
      return 2;
    } else if (imageName.contains('personal.png')) {
      return 3;
    } else if (imageName.contains('environment.png')) {
      return 4;
    }
    return 0;
  }
}
