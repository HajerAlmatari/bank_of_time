import 'package:bank_off_time/features/profile/presentation/view/widgets/account_info_form.dart';
import 'package:bank_off_time/features/profile/presentation/view/widgets/account_info_view_header.dart';
import 'package:flutter/material.dart';

class AccountInfoView extends StatelessWidget {
  const AccountInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        // color: Colors.white,
        child: Column(
          children: [
            AccountInfoViewHeader(),
            AccountInfoForm(),
          ],
        ),
      ),
    );
  }
}
