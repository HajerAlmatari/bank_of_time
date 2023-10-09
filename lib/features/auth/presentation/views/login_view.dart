
import 'package:bank_off_time/features/auth/presentation/views/widgets/login_form.dart';
import 'package:bank_off_time/features/splash/presentaion/view/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Container(
          color: const Color(0xfffdfdfd),
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
                Text(
                  "Hi Welcome Back!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  "Sign in to your account",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color(0xffA2A0A8),
                      ),
                ),

                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: const AppLogo(),
                ),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
