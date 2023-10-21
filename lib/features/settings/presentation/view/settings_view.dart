import 'package:bank_off_time/core/functions/slide_navigation.dart';
import 'package:bank_off_time/core/widgets/custom_app_bar.dart';
import 'package:bank_off_time/core/widgets/custom_button_with_icon.dart';
import 'package:bank_off_time/features/settings/presentation/view/contact_us_view.dart';
import 'package:bank_off_time/features/settings/presentation/view/language_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 30,
              ),
              CustomButtonWithIcon(
                title: AppLocalizations.of(context)!.privacyAndPolicy,
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: AppLocalizations.of(context)!.notifications,
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: AppLocalizations.of(context)!.accessibility,
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: AppLocalizations.of(context)!.display,
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: AppLocalizations.of(context)!.language,
                onTap: () {
                  // slideNavigator(context, const LanguageView());
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
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: AppLocalizations.of(context)!.contactUs,
                onTap: () {
                  slideNavigator(context, const ContactUsView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
