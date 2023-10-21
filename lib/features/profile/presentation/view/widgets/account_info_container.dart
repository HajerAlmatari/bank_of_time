import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountInfoContainer extends StatelessWidget {
  const AccountInfoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (MediaQuery.of(context).size.height / 3.5) / 2,
      left: MediaQuery.of(context).size.width * .10,
      child: Container(
        width: MediaQuery.of(context).size.width * .80,
        height: 240,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ]),
        child:  Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const DefaultTextStyle(
                style: TextStyle(color: Colors.black,fontSize: 17),
                child: Text("Sara", textAlign: TextAlign.center,),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal : 20.0,  vertical : 10.0),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    children: [
                      Icon(Icons.volunteer_activism_outlined, size: 25, color: Colors.indigo),
                      SizedBox(height: 7,),
                      DefaultTextStyle(
                        style: TextStyle(color: Colors.indigo,fontSize: 17,),
                        child: Text("149.9 h",),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.language, size: 25,),
                      const SizedBox(height: 7,),
                      DefaultTextStyle(
                        style: const TextStyle(color: Colors.black,fontSize: 17),
                        child: Text(AppLocalizations.of(context)!.english,),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 25,),
                      const SizedBox(height: 7,),
                      DefaultTextStyle(
                        style: const TextStyle(color: Colors.black,fontSize: 17),
                        child: Text(AppLocalizations.of(context)!.riyadh,),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
