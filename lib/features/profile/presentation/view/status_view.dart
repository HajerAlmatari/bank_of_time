import 'package:bank_off_time/core/widgets/custom_app_bar.dart';
import 'package:bank_off_time/features/profile/presentation/status_view_model.dart';
import 'package:bank_off_time/features/profile/presentation/view/widgets/status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StatusView extends ConsumerWidget {
  const StatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final viewmodel = ref.watch(statusViewModel);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(showBack: true,),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(AppLocalizations.of(context)!.status, style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),),
              ),
              const SizedBox(
                height: 20,
              ),
              StatusCard(
                value: viewmodel.status,
                bottomBorder: false,
                title: AppLocalizations.of(context)!.available,
                onChange: (value){
                  viewmodel.setStatus(context, value??false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
