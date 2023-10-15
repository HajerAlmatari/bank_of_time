import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 5),
          borderRadius: BorderRadius.circular(
            100,
          )),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_logo.PNG",
              width: 80,
              height: 80,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 4,
                  ),
                ),
              ),
              child: Text(
                "BOT",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: "AlfaSlabOne-Regular",
                  fontSize: 30,
                ),
              ),
            ),
            const Text(
              "Bank of Time",
              style: TextStyle(
                  color: Color(0xff03118c),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
