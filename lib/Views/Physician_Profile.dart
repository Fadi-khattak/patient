import 'package:flutter/material.dart';
import 'package:patient/Models/PhysicianModel.dart';
import 'package:patient/Widgets/ProfileCard.dart';


class Physician_Profile extends StatelessWidget {
  PhysicianModel _model;
   Physician_Profile(this._model);


  @override
  Widget build(BuildContext context) {
    var details=[_model.timming.a,_model.timming.b,_model.timming.c,_model.timming.d,_model.timming.e,_model.timming.f,_model.timming.g];
    return Scaffold(
      backgroundColor: Color(0xffCDE0C9),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffCDE0C9),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height:40),
          Center(child: Container(
            height: 150,
            width: 150,
            decoration:BoxDecoration( color: Colors.white,boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(100)),
                image: DecorationImage(image: NetworkImage(_model.pic,
               ),
                  fit: BoxFit.fill
                )
            ),
          ),
          ),
          SizedBox(height:30),
          Center(child: Text(_model.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),),
          SizedBox(height:40),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileCard("Education",Icon(Icons.menu_book),"Total Education of Doctor"),
                  ProfileCard("Specialist", Icon(Icons.folder_special_outlined), "Special field of Doctor"),
                  ProfileCard("Experience", Icon(Icons.pageview), "Experience of Doctor"),
                  ProfileCard("Details", Icon(Icons.sticky_note_2_outlined), "Details of Doctor"),
                  SizedBox(height: 20),
                  Card(
                    color: Color(0xffCDE0C9),
                    child:
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10),
                          ),

                        ),

                        child:
                        Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children :[
                                    Text("Days",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text("Timmings",style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],),
                              ),
                              Container(
                                height: 220,
                                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
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
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
