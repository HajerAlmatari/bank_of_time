import 'package:bank_off_time/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../splash/presentaion/view/widgets/app_logo.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(showBack: true),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.about_us, // Use your localized string for "About Us"
                  style: TextStyle(
                    fontSize: 35,
                    color: Theme.of(context).colorScheme.primary,// Adjust the font size as needed
                    fontWeight: FontWeight.bold, // Make the font bold
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const AppLogo(),
                          const SizedBox(width: 20),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.about_us_content,
                            style: TextStyle(fontSize: 15),
                            textDirection: TextDirection.ltr,textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
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
