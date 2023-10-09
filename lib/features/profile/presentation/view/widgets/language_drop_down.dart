import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedLanguageProvider = StateProvider<String>((ref) {
  return "English";
});

List<String> language = ["Arabic", "English"];

class LanguageDropDown extends ConsumerWidget {
  const LanguageDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(selectedLanguageProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: DropdownButtonFormField(
        value: selectedLanguage,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 1,
            ),
          ),
          labelText: "Language",
        ),
        items: language.map((String val) {
          return DropdownMenuItem(
            value: val,
            child: Text(val),
          );
        }).toList(),
        onChanged: (value) {
          ref.read(selectedLanguageProvider.notifier).update((state) => value!);
        },
      ),
    );
  }
}
