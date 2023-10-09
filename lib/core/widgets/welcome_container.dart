import 'package:flutter/material.dart';

class WelcomeContainer extends StatelessWidget {
  final bool showBack;

  const WelcomeContainer({required this.showBack, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showBack
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : Container(),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            "assets/images/avatar1.png",
            height: 70,
            width: 70,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "hello Mohammed!",
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
            ),
            Text(
              "you are currently offline",
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  "your time balance is",
                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                ),
                Text(
                  "149.969 h",
                  style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      color: Colors.indigo),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
