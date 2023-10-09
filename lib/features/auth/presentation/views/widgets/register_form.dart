import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/core/widgets/custom_textformfield.dart';
import 'package:bank_off_time/features/main/presentation/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final textEditingControllers = (
    emailController: TextEditingController(),
    fullNameController: TextEditingController(),
    userNameController: TextEditingController(),
    passwordController: TextEditingController(),
    confirmPasswordController: TextEditingController(),
  );

  bool visible = false;

  void changeVisible() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  void dispose() {
    super.dispose();
    textEditingControllers.emailController.dispose();
    textEditingControllers.fullNameController.dispose();
    textEditingControllers.userNameController.dispose();
    textEditingControllers.confirmPasswordController.dispose();
    textEditingControllers.passwordController.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                CustomTextFormField(
                  prefix: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Icon(
                      Icons.email_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  hintText: "Email",
                  // inputType: TextIn/putType.emailAddress,
                  textEditingController: textEditingControllers.emailController,
                  capitalization: TextCapitalization.none,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  prefix: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Icon(
                      Icons.person_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  hintText: "Full Name",
                  // inputType: TextIn/putType.emailAddress,
                  textEditingController:
                      textEditingControllers.fullNameController,
                  capitalization: TextCapitalization.none,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  prefix: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Icon(
                      Icons.person_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  hintText: "User Name",
                  // inputType: TextIn/putType.emailAddress,
                  textEditingController:
                      textEditingControllers.userNameController,
                  capitalization: TextCapitalization.none,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
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
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  hintText: "Password",
                  obscure: visible == true ? false : true,
                  textEditingController:
                      textEditingControllers.passwordController,
                  capitalization: TextCapitalization.none,
                  limit: [
                    FilteringTextInputFormatter.singleLineFormatter,
                  ],
                  inputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
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
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  hintText: "Confirm Password",
                  obscure: visible == true ? false : true,
                  textEditingController:
                      textEditingControllers.confirmPasswordController,
                  capitalization: TextCapitalization.none,
                  limit: [
                    FilteringTextInputFormatter.singleLineFormatter,
                  ],
                  inputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  buttonChild: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    if(_formKey.currentState!.validate()){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainView()), (route) => false);
                    }
                  },
                ),
                InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account!",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: const Color(0xff9CA3AF))),
                        Text(
                          " Back to Login",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
