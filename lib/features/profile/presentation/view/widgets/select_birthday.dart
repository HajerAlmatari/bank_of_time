
import 'package:bank_off_time/features/profile/presentation/view/widgets/account_info_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final birthDayProvider = StateProvider<String>((ref) {
  return "4 Oct 1995";
});

class SelectBirthday extends ConsumerWidget {
  const SelectBirthday({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String birthDay = ref.watch(birthDayProvider);
    return AccountInfoTextField(
      hintText: "Birth Day",
      text: birthDay,
      readOnly: true,
      onTap: () async {
        DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1800),
            lastDate: DateTime(3000));
        if (date != null) {
          ref.read(birthDayProvider.notifier).update((state) => DateFormat('d MMM y').format(date));
        }
      },
    );
  }
}
