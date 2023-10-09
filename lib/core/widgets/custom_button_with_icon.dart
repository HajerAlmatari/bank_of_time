import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomButtonWithIcon({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      borderRadius: 10,
      buttonChild: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white,)
        ],
      ),
      onTap: onTap,
    );
  }
}
