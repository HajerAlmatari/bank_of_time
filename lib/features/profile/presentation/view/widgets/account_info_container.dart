import 'package:flutter/material.dart';

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
        child: const Padding(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: TextStyle(color: Colors.black,fontSize: 17),
                child: Text("Mohammed Al-Haddad",),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal : 20.0,  vertical : 10.0),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
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
                      Icon(Icons.language, size: 25,),
                      SizedBox(height: 7,),
                      DefaultTextStyle(
                        style: TextStyle(color: Colors.black,fontSize: 17),
                        child: Text("English",),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.location_on_outlined, size: 25,),
                      SizedBox(height: 7,),
                      DefaultTextStyle(
                        style: TextStyle(color: Colors.black,fontSize: 17),
                        child: Text("Riyadh",),
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
