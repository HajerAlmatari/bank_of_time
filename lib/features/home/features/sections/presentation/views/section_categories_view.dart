import 'package:bank_off_time/features/home/data/models/category.dart';
import 'package:bank_off_time/features/home/features/sections/presentation/views/widgets/section_categories_list_view.dart';
import 'package:bank_off_time/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../presentation/view/widgets/home_search_bar.dart';

class SectionCategoriesView extends ConsumerWidget {
  final CategoryModel categoryModel;

  const SectionCategoriesView(
      {Key? key, required this.categoryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text(ref.watch(mainProvider).isArabic ?  categoryModel.nameAr : categoryModel.nameEn),
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
                list: categoryModel.skills??[],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
