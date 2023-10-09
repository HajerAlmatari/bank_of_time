import 'package:bank_off_time/core/widgets/custom_app_bar.dart';
import 'package:bank_off_time/features/home/presentation/view/widgets/home_search_bar.dart';
import 'package:bank_off_time/features/home/presentation/view/widgets/volunteer_sections_list_view.dart';
import 'package:flutter/material.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: CustomAppBar()),
              const SliverToBoxAdapter(child: SizedBox(height: 10,)),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: HomeSearchBar(),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20,)),
              VolunteerSections(),
            ],
          ),
        ),
      )
    );
  }
}
