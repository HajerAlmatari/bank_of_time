import 'package:bank_off_time/core/data/network/network_api_services.dart';
import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/core/widgets/custom_textformfield.dart';
import 'package:bank_off_time/features/auth/data/repos/auth_repo_impl.dart';
import 'package:bank_off_time/features/auth/presentation/view_models/login_view_model.dart';
import 'package:bank_off_time/features/auth/presentation/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final textEditingControllers = (
    userNameController: TextEditingController(),
    passwordController: TextEditingController(),
  );

  final focusNodes = (
    userNameFocusNode: FocusNode(),
    passwordFocusNode: FocusNode(),
  );

  bool visible = false;

  void changeVisible() {
    setState(() {
      visible = !visible;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    textEditingControllers.userNameController.dispose();
    textEditingControllers.passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(AuthRepository(NetworkApiServices())),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomTextFormField(
              focusNode: focusNodes.userNameFocusNode,
              prefix: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Icon(
                  Icons.person_outline,
                  color: focusNodes.userNameFocusNode.hasFocus
                      ? Theme.of(context).colorScheme.primary
                      : const Color(0xffA2A0A8),
                ),
              ),
              hintText: "User Name",
              textEditingController: textEditingControllers.userNameController,
              capitalization: TextCapitalization.none,
            ), //User Name
            const SizedBox(height: 24),
            CustomTextFormField(
              focusNode: focusNodes.passwordFocusNode,
              suffix: InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  changeVisible();
                },
                child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: visible
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.remove_red_eye_outlined)),
              ),
              prefix: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Icon(
                    Icons.password_outlined,
                    color: focusNodes.passwordFocusNode.hasFocus
                        ? Theme.of(context).colorScheme.primary
                        : const Color(0xffA2A0A8),
                  )),
              hintText: "Password",
              obscure: visible == true ? false : true,
              textEditingController: textEditingControllers.passwordController,
              capitalization: TextCapitalization.none,
              limit: [
                FilteringTextInputFormatter.singleLineFormatter,
              ],
              inputType: TextInputType.visiblePassword,
            ), //Password
            const SizedBox(height: 16),
            InkWell(
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot your password?",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            Consumer<LoginViewModel>(
              builder: (context, loginViewModel, child) {
                return CustomButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      loginViewModel.loginWithUserNameAndPassword(textEditingControllers.userNameController,
                          textEditingControllers.passwordController, context);
                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainView()), (route) => false);
                    }
                  },
                  buttonChild: loginViewModel.isLoading
                      ? const Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          ),
                        )
                      : const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                );
              },
            ),
            InkWell(
              focusColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterView()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have account?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600, fontSize: 16, color: const Color(0xff9CA3AF))),
                    Text(
                      " Sign Up",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 16, color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
