import 'package:bank_off_time/features/home/features/sections/features/section_details/presentation/views/widgets/users_list.dart';
import 'package:flutter/material.dart';

class SectionCategoryDetailsView extends StatelessWidget {
  const SectionCategoryDetailsView({super.key, required this.title, required this.skillId});

  final String title;
  final int skillId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(title),
              centerTitle: true,
              pinned: true,
              expandedHeight: 50.0,
            ),
            UsersList(skillId: skillId,),
          ],
        ),
      ),
    );
  }
}
