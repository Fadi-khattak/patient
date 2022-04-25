import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Views/Dashboard.dart';

class RequestSent extends StatefulWidget {
  const RequestSent({Key? key}) : super(key: key);

  @override
  State<RequestSent> createState() => _RequestSentState();
}

class _RequestSentState extends State<RequestSent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 3500), _toDashboard);
  }
  _toDashboard()
  {
    Get.off(()=>Dashboard());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.25,
              width: MediaQuery.of(context).size.width*0.25,
              decoration:const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/check.gif"),
                  fit: BoxFit.cover
                )
              ),
            ),
            Container(
              child: Text(
                "Appointment request sent",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
