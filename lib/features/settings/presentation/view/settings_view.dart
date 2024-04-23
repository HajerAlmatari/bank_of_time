import 'package:bank_off_time/core/functions/slide_navigation.dart';
import 'package:bank_off_time/core/widgets/custom_app_bar.dart';
import 'package:bank_off_time/core/widgets/custom_button_with_icon.dart';
import 'package:bank_off_time/features/settings/presentation/view/about_us_view.dart';
import 'package:bank_off_time/features/settings/presentation/view/contact_us_view.dart';
import 'package:bank_off_time/features/settings/presentation/view/display_view.dart';
import 'package:bank_off_time/features/settings/presentation/view/language_modal.dart';
import 'package:flutter/material.dart';

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
                title: "Privacy and Policy",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: "Notification",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: "Accessibility",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: "Display",
                onTap: () {
                  slideNavigator(context, DisplayView());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: "Language",
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
                title: "Contact Us",
                onTap: () {
                  slideNavigator(context, const ContactUsView());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: "About Us",
                onTap: () {
                  slideNavigator(context, const AboutUsView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
