import 'package:bank_off_time/core/widgets/custom_button.dart';
import 'package:bank_off_time/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageModal extends ConsumerWidget {
  const LanguageModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final provider = ref.watch(mainProvider);
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(buttonChild: const Text("d"), onTap: (){
            ref.read(mainProvider.notifier).setLocale("en");
          })
        ],
      ),
      // color: Colors.red,
    );
  }
}
