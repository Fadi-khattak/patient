import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginFields extends StatefulWidget {
  String hint;
  bool ispass;
  var controller;

  LoginFields({required this.hint, required this.ispass, required this.controller});

  @override
  State<LoginFields> createState() => _LoginFieldsState();
}

class _LoginFieldsState extends State<LoginFields> {
  Color _mainColor= Color(0xff68B280);

  bool validEmail=false;

  bool ispassVisible=false;

  @override
  Widget build(BuildContext context) {
      var shape=RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width*0.8,
        child: Material(
          color: Colors.white,
          elevation: 10,
          shape: shape,
          shadowColor: _mainColor,
          child: TextField(
            onChanged: widget.hint.toLowerCase()!="email"? (val){}:(value){
              String p=r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
              RegExp regExp = new RegExp(p);
              if(regExp.hasMatch(value))
              {
                validEmail=true;
              }
              else {
                validEmail = false;
                print(value);
              }
              setState(() {

              });
            },
            obscureText: widget.ispass,
            controller: widget.controller,

            decoration: InputDecoration(
                suffixIcon: widget.hint.toLowerCase()=="email" ?Icon(Icons.check_circle ,color: validEmail ? _mainColor: Colors.grey.withOpacity(0.7),size: 30,) : IconButton(onPressed: (){
                  if(widget.ispass)
                    widget.ispass=false;
                  else
                    widget.ispass=true;
                  setState(() {
                  });
                },icon: Icon(widget.ispass?CupertinoIcons.eye_slash : CupertinoIcons.eye,color: Colors.grey.withOpacity(0.7),size: 30,)),
                contentPadding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                        style: BorderStyle.none
                    )
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                        style: BorderStyle.none
                    )
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                        style: BorderStyle.none
                    )
                ),
                hintText: widget.hint,
                filled: true,
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7))
            ),
          ),
        ),
      );

  }
}
