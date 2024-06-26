import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AcadamyModel {
  String? acadamyName;
  String? image;
  String? location;
  String? sportsClass;
  String? fromTime;
  String? toTime;
  String? id;
  String email;
  double lat;
  double lon;
  Timestamp? timestamp;

  AcadamyModel(
      {required this.acadamyName,
      required this.image,
      required this.email,
      required this.lat,
      required this.lon,
      this.timestamp,
      required this.location,
      required this.sportsClass,
      required this.fromTime,
      required this.toTime,
      required this.id});

  Map<String, dynamic> toMap() => {
        "email": email,
        "lat":lat,
        "lon":lon,
        "timestamp":timestamp,
        "acadamyName": acadamyName,
        "image": image,
        "location": location,
        "sportsClass": sportsClass,
        "fromTime": fromTime,
        "id": id,
        "toTime": toTime
      };

  factory AcadamyModel.fromMap(Map<String, dynamic> data) {
    return AcadamyModel(
     lat: data["lat"],
     lon: data["lon"],  
      timestamp:data["timestamp"],
      email: data["email"],
      acadamyName: data["acadamyName"],
      image: data["image"],
      location: data["location"],
      sportsClass: data["sportsClass"],
      fromTime: data["fromTime"],
      toTime: data["toTime"],
      id: data["id"],
    );
  }
}
