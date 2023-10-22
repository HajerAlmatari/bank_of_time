import 'package:bank_off_time/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(showBack: true,),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.volunteer_activism_outlined, size: 60,),
                        const SizedBox(width: 20,),
                        Text(AppLocalizations.of(context)!.support, style: const TextStyle(fontSize: 40),)
                      ],
                    ),
                    const SizedBox(height: 50,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.talkToUs, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                        const Text("+966 55 444 3333", style: TextStyle(fontSize: 15), textDirection: TextDirection.ltr),
                        const Text("+966 55 444 3333", style: TextStyle(fontSize: 15), textDirection: TextDirection.ltr),
                        const Text("info@bot.com", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
