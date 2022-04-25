import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Controllers/DashboardController.dart';
import 'package:patient/Models/PhysicianModel.dart';
import 'package:patient/Views/Book_Appointment.dart';
import 'package:patient/Views/Drawer/MyDrawer.dart';
import 'package:patient/Views/LoadingScreen.dart';
import 'package:patient/Views/Physician_Profile.dart';

class Dashboard extends StatelessWidget {
  var _textColor = const Color(0xff205072);

  var lightGreen = Color(0xffCDE0C9);
  Color mainColor = Color(0xff68B280);
  var _c=Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightGreen,
        toolbarHeight: 100,
        elevation: 0,
        title: SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration:  InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: (){
                    }, icon: Icon(Icons.search)),
                    hintText: "search",
                    filled: true,
                    fillColor: Colors.green.shade900.withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: MyDrawer(),
      body: GetX<DashboardController>(
        builder: (controller) {
          if(controller.isLoading.isTrue)
            return LoadingScreen();
          return Padding(
            padding: EdgeInsets.only(top: 2),
            child: ListView.builder(
              itemCount: controller.physician.length,
              itemBuilder:(context,index){
                return roomPatientCard(controller.physician[index]);
              },
            ),
          );
        }
      ),
    );
  }
  Widget roomPatientCard(PhysicianModel model) {
    return Card(
      color: lightGreen,
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: (){
          Get.to(()=>Physician_Profile(model));
        },
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_forward_ios_sharp),
          ],
        ),
        leading:  Column(
          children: [
             SizedBox(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(model.pic),
                )),

          ],
        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        title:  Text(
          model.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          children: [
            SizedBox(height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text("Specialization",style: TextStyle(fontSize: 15),),
            ),
            Row(
              children: [
                Expanded(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        Get.to(()=>BookAppointment(model));
                      },
                      child: const Text("Book Appointment", style: TextStyle(color: Colors.white)),
                      color: mainColor,
                    )),
                const SizedBox(width: 10),
              ],
            ),
          ],
        )
      ),
    );
  }
}
