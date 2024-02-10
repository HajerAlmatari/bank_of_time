import 'package:bank_off_time/core/utils/validator/validation_type.dart';
import 'package:bank_off_time/core/utils/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? inputController;
  final TextEditingController? confirmController;
  final TextInputType? inputType;
  final String? hintText;
  final AutovalidateMode? autovalidateMode;
  final ValidatorType? validatorType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? myFocusNode;
  final FocusNode? nextFocusNode;
  final bool? obsecurePassword;
  final bool? enabled;
  final bool? readOnly;
  final bool isLast;
  final VoidCallback? onTap;
  final TextDirection? textDirection;
  final String? errorText;
  final bool allowNull;
  final bool maxLineNull;
  final Color? fillColor;

  const CustomTextFormField(
      {Key? key,
      this.inputController,
      this.inputType,
      this.hintText,
      this.validatorType,
      this.prefixIcon,
      this.suffixIcon,
      this.myFocusNode,
      this.nextFocusNode,
      this.obsecurePassword,
      this.enabled,
      this.onTap,
      this.readOnly,
      this.autovalidateMode,
      this.allowNull = false,
      this.maxLineNull = false,
      this.confirmController,
      this.textDirection,
      this.errorText,
      this.fillColor,
      this.isLast = false,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
          maxLines: maxLineNull?null:1,
          controller: inputController,
          autovalidateMode: autovalidateMode,
          textInputAction: isLast ? TextInputAction.go : TextInputAction.next,
          keyboardType: inputType,
          obscureText: obsecurePassword ?? false,
          inputFormatters: inputType==TextInputType.number ?  <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ] : null,
          textDirection: textDirection,
          // onChanged: onChange,
          decoration: InputDecoration(
            fillColor: const Color(0xffF9F9FA),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            labelText: hintText,
            hintText: hintText,
          ),
          focusNode: myFocusNode,
          enabled: enabled,
          onTap: onTap,
          readOnly: readOnly ?? false,
          onFieldSubmitted: (value) {
            if (nextFocusNode != null && allowNull) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            }
          },
          validator: (value) {
            if (value!.isEmpty && allowNull == false) {
              return "$hintText can't be Empty";
            }
            if (validatorType == ValidatorType.password && allowNull == false) {
              if (!Validator.validPassword(inputController!.text.toString())) {
                return Validator.invalidPasswordText(
                    inputController!.text.toString());
              } else {
                return null;
              }
            }
            if (validatorType == ValidatorType.confirmPassword) {
              if (!Validator.validPassword(inputController!.text.toString())) {
                return Validator.invalidPasswordText(
                    inputController!.text.toString());
              }if(inputController!.text != confirmController!.text){
                return "password and confirm password do not match";
              }
                return null;
            } else if (validatorType == ValidatorType.email) {
              if (!Validator.validEmail(inputController!.text.toString())) {
                return "Please enter valid email";
              } else {
                return null;
              }
            }
            else if (validatorType == ValidatorType.number) {
              if (!Validator.validNumber(inputController!.text.toString())) {
                return "Only number allowed";
              } else {
                return null;
              }
            } else {
              return null;
            }
          }),
    );
  }
}
