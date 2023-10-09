import 'package:bank_off_time/core/widgets/custom_app_bar.dart';
import 'package:bank_off_time/features/profile/presentation/view/widgets/status_card.dart';
import 'package:flutter/material.dart';

class StatusView extends StatefulWidget {
  const StatusView({Key? key}) : super(key: key);

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  bool? onlineValue = false;
  bool? availableValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(showBack: true,),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text("Status", style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),),
              ),
              const SizedBox(
                height: 20,
              ),
              StatusCard(
                value: onlineValue!,
                bottomBorder: true,
                title: "online",
                onChange: (value){
                  setState(() {
                    onlineValue = value;
                  });
                },
              ),

              const SizedBox(
                height: 10,
              ),
              StatusCard(
                value: availableValue!,
                bottomBorder: false,
                title: "Available",
                onChange: (value){
                  setState(() {
                    availableValue = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
