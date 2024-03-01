import 'package:bank_off_time/features/home/sections/presentation/views/widgets/section_categories_list_view.dart';
import 'package:flutter/material.dart';

import '../../../presentation/view/widgets/home_search_bar.dart';

class SectionCategoriesView extends StatelessWidget {
  final String pageTitle;
  final int sectionId;

  const SectionCategoriesView(
      {Key? key, required this.pageTitle, required this.sectionId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(pageTitle),
                centerTitle: true,
                pinned: true,
                expandedHeight: 100.0,
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: HomeSearchBar(),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SectionCategories(
                sectionId: sectionId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
