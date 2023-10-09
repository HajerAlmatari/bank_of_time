import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/features/profile/presentation/view/widgets/account_info_text_field.dart';
import 'package:bank_off_time/features/profile/presentation/view/widgets/language_drop_down.dart';
import 'package:bank_off_time/features/profile/presentation/view/widgets/select_birthday.dart';
import 'package:flutter/material.dart';

class AccountInfoForm extends StatelessWidget {
  const AccountInfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          const AccountInfoTextField(
            hintText: "Name",
            text: "Mohammed Al-Haddad",
          ),
          const LanguageDropDown(),
          const AccountInfoTextField(
            hintText: "Email",
            text: "Mohammed@gmail.com",
          ),
          const AccountInfoTextField(
            hintText: "Country",
            text: "Saudi Arabia",
          ),
          const AccountInfoTextField(
            hintText: "City",
            text: "Riyadh",
          ),
          const SelectBirthday(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CustomButton(
              buttonChild: const Text(
                "Update",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
