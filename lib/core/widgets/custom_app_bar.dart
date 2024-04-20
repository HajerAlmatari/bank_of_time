import 'package:bank_off_time/core/widgets/welcome_container.dart';
import 'package:bank_off_time/features/home/features/requests/presentation/views/requests_view.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final bool showBack;
  final bool showMenu;

  const CustomAppBar({this.showBack = false, Key? key, this.showMenu = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WelcomeContainer(
            showBack: showBack,
          ),
          if (showMenu)
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RequestsView()));
              },
              child: Icon(
                Icons.notifications,
                color: Theme.of(context).colorScheme.primary,
                size: 40,
              ),
            ),
        ],
      ),
    );
  }
}
