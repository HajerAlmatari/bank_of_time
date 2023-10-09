import 'package:flutter/material.dart';

class AccountInfoTextField extends StatelessWidget {

  final String hintText;
  final String text;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final bool? readOnly;

  const AccountInfoTextField({
    Key? key,
    required this.hintText,
    required this.text,
    this.inputType,
    this.onTap,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
      child: TextFormField(
        keyboardType: inputType,
        controller: TextEditingController(text: text),
        validator: (value){
          if(value == ""){
            return "$hintText cant be Empty";
          }else{
            return null;
          }
        },
        onTap: onTap,
        readOnly: readOnly!,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 1,
            ),
          ),
          labelText: hintText,
          hintText: hintText,
        ),
      ),
    );
  }
}