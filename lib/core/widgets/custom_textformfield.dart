import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final TextEditingController textEditingController;
  final Widget? suffix;
  final Widget? prefix;
  final bool obscure;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? limit;
  final TextCapitalization capitalization;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final bool? readOnly;
  final double paddingStart;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.textEditingController,
    this.suffix,
    this.prefix,
    this.obscure = false,
    this.onTap,
    this.limit,
    this.labelText,
    required this.capitalization,
    this.inputType,
    this.readOnly = false,
    this.focusNode,
    this.paddingStart = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, left: paddingStart),
      child: TextFormField(

          controller: textEditingController,
          obscureText: obscure,
          focusNode: focusNode,
          textCapitalization: capitalization,
          keyboardType: inputType,
          readOnly: readOnly!,
          inputFormatters: limit,
          onTap: onTap,
          validator: (value){
            if(value == ""){
              return "$hintText cant be Empty";
            }else{
              return null;
            }
          },
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
              prefixIcon: prefix,
              suffixIcon: suffix,
              labelText: labelText,
              hintText: hintText,
          ),
      ),
    );
  }
}
