import 'package:flutter/material.dart';

class AcadamyModel{
  String? acadamyName;
  String? image;
  String? location;
  String? sportsClass;
  String? fromTime;
    String? toTime;
  String? id;
  String email;


  AcadamyModel({
    required this.acadamyName,
    required this.image,
    required this.email,
    required this.location,
    required this.sportsClass,
    required this.fromTime,
    required this.toTime,
    required this.id
  });

  Map<String, dynamic> toMap() => {
    "email":email,
        "acadamyName": acadamyName,
        "image": image,
        "location": location,
        "sportsClass": sportsClass,
        "fromTime": fromTime,
        "id": id,
        "toTime":toTime
      };

  factory AcadamyModel.fromMap(Map<String, dynamic> data) {
    return AcadamyModel(
      email:data["email"],
      acadamyName: data["acadamyName"],
      image: data["image"],
      location: data["location"],
      sportsClass: data["sportsClass"],
      fromTime: data["fromTime"],
      toTime:data["toTime"] ,
      id: data["id"],
    );
  }

}