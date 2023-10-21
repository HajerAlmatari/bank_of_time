import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/features/profile/presentation/view/widgets/account_info_text_field.dart';
import 'package:bank_off_time/features/profile/presentation/view/widgets/language_drop_down.dart';
import 'package:bank_off_time/features/profile/presentation/view/widgets/select_birthday.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountInfoForm extends StatelessWidget {
  const AccountInfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          AccountInfoTextField(
            hintText: AppLocalizations.of(context)!.name,
            text: "Sara",
          ),
          const LanguageDropDown(),
          AccountInfoTextField(
            hintText: AppLocalizations.of(context)!.email,
            text: "sara@gmail.com",
          ),
          AccountInfoTextField(
            hintText: AppLocalizations.of(context)!.country,
            text: AppLocalizations.of(context)!.saudiArabia,
          ),
          AccountInfoTextField(
            hintText: AppLocalizations.of(context)!.city,
            text: AppLocalizations.of(context)!.riyadh,
          ),
          const SelectBirthday(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CustomButton(
              buttonChild:  Text(
                AppLocalizations.of(context)!.save,
                style:
                    const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
