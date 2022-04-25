import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Views/MyAppointments.dart';


class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final ref=FirebaseDatabase.instance.ref("physician");

  var _txtColor = Color(0xff205072);

  int status = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "Hello!",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                        // image: DecorationImage(
                        //   image: SvgPicture.asset("assets/Untitled-1.svg"),
                        //   fit: BoxFit.contain,
                        // ),
                        ),
                  )
                ],
              ),
              _profileItem("assets/Profile.png", "Profile",
                  "Manage your personal profile", () {
                // Get.to(()=>Profile());
              }),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  thickness: 2,
                ),
              ),
              // Container(
              //   margin:
              //       const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Text(
              //         "Availability",
              //         style: TextStyle(
              //             fontSize: 22,
              //             fontWeight: FontWeight.bold,
              //             color: _txtColor),
              //       ),
              //       FlutterSwitch(
              //         height: 30,
              //         width: 60,
              //         value: true,
              //         activeColor: Color(0xff68B280),
              //         showOnOff: false,
              //         onToggle: (val) async{
              //
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              _menuItem("assets/icon-4.png", "Appointments",
                  "check your appointments here", () {
                    Get.to(()=>MyAppointments());
                  }),

              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  thickness: 2,
                ),
              ),
              _heading("Support"),
              _menuItem("assets/icon-4.png", "Help & FAQ's",
                  "Looking for help? Look no further!", () {
                // Get.to(()=>HelpFaqs1());
              }),
              _menuItem("assets/icon-5.png", "About App",
                  "Terms, privacy policy, and more", () {
                // Get.to(()=>AboutWoody());
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _heading(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _profileItem(String image, String title, String subtitle, var ontap) {
    return ListTile(
      onTap: ontap,
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  Widget _menuItem(String image, String title, String subtitle, var ontap) {
    return ListTile(
      onTap: ontap,
      leading: Container(
        height: 50,
        width: 50,
        decoration:  BoxDecoration(
            image: DecorationImage(
                image: AssetImage(image), fit: BoxFit.fill)),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: Color(0xff70c95f),
        ),
      ),
    );
  }
}
