
import 'package:flutter/material.dart';

void slideNavigator(BuildContext context, Widget page){
  Navigator.of(context).push(PageRouteBuilder(
      opaque: true,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext context, _, __) {
        return page;
      },
      transitionsBuilder: (_, Animation<double> animation, __, Widget child) {

        return  SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }
  ));
}