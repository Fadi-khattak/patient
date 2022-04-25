import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Models/PatientModel.dart';
import 'package:patient/Models/PhysicianModel.dart';
import 'package:patient/SharedPrefs/Preferences.dart';
import 'package:patient/Views/LoadingScreen.dart';
import 'package:patient/Views/RequestSent.dart';

class BookAppointment extends StatefulWidget {
  PhysicianModel _model;
  BookAppointment(this._model);

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {


  bool isLoading=false;
  final detail=TextEditingController();
  bool isEnabled=false;

  @override
  Widget build(BuildContext context) {
    var details=[widget._model.timming.a,widget._model.timming.b,widget._model.timming.c,widget._model.timming.d,widget._model.timming.e,widget._model.timming.f,widget._model.timming.g];
    return isLoading ? LoadingScreen() : Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xffCDE0C9),
        title: const Text("Appointment Booking",style: TextStyle(color: Colors.black),),
        elevation: 0,
      ),

      body:
      SingleChildScrollView(
        child: Card(
          color: const Color(0xffCDE0C9),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading:
                SizedBox(
                  height: 50,
                    width: 50,
                    child: CircleAvatar(backgroundImage: NetworkImage(widget._model.pic))
                ),
                title: Text(widget._model.name,style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: const Text("Doctor Specialization"),
              ),
              const SizedBox(height: 10,),

             Container(
    decoration: BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10),
    ),
          border: Border.all(color: Colors.grey)
    ),
               margin: const EdgeInsets.symmetric(horizontal: 10),
               child:
               Column(
                   children: [
                     Container(
               margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children :const [
                 Text("Days",style: TextStyle(fontWeight: FontWeight.bold),),
                 Text("Timmings",style: TextStyle(fontWeight: FontWeight.bold),),
               ],),
             ),
              Container(
                height: 107,
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: ListView.builder(
                    itemCount: details.length,
                    itemBuilder: (context, index) {
                  return Container(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children :[
                        Text(details[index].day),
                        Text(details[index].time),
                      ],
                    ),
                  );
                }),
              ),
                 ]
               )
             ),

              const SizedBox(height: 20,),
              Container(

                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration( borderRadius: const BorderRadius.all(Radius.circular(10)
                ),
                  border: Border.all(color: Colors.grey)
                ),
                  child:

                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Reason to Book Appointment : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      Container(


                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(5),
                        child: TextField(
                          onChanged: (val){
                            if(val.length > 20)
                              {
                                isEnabled=true;

                              }
                            else
                              isEnabled=false;
                            setState(() {

                            });

                          },
                          decoration: const InputDecoration(hintText: "Enter your reason for Appointment",
                          border: InputBorder.none),
                          controller: detail,minLines: 1,maxLines: 30,maxLength: 250,),
                      ),
                      const Align(
                          alignment: Alignment.bottomRight,
                          child: Text("maximum 250 characters",style: TextStyle(color: Colors.grey),))
                    ],
                  )
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  child: InkWell(
                    onTap: ()async{
                      if(isEnabled)
                        {
                          await appointmentRequest();
                        }
                      else
                        Get.snackbar("validation", "please enter at least 15 characters as a reason");
                    },
                    child: Container(

                      height: 50,
                      width: MediaQuery.of(context).size.width*0.6,
                      margin:const  EdgeInsets.all(10),
                      padding: EdgeInsets.all(3),
                      decoration:  BoxDecoration( borderRadius: BorderRadius.all(Radius.circular(10),
                      ),
                        color:!isEnabled ?Colors.grey : Color(0xff329D9C),
                      ),
                      child: const Center(child: Text("Book Appointment",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  Future appointmentRequest()async
  {
    final ref=FirebaseDatabase.instance.ref("appointments");

    try{
      isLoading=true;
      setState(() {});
      var data=await Preferences.getUser();
      PatientModel patient=patientModelFromJson(data);
      await  ref.child(widget._model.id).child(FirebaseAuth.instance.currentUser!.uid).set(
       {
         'name':patient.name,
         'id':patient.id,
         'pic':patient.pic,
         'reason':detail.text
       }
      );
      Get.off(()=>RequestSent());
    isLoading=false;
    setState(() {});
    }catch(e)
    {
      isLoading=false;
      setState(() {});
      Get.snackbar("Error", e.toString());
    }
  }
}
