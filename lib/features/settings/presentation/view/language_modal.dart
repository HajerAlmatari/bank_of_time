import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/features/settings/presentation/view/widgets/change_language_button.dart';
import 'package:bank_off_time/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageModal extends ConsumerWidget {
  const LanguageModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(mainProvider);
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(AppLocalizations.of(context)!.language, style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 10,),
          ChangeLanguageButton(
            selected: provider.selectedOption == 1,
            text: AppLocalizations.of(context)!.arabic,
            groupValue: provider.selectedOption,
            value: 1,
            onChange: (value){
              print("the value is $value");
              provider.changeSelectedOption(1);
            },
          ),
          const SizedBox(height: 7,),
          ChangeLanguageButton(
            selected: provider.selectedOption == 2,
            text: AppLocalizations.of(context)!.english,
            groupValue: provider.selectedOption,
            value: 2,
            onChange: (value){
              print("the value is $value");

              //hi hajer 
              provider.changeSelectedOption(2);
            },
          ),
          const SizedBox(height: 10,),
          CustomButton(
              buttonChild: Text(AppLocalizations.of(context)!.save, style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
              onTap: () {
                ref.read(mainProvider.notifier).setLocale();
                Navigator.of(context).pop();
              },
          ),
        ],
      ),
      // color: Colors.red,
    );
  }
}
