import 'package:bank_off_time/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sectionCategoryDetailsViewModel =
ChangeNotifierProvider<SectionCategoryDetailsViewModel>((ref) {
  return SectionCategoryDetailsViewModel(ref);
});


class SectionCategoryDetailsViewModel with ChangeNotifier{

  final ChangeNotifierProviderRef ref;

  SectionCategoryDetailsViewModel(this.ref);

  final List<User> usersList = [
    User(
      id: 1,
      name: "Hajer Mohammed",
      email: "hajer.almatari@gmail.com",
      username: "Hajer.M.A"
    ),
    User(
        id: 2,
        name: "Mohammed Alhaddad",
        email: "moha@gmail.com",
        username: "moha"
    ),
    User(
        id: 3,
        name: "Test Name",
        email: "test.name@gmail.com",
        username: "test"
    ),
  ];
}