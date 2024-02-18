import 'package:bank_off_time/features/settings/presentation/view/categories_view.dart';
import 'package:bank_off_time/features/settings/presentation/view/settings_view.dart';
import 'package:flutter/material.dart';

import '../../../../settings/presentation/view/contact_us_view.dart';

class SectionCategoriesListViewItem extends StatelessWidget {
  final String title;
  final String imageName;

  const SectionCategoriesListViewItem({
    required this.title,
    required this.imageName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          print("Clicked");
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
                },
                child: Image.asset(
                  imageName,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
