import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/features/main/presentation/view/main_view.dart';
import 'package:bank_off_time/features/profile/features/skills/presentation/views/skills_view.dart';
import 'package:bank_off_time/features/splash/presentaion/view/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OverviewView extends ConsumerWidget {
  const OverviewView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppLogo(),
              const SizedBox(
                height: 30,
              ),
              Text(
                AppLocalizations.of(context)!.overview_text,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 250,
                child: CustomButton(
                  buttonChild: Text(
                    AppLocalizations.of(context)!.volunteer,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainView()), (route) => false);
                    ref.read(indexBottomNavbarProvider.notifier).update((state) => 0);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SkillsView()));

                  },
                  borderRadius: 8,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              SizedBox(
                width: 250,
                child: CustomButton(
                  buttonChild: Text(

                    AppLocalizations.of(context)!.seek_help,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainView()), (route) => false);

                  },
                  borderRadius: 8,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              StatusSwitch()
            ],
          ),
        ),
      ),
    );
  }
}

class StatusSwitch extends StatefulWidget {
  const StatusSwitch({
    super.key,
  });

  @override
  State<StatusSwitch> createState() => _StatusSwitchState();
}

class _StatusSwitchState extends State<StatusSwitch> {

  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context)!.online_service
        ),
        const SizedBox(
          width: 24,
        ),
        Switch.adaptive(value: value, onChanged: (newValue){
          setState(() {
            value = newValue;
          });
        })
      ],
    );
  }
}
