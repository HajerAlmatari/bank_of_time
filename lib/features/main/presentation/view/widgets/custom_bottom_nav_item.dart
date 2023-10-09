import 'package:flutter/material.dart';

class CustomBottomNavItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final IconData iconData;

  const CustomBottomNavItem({
    required this.index,
    required this.currentIndex,
    required this.iconData,
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        SizedBox(
          width: screenWidth * .2950,
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              height: index == currentIndex ? screenWidth * .10 : 0,
              width: index == currentIndex ? screenWidth * .2125 : 0,
              decoration: BoxDecoration(
                color: index == currentIndex
                    ? Theme.of(context).colorScheme.primary.withOpacity(.2)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
        Container(
          width: screenWidth * .2950,
          alignment: Alignment.center,
          child: Icon(
            iconData,
            // listOfIcons[index],
            size: screenWidth * .076,
            color: index == currentIndex
                ? Theme.of(context).colorScheme.primary
                : Colors.black26,
          ),
        ),
      ],
    );
  }
}
