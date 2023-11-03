import 'dart:math';

import 'package:flutter/material.dart';


class DisplayView extends StatelessWidget {
  const DisplayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: WhatsappAppbar(
                  screenWidth: MediaQuery.of(context).size.width,
                  screenHeight: MediaQuery.of(context).size.height,
              ),
              pinned: true,
            ),
            const SliverToBoxAdapter(
              child: Column(
                children:  [PhoneAndName(), ProfileIconButtons()],
              ),
            ),
            const WhatsappProfileBody()
          ],
        ),
      ),
    );
  }
}

class WhatsappAppbar extends SliverPersistentHeaderDelegate {
  double screenWidth;
  double screenHeight;
  Tween<double>? profilePicTranslateTween;

  WhatsappAppbar({
    required this.screenWidth,
    required this.screenHeight,

  }) {
    profilePicTranslateTween =
        Tween<double>(begin: screenWidth / 2  + 60, end: 18.0);
  }
  static final appBarColorTween = ColorTween(begin: Colors.black, end: Colors.grey);

  static final containerColorTween = ColorTween(begin: Colors.black, end: Colors.white);

  static final phoneNumberTranslateTween = Tween<double>(begin: 20.0, end: 0.0);

  static final phoneNumberFontSizeTween = Tween<double>(begin: 20.0, end: 16.0);

  static final profileImageRadiusTween = Tween<double>(begin: 5.5, end: 1.0);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final relativeScroll = min(shrinkOffset, 45) / 45;
    final relativeScroll70px = min(shrinkOffset, 70) / 70;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/custom-app-bar-background-top.png")
        )
      ),
      child: Stack(
        children: [
          Stack(
            children: [
              Positioned(
                  top: 15,
                  left: 90,
                  child: displayPhoneNumber(relativeScroll70px)),
              Positioned(
                  top: 10,
                  right: profilePicTranslateTween!.transform(relativeScroll70px),
                  child: displayProfilePicture(relativeScroll70px)),
            ],
          ),
        ],
      ),
    );
  }

  Widget displayProfilePicture(double relativeFullScrollOffset) {
    return Transform(
      transform: Matrix4.identity()
        ..scale(
          profileImageRadiusTween.transform(relativeFullScrollOffset),
        ),
      child: const CircleAvatar(
        backgroundImage: AssetImage(
            "assets/images/avatar1.png"),
      ),
    );
  }

  Widget displayPhoneNumber(double relativeFullScrollOffset) {
    if (relativeFullScrollOffset >= 0.8) {
      return Transform(
        transform: Matrix4.identity()
          ..translate(
            0.0,
            phoneNumberTranslateTween
                .transform((relativeFullScrollOffset - 0.8) * 5),
          ),
        child: Text(
          "+3 3333333333",
          style: TextStyle(
            fontSize: phoneNumberFontSizeTween
                .transform((relativeFullScrollOffset - 0.8) * 5),
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  double get maxExtent => 225;

  @override
  double get minExtent => 130;

  @override
  bool shouldRebuild(WhatsappAppbar oldDelegate) {
    return true;
  }
}

class WhatsappProfileBody extends StatelessWidget {
  const WhatsappProfileBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate(const [
          SizedBox(height: 20),
          ListTile(
            title: Text("Custom Notifications"),
            leading: Icon(Icons.notification_add),
          ),
          ListTile(
            title: Text("Disappearing messages"),
            leading: Icon(Icons.message),
          ),
          ListTile(
            title: Text("Mute Notifications"),
            leading: Icon(Icons.mic_off),
          ),
          ListTile(
            title: Text("Media visibility"),
            leading: Icon(Icons.save),
          ),
          // to fill up the rest of the space to enable scrolling
          SizedBox(
            height: 550,
          ),
        ]));
  }
}

class ProfileIconButtons extends StatelessWidget {
  const ProfileIconButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Column(
          children:  [
            Icon(
              Icons.call,
              size: 30,
              color: Color.fromARGB(255, 8, 141, 125),
            ),
            SizedBox(height: 5),
            Text(
              "Call",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 8, 141, 125),
              ),
            )
          ],
        ),
         SizedBox(width: 20),
        Column(
          children:  [
            Icon(
              Icons.video_call,
              size: 30,
              color: Color.fromARGB(255, 8, 141, 125),
            ),
            SizedBox(height: 5),
            Text(
              "Video",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 8, 141, 125),
              ),
            )
          ],
        ),
        SizedBox(width: 20),
        Column(
          children:  [
            Icon(
              Icons.save,
              size: 30,
              color: Color.fromARGB(255, 8, 141, 125),
            ),
            SizedBox(height: 5),
            Text(
              "Save",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 8, 141, 125),
              ),
            )
          ],
        ),
         SizedBox(width: 20),
        Column(
          children:  [
            Icon(
              Icons.search,
              size: 30,
              color: Color.fromARGB(255, 8, 141, 125),
            ),
            SizedBox(height: 5),
            Text(
              "Search",
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 8, 141, 125),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class PhoneAndName extends StatelessWidget {
  const PhoneAndName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children:  [
        SizedBox(height: 35),
        Text(
          "+3 3333333333",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "~Walter Hartwell White",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}