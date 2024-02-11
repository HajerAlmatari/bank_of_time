import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class WelcomeContainer extends StatelessWidget {
  final bool showBack;

  const WelcomeContainer({required this.showBack, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showBack
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : Container(),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            "assets/images/avatar1.png",
            height: 50,
            width: 50,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.hello(Provider.of<SessionProvider>(context, listen: false).authUser?.name??""),
              style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
            ),
            Text(
              AppLocalizations.of(context)!.youAreOffline,
              style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
            AppLocalizations.of(context)!.yourTimeBalanceIs,
                  style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                ),
                Text(
                  AppLocalizations.of(context)!.h,
                  style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      color: Colors.indigo),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
