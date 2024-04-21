import 'package:bank_off_time/core/widgets/custom_app_bar.dart';
import 'package:bank_off_time/features/profile/features/skills/presentation/view_models/skills_view_model.dart';
import 'package:bank_off_time/features/profile/features/skills/presentation/views/add_skill_view.dart';
import 'package:bank_off_time/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SkillsView extends ConsumerWidget {
  const SkillsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final viewModel = ref.watch(skillsViewModel);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: CustomAppBar(
                  showBack: true,
                  showMenu: false,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.skills,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () async{
                          final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const AddSkillView()));

                          if(result??false){
                            viewModel.refresh();
                          }
                          },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.add,
                              ),
                              Text(
                                AppLocalizations.of(context)!.add,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverLayoutBuilder(
                builder: (context, constraint) {


                  if(viewModel.isLoading){
                    return SliverFillRemaining(
                      child: Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }

                  if(viewModel.skillsList.isEmpty){
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                            "No Data"
                        ),
                      ),
                    );
                  }

                  return SliverToBoxAdapter(
                    child: Column(
                      children: [
                        ...viewModel.skillsList.map((e) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(ref.watch(mainProvider).isArabic ? e.nameAr : e.nameEn),
                            ),
                          );
                        })
                      ],
                    ),
                  );

                    /*
                    SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: viewModel.skillsList.length,
                      (context, index) {

                        final item = viewModel.skillsList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(ref.watch(mainProvider).isArabic ? item.nameAr : item.nameEn),
                          ),
                        );
                      },
                    ),
                  );


                     */
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
