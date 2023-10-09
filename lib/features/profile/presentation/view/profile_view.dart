import 'package:bank_off_time/core/functions/slide_navigation.dart';
import 'package:bank_off_time/core/widgets/custom_app_bar.dart';
import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/features/auth/presentation/views/login_view.dart';
import 'package:bank_off_time/features/profile/presentation/view/account_info_view.dart';
import 'package:bank_off_time/features/profile/presentation/view/history_view.dart';
import 'package:bank_off_time/features/profile/presentation/view/status_view.dart';
import 'package:bank_off_time/core/widgets/custom_button_with_icon.dart';
import 'package:flutter/material.dart';

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
                title: "Account Information",
                onTap: (){
                  slideNavigator(context, const AccountInfoView());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: "Status",
                onTap: (){
                  slideNavigator(context, const StatusView());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButtonWithIcon(
                title: "History",
                onTap: (){
                  slideNavigator(context, const HistoryView());
                },
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: CustomButton(
                  borderRadius: 10,
                  buttonChild: const  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Log Out",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 4,),
                      Icon(Icons.logout, color: Colors.white, size: 20,)
                    ],
                  ),
                  backgroundColor: Colors.red,
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginView()), (route) => false);
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