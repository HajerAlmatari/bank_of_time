import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/features/profile/features/skills/data/models/models.dart';
import 'package:bank_off_time/features/profile/features/skills/presentation/view_models/add_skill_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class AddSkillView extends ConsumerWidget {
  const AddSkillView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(addSkillViewModel);

    return Scaffold(
      bottomSheet: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: CustomButton(
          onTap: (){},
          buttonChild: Container(
            alignment: Alignment.center,
            child: Text(AppLocalizations.of(context)!.add, style: TextStyle(

              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: CustomScrollView(
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
                  child: DropdownButtonFormField<SkillCategory>(
                    value: viewModel.selectedSkillCategory,
                    items: viewModel.skillCategory.map((SkillCategory category) {
                      return DropdownMenuItem<SkillCategory>(
                        value: category,
                        child: Text(category.name),
                      );
                    }).toList(),
                    onChanged: (SkillCategory? item) {
                      viewModel.selectedSkillCategory = item;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor))),
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
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Skills",
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MultiSelectDropDown<SkillItem>(
                    options: viewModel.skillItems.map((e) => ValueItem<SkillItem>(label: e.name, value: e)).toList(),
                    onOptionSelected: (list) {
                      viewModel.selectedSkillItems = list.map((e) => e.value).toList();
                    },

                    inputDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
