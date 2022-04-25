
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:patient/Models/PatientModel.dart';
import 'package:patient/SharedPrefs/Preferences.dart';
import 'package:patient/Views/Dashboard.dart';


var model=<PatientModel>[].obs;
class LoginController extends GetxController
{
  var isLoading=false.obs;
  var patient=PatientModel(name: "", id: "", pic: "").obs;

  Future Login(String email,String pass)async
  {
    isLoading.value=true;
    try {
      UserCredential uc = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: email, password: pass);
      if(uc.user!=null)
        {
          final ref=FirebaseDatabase.instance.ref("patient").child(uc.user!.uid);
          var data=await ref.once().timeout(const Duration(seconds: 15),onTimeout: (){
            throw "connection timeout";
          });
          patient.value=patientModelFromJson(jsonEncode(data.snapshot.value));
          await Preferences.setUser(jsonEncode(data.snapshot.value));
          Get.offAll(()=>Dashboard());
        }
    }on FirebaseException catch(e)
    {
      isLoading.value=false;
      Get.snackbar("Error", e.message.toString());
    }
  }
}