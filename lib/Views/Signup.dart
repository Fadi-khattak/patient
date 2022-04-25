import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patient/Controllers/LoginController.dart';
import 'package:patient/Controllers/SignupController.dart';
import 'package:patient/Views/LoadingScreen.dart';
import 'package:patient/Widgets/LoginFields.dart';
import 'package:patient/Widgets/SignupFields.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _txtEmail=TextEditingController();
  final _txtName=TextEditingController();
  final _txtPass=TextEditingController();
  final _txtConfirm=TextEditingController();
  bool validEmail=false;
  Color _mainColor= Color(0xff68B280);
  bool ispassVisible=false;
  Color _btnColor2= Color(0xff329D9C);
 var _c=Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return GetX<SignupController>(
      builder: (controler) {
        if(controler.isLoading.isTrue)
          return LoadingScreen();
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _logo(context),
                LoginFields(hint: "Email", ispass: false, controller: _txtEmail),
                SignupFields(hint: "Name", controller: _txtName),
                LoginFields(hint: "Password", ispass: true, controller: _txtPass),
                LoginFields(hint: "confirm password", ispass: true, controller: _txtConfirm),
                SizedBox(height: 20,),
                _LoginButton(context,controler)
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _logo(BuildContext context)
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal:10),
      height: MediaQuery.of(context).size.height*0.2,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/logo.png")
          )
      ),
    );
  }

  Widget _LoginButton(BuildContext context,SignupController controler)
  {
    var shape=RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
    return Material(
      elevation: 10,
      shape: shape,
      shadowColor: _mainColor,
      child: GestureDetector(
        onTap: ()async{
          controler.createAccount(_txtEmail.text, _txtPass.text, _txtName.text);
        },
        child: Container(
          width: MediaQuery.of(context).size.width*0.7,
          height: 70,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // _btnColor1,
                _mainColor,
                _btnColor2,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              "Sign up".toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ),
    );
  }


}
