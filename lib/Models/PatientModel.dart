// To parse this JSON data, do
//
//     final patientModel = patientModelFromJson(jsonString);

import 'dart:convert';

PatientModel patientModelFromJson(String str) => PatientModel.fromJson(json.decode(str));

String patientModelToJson(PatientModel data) => json.encode(data.toJson());

class PatientModel {
  PatientModel({
    required this.name,
    required this.id,
    required this.pic,
  });

  String name;
  String id;
  String pic;

  factory PatientModel.fromJson(Map<String, dynamic> json) => PatientModel(
    name: json["name"],
    id: json["id"],
    pic: json["pic"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "pic": pic,
  };
}
