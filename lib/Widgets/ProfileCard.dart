import 'package:flutter/material.dart';
import 'package:patient/main.dart';
class ProfileCard extends StatelessWidget {
  String? title1;
  Icon? leading1;
  String? subtitle1;
   ProfileCard(this.title1,this.leading1,this.subtitle1);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: Color(0xffCDE0C9),
        title: Text(title1!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
        subtitle: Text(subtitle1!),
        leading: leading1,
        dense: true,
      ),
    );
  }
}
