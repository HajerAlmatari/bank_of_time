import 'package:flutter/material.dart';

class VolunteerSectionsListViewItem extends StatelessWidget {
  final String title;
  final String imageName;
  const VolunteerSectionsListViewItem({
    required this.title,
    required this.imageName,

    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const  EdgeInsets.all(5.0),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: (){},
                child: Image.asset(imageName, height: 150, fit: BoxFit.cover,),
              ),
            ),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold,),),
          ],
        ),
      ),
    );
  }
}
