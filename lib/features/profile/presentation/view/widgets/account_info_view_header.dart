import 'package:bank_off_time/features/profile/presentation/view/widgets/account_info_container.dart';
import 'package:flutter/material.dart';

class AccountInfoViewHeader extends StatelessWidget {
  const AccountInfoViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3.5,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.6),
                    Theme.of(context).colorScheme.primary,
                  ],
                )),
          ),
          const AccountInfoContainer(),
          Positioned(
            top: (MediaQuery.of(context).size.height / 3.5) / 4,
            left: (MediaQuery.of(context).size.width / 2) - 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/avatar1.png",
                    ),
                  ),
                ),
                height: 130,
                width: 130,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
