import 'package:bank_off_time/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(showBack: true,),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.volunteer_activism_outlined, size: 60,),
                        SizedBox(width: 20,),
                        Text("Support", style: TextStyle(fontSize: 40),)
                      ],
                    ),
                    SizedBox(height: 50,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("TALK TO US", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                        Text("+966 55 444 3333", style: TextStyle(fontSize: 15),),
                        Text("+966 55 444 3333", style: TextStyle(fontSize: 15),),
                        Text("info@bot.com", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
