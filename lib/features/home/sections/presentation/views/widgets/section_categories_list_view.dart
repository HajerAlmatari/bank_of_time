import 'package:bank_off_time/core/utils/constants.dart';
import 'package:bank_off_time/features/home/sections/presentation/views/widgets/section_categories_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SectionCategories extends StatelessWidget {
  SectionCategories({Key? key, required this.sectionId}) : super(key: key);

  final int sectionId; // Pass the sectionId when creating the widget

  final List<String> images = [];

  final List<String> titles = [];
  final List<String> educationCategoryImagesList = [
    "assets/images/math.png",
    "assets/images/chemistry.png",
    "assets/images/biology.png",
    "assets/images/physics.png",
  ];
  final List<String> educationCategoryTitles = [
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!.math,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!
        .chemistry,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!.biology,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!.physics,
  ];


  final List<String> personalCategoryImagesList = [
    "assets/images/shopping.png",
    "assets/images/reading.png",
    "assets/images/consultation.png",
    "assets/images/art.png",

  ];
  final List<String> personalCategoryTitles = [
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!.shopping,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!.reading,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!
        .consultation,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!.art,
  ];

  final List<String> healthCategoryTitles = [
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!
        .alzheimer,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!
        .paralysis,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!
        .disability,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!.diabetes,
  ];
  final List<String> healthCategoryImagesList = [
    "assets/images/brain.png",
    "assets/images/health.png",
    "assets/images/lose.png",
    "assets/images/diabetes.png",
  ];

  final List<String> environmentCategoryImagesList = [
    "assets/images/cleaning.png",
    "assets/images/plants.png",
    "assets/images/organizing.png",
    "assets/images/aware.png",

  ];
  final List<String> environmentCategoryTitles = [
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!.cleaning,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!
        .agriculture,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!
        .organizing,
    AppLocalizations.of(Constants.navigatorKey.currentState!.context)!
        .awareness,

    // Add more titles as needed
  ];

  @override
  Widget build(BuildContext context) {
    images.clear();
    titles.clear();
    images.addAll(getImagesList(sectionId));
    titles.addAll(getTitlesList(sectionId));
    print(titles);
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        childCount: titles.length,
        (context, index) {
          return SectionCategoriesListViewItem(
            title: titles[index],
            imageName: images[index],
          );
        },
      ),
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }

  List<String> getTitlesList(int sectionId) {
    switch (sectionId) {
      case 1:
        return List.from(educationCategoryTitles);
      case 2:
        return List.from(healthCategoryTitles);
      case 3:
        return List.from(personalCategoryTitles);
      case 4:
        return List.from(environmentCategoryTitles);
      default:
        return [];
    }
  }

  List<String> getImagesList(int sectionId) {
    switch (sectionId) {
      case 1:
        return List.from(educationCategoryImagesList);
      case 2:
        return List.from(healthCategoryImagesList);
      case 3:
        return List.from(personalCategoryImagesList);
      case 4:
        return List.from(environmentCategoryImagesList);
      default:
        return [];
    }
  }
}
