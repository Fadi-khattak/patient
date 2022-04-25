import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Controllers/AppointmentController.dart';
import 'package:patient/Views/Drawer/chatScreen.dart';
import 'package:patient/Views/LoadingScreen.dart';

class MyAppointments extends StatelessWidget {
  var _c=Get.put(AppointmentController());
  var _lightGreen = Color(0xffCDE0C9);
  @override
  Widget build(BuildContext context) {
    return GetX<AppointmentController>(
      builder: (controller) {
        if(controller.isLoading.isTrue)
          return LoadingScreen();
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: _lightGreen,
            title: Text("Appointment",style: TextStyle(color: Colors.black),),

          ),

          body:Container(
            child: ListView.builder(
                itemCount: controller.roomPatient.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 125,

                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: BoxDecoration(
                      color: _lightGreen,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 4,
                          blurRadius: 4,

                        ),
                      ],
                    ),
                    child: Row(
                      children :[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  color: Colors.white,
                                  image: DecorationImage(image: NetworkImage(controller.roomPatient[index].physician.pic,),
                                    fit: BoxFit.fill,
                                  ),

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: Offset(0, 2), // changes position of shadow
                                    ),
                                  ],
                                )
                            ),
                            SizedBox(height: 10),
                            Text(controller.roomPatient[index].physician.status == 0 ? "offline" : "online"),


                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            Text(controller.roomPatient[index].physician.name,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),
                            SizedBox(height: 10,),
                            Text(" Specialist",style: TextStyle(color: Colors.grey),),

                          ],
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: (){
                                  Get.to(()=>ChatScreen(controller.roomPatient[index].physician));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 20),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.7),
                                        spreadRadius: 1,
                                        blurRadius: 1
                                      )
                                    ]
                                  ),
                                    child: Center(child: Icon(CupertinoIcons.chat_bubble_2_fill,color: Colors.green,)),
                                ),
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  );
                }),
          ),
        );
      }
    );
  }
}