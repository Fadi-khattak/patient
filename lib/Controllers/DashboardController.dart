
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:patient/Models/PatientModel.dart';
import 'package:patient/Models/PhysicianModel.dart';

class DashboardController extends GetxController
{
  var isLoading=false.obs;
  var physician=<PhysicianModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _loadList();
  }
  Future _loadList()async
  {
    List<PhysicianModel> temp=[];
    try{
      isLoading.value=true;
      final ref=FirebaseDatabase.instance.ref("physician");
      var data=await ref.once();
      for(DataSnapshot snapshot in data.snapshot.children)
        {
          print(jsonEncode(snapshot.value));
          temp.add(physicianModelFromJson(jsonEncode(snapshot.value)));
        }
      physician.value=temp;
      isLoading.value=false;
    }catch(e)
    {
      isLoading.value=false;
      Get.snackbar("Error", e.toString());
    }
  }
}