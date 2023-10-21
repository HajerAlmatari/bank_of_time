import 'package:flutter/material.dart';

class ChangeLanguageButton extends StatelessWidget {
  final bool selected;
  final String text;
  final int value;
  final int groupValue;
  final void Function(int?)? onChange;

  const ChangeLanguageButton({
    required this.selected,
    required this.text,
    required this.value,
    required this.groupValue,
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: selected ? Theme.of(context).colorScheme.primary : null,
        border: selected ? null : Border.all(color: Theme.of(context).colorScheme.primary)
      ),
      child: RadioListTile.adaptive(
        title: Text(text, style: TextStyle(color: selected ? Colors.white : Colors.black),),
        value: value,
        groupValue: groupValue,
        onChanged: onChange,
        activeColor: Colors.white,
      ),
    );

    //   ElevatedButton(
    //   onPressed: () {
    //
    //   },
    //   style: ButtonStyle(
    //     shape: MaterialStatePropertyAll<OutlinedBorder>(
    //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
    //     ),
    //     backgroundColor: selected ? MaterialStatePropertyAll<Color>(Theme.of(context).colorScheme.primary) : null,
    //   ),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       Radio.adaptive(
    //         value: value,
    //         groupValue: groupValue,
    //         onChanged: onChange,
    //         activeColor: Colors.white,
    //       ),
    //       Text(
    //         text,
    //         style: TextStyle(color: selected ? Colors.white : Theme.of(context).colorScheme.primary),
    //       ),
    //     ],
    //   ),
    // );
  }
}
