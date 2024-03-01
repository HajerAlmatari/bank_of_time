import 'package:bank_off_time/features/home/sections/features/section_details/presentation/views/section_category_details_view.dart';
import 'package:flutter/material.dart';


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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SectionCategoryDetailsView(title: title,)));
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
