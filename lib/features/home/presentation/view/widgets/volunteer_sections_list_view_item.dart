import 'package:bank_off_time/features/home/sections/presentation/views/section_categories_view.dart';
import 'package:flutter/material.dart';

class VolunteerSectionsListViewItem extends StatelessWidget {
  final String title;
  final String imageName;

  const VolunteerSectionsListViewItem({
    required this.title,
    required this.imageName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int sectionId = getSectionId(imageName);
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          print("Clicked");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SectionCategoriesView(
                        pageTitle: title,
                        sectionId:
                        sectionId,
                      ),
                    ),
                  );
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
