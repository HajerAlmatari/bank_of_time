import 'package:bank_off_time/features/home/presentation/view/widgets/volunteer_sections_list_view_item.dart';
import 'package:flutter/material.dart';

class VolunteerSections extends StatelessWidget {
   VolunteerSections({Key? key}) : super(key: key);

  final List<String> images = [
    "assets/images/education.png",
    "assets/images/health.png",
    "assets/images/personal.png",
    "assets/images/environment.png",
  ];

  final List<String> titles = ["Education", "Health", "Personal", "Environment"];

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
          childCount: 4,
          (context, index) {
            return VolunteerSectionsListViewItem(
              title: titles[index],
              imageName: images[index],
            );
          },
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
    );
  }
}
