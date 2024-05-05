import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/core/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final textEditingControllers = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    textEditingControllers.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 30),
          CustomTextFormField(
            prefix: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Icon(
                Icons.email_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            hintText: AppLocalizations.of(context)!.email,
            textEditingController: textEditingControllers,
            capitalization: TextCapitalization.none,
          ), // Email
          const SizedBox(height: 32),
          CustomButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                // Call your reset password function here
                // Pass the email address to the function
                // ResetPasswordFunction(textEditingControllers.text);
              }
            },
            buttonChild: Text(
              AppLocalizations.of(context)!.reset,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
