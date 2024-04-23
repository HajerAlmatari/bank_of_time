import 'package:bank_off_time/features/auth/presentation/views/widgets/reset_form.dart';
import 'package:bank_off_time/features/settings/presentation/view/language_modal.dart';
import 'package:bank_off_time/features/splash/presentaion/view/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  ResetPasswordViewState createState() => ResetPasswordViewState();
}

class ResetPasswordViewState extends State<ResetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: ListView(
              children: [
                // const Icon(Icons.arrow_back),
                const SizedBox(
                  height: 38,
                ),

                /// The Edit Start From Here
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(children: [
                        Text(
                          AppLocalizations.of(context)!.reset_password,
                          // Use your localized string for "About Us"
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                  ),
                        ), //Hi Welcome Back!
                        const SizedBox(
                          height: 4,
                        ),
                      ]),
                      InkWell(
                          child: const Icon(Icons.language),
                          onTap: () {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50.0),
                                  topLeft: Radius.circular(50.0),
                                ),
                              ),
                              context: context,
                              builder: (context) {
                                return const LanguageModal();
                              },
                            );
                          })
                    ]), //
                /// The Edit End Here

                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: const AppLogo(),
                ),
                const ResetPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
