import 'package:bank_off_time/core/utils/validator/validation_type.dart';
import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/core/widgets/custom_text_form_field.dart';
import 'package:bank_off_time/features/auth/presentation/view_models/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
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
    final viewModel = ref.watch(registerViewModel);
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
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Icon(
                      Icons.email_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  hintText: "Email",
                  // inputType: TextIn/putType.emailAddress,
                  inputController: textEditingControllers.emailController,
                  // capitalization: TextCapitalization.none,
                  isLast: false,
                  inputType: TextInputType.emailAddress,
                  validatorType: ValidatorType.email,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Icon(
                      Icons.person_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  hintText: "Full Name",
                  // inputType: TextIn/putType.emailAddress,
                  inputController: textEditingControllers.fullNameController,
                  isLast: false,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Icon(
                      Icons.person_outline,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  hintText: "User Name",
                  // inputType: TextIn/putType.emailAddress,
                  inputController: textEditingControllers.userNameController,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  suffixIcon: InkWell(
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
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Icon(
                      Icons.password_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  validatorType: ValidatorType.password,
                  hintText: "Password",
                  obsecurePassword: visible == true ? false : true,
                  inputController: textEditingControllers.passwordController,
                  // capitalization: TextCapitalization.none,
                  // limit: [
                  //   FilteringTextInputFormatter.singleLineFormatter,
                  // ],
                  inputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  suffixIcon: InkWell(
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
                  validatorType: ValidatorType.confirmPassword,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Icon(
                      Icons.password_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  hintText: "Confirm Password",
                  obsecurePassword: visible == true ? false : true,
                  inputController: textEditingControllers.confirmPasswordController,
                  // capitalization: TextCapitalization.none,
                  // limit: [
                  //   FilteringTextInputFormatter.singleLineFormatter,
                  // ],
                  inputType: TextInputType.visiblePassword,
                  confirmController: textEditingControllers.passwordController,
                ),
                const SizedBox(height: 32),
                CustomButton(
                  buttonChild: viewModel.isLoading
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
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      viewModel.registerNewAccount(
                        email: textEditingControllers.emailController,
                        userName: textEditingControllers.userNameController,
                        fullName: textEditingControllers.fullNameController,
                        password: textEditingControllers.passwordController,
                        context: context,
                      );
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
                                .copyWith(fontWeight: FontWeight.w600, fontSize: 16, color: const Color(0xff9CA3AF))),
                        Text(
                          " Back to Login",
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
