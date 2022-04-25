import 'package:flutter/material.dart';

class SignupFields extends StatefulWidget {
  String hint;
  var controller;

  SignupFields({required  this.hint,required  this.controller});

  @override
  State<SignupFields> createState() => _SignupFieldsState();
}

class _SignupFieldsState extends State<SignupFields> {
  Color _mainColor= Color(0xff68B280);

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
          controller: widget.controller,

          decoration: InputDecoration(
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
