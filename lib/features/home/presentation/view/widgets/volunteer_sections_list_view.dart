import 'package:bank_off_time/core/utils/constants.dart';
import 'package:bank_off_time/features/home/presentation/view/widgets/volunteer_sections_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VolunteerSections extends StatelessWidget {
   VolunteerSections({Key? key}) : super(key: key);

  final List<String> images = [
    "assets/images/education.png",
    "assets/images/health.png",
    "assets/images/personal.png",
    "assets/images/environment.png",
  ];

  final List<String> titles = [
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!.education,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!.health,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!.personal,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!.environment,
  ];

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
