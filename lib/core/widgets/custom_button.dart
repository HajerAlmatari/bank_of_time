import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget buttonChild;
  final VoidCallback onTap;
  final double? height;
  final double? borderRadius;
  final Color? backgroundColor;

  const CustomButton({required this.buttonChild, required this.onTap, this.height, this.borderRadius, this.backgroundColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??50,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Colors.red,
          ),
          overlayColor: MaterialStatePropertyAll(
            Colors.white.withOpacity(.1),
          ),
          shape: MaterialStatePropertyAll<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius??30)
            ),
          ),
        ),
        onPressed: onTap,
        child: Align(
          alignment: Alignment.center,
          child: buttonChild,
        ),
      ),
    );
  }
}
