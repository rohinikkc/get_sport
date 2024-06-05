import 'package:flutter/material.dart';

class AcadamyModel{
  String? acadamyName;
  String? image;
  String? location;
  String? sportsClass;
  TimeOfDay? time;
  String? id;

  AcadamyModel({
    required this.acadamyName,
    required this.image,
    required this.location,
    required this.sportsClass,
    required this.time,
    required this.id
  });

  Map<String, dynamic> toMap() => {
        "acadamyName": acadamyName,
        "image": image,
        "location": location,
        "sportsClass": sportsClass,
        "time": time,
        "id": id
      };

  factory AcadamyModel.fromMap(Map<String, dynamic> data) {
    return AcadamyModel(
      acadamyName: data["acadamyName"],
      image: data["image"],
      location: data["location"],
      sportsClass: data["sportsClass"],
      time: data["time"],
      id: data["id"],
    );
  }

}