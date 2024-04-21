import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/features/home/data/models/category.dart';
import 'package:bank_off_time/features/profile/features/skills/presentation/view_models/add_skill_view_model.dart';
import 'package:bank_off_time/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multiselect/multiselect.dart';

class AddSkillView extends StatefulHookConsumerWidget {
  const AddSkillView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AddSkillViewState();
}

class AddSkillViewState extends ConsumerState<AddSkillView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(addSkillViewModel);

    return Scaffold(
      bottomSheet: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: CustomButton(
          onTap: () {
            if (!viewModel.isBusy) {
              viewModel.addSkills(context);
            }
          },
          buttonChild: Container(
            alignment: Alignment.center,
            child: viewModel.isBusy
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
                    AppLocalizations.of(context)!.add,
                    style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: viewModel.isLoading
              ? Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                  ),
                )
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            Text(
                              AppLocalizations.of(context)!.add_new_skill,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Skill Category",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 8,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        child: DropdownButtonFormField<CategoryModel>(
                          value: viewModel.selectedSkillCategory,
                          items: viewModel.skillCategory.map((CategoryModel category) {
                            return DropdownMenuItem<CategoryModel>(
                              value: category,
                              child: Text(category.nameEn),
                            );
                          }).toList(),
                          onChanged: (CategoryModel? item) {
                            viewModel.selectedSkillCategory = item;
                            setState(() {});
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              border:
                                  OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor))),
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16,
                      ),
                    ),
                    if (viewModel.selectedSkillCategory?.skills?.isNotEmpty ?? false)
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Skills",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    if (viewModel.selectedSkillCategory?.skills?.isNotEmpty ?? false)
                      const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 8,
                        ),
                      ),
                    if (viewModel.selectedSkillCategory?.skills?.isNotEmpty ?? false)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropDownMultiSelect<CategoryModel>(
                            menuItembuilder: (item) {
                              return Row(
                                children: [
                                  if (viewModel.selectedSkillItems.contains(item)) ...[
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: ShapeDecoration(
                                        shape: CircleBorder(),
                                        color: Colors.green,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                  if (!viewModel.selectedSkillItems.contains(item))
                                    SizedBox(
                                      width: 25,
                                    ),
                                  Text(ref.watch(mainProvider).isArabic ? item.nameAr : item.nameEn),
                                ],
                              );
                            },
                            childBuilder: (list) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Text(list
                                    .map((e) {
                                      return ref.watch(mainProvider).isArabic ? e.nameAr : e.nameEn;
                                    })
                                    .toList()
                                    .join(', '),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                              );
                            },
                            onChanged: (List<CategoryModel> x) {
                              setState(() {
                                viewModel.selectedSkillItems = x;
                              });
                            },
                            options: viewModel.skillItems,
                            selectedValues: viewModel.selectedSkillItems ?? [],
                            whenEmpty: 'Select Something',
                          ),

                          /*
                  MultiSelectDropDown<CategoryModel>(
                    options: viewModel.selectedSkillCategory!.skills
                        !.map((e) => ValueItem<CategoryModel>(label: e.nameEn, value: e))
                        .toList(),
                    onOptionSelected: (list) {
                      viewModel.selectedSkillItems = list.map((e) => e.value).toList();
                    },
                    inputDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                  ),

                       */
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
