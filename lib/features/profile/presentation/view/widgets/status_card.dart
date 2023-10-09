import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final Function(bool?)? onChange;
  final bool value;
  final bool bottomBorder;
  const StatusCard({required this.title, required this.onChange, required this.value, required this.bottomBorder, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: bottomBorder ? const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffe0dfdf)
          )
        )
      ) : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary, fontSize: 20),),
          Switch.adaptive(
              value: value,
              onChanged: onChange,
          ),
        ],
      ),
    );
  }
}
