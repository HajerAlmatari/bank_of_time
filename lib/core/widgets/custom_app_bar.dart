import 'package:bank_off_time/core/widgets/welcome_container.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool showBack;
  const CustomAppBar({this.showBack = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WelcomeContainer(showBack: showBack,),
        Icon(Icons.menu, color: Theme.of(context).colorScheme.primary, size: 40,)
      ],
    );
  }
}
