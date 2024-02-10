import 'package:bank_off_time/core/functions/slide_navigation.dart';
import 'package:bank_off_time/core/providers/session_provider.dart';
import 'package:bank_off_time/core/widgets/custom_app_bar.dart';
import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/features/auth/presentation/views/login_view.dart';
import 'package:bank_off_time/features/profile/presentation/view/account_info_view.dart';
import 'package:bank_off_time/features/profile/presentation/view/history_view.dart';
import 'package:bank_off_time/features/profile/presentation/view/status_view.dart';
import 'package:bank_off_time/core/widgets/custom_button_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

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
                title: AppLocalizations.of(context)!.accountInformation,
                onTap: (){
                  slideNavigator(context, const AccountInfoView());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: AppLocalizations.of(context)!.status,
                onTap: (){
                  slideNavigator(context, const StatusView());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: AppLocalizations.of(context)!.history,
                onTap: (){
                  slideNavigator(context, const HistoryView());
                },
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: CustomButton(
                  borderRadius: 10,
                  buttonChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.logout,
                        style: const  TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 4,),
                      const Icon(Icons.logout, color: Colors.white, size: 20,)
                    ],
                  ),
                  backgroundColor: Colors.red,
                  onTap: () {
                    Provider.of<SessionProvider>(context,  listen: false).logout(context);
                    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginView()), (route) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}