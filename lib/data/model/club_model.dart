import 'package:cloud_firestore/cloud_firestore.dart';

class ClubModel {
  String id;
  String regId;
  String email;
  String name;
  String clubImage;
  String location;
  double lat;
  double lon;
  Timestamp ?timestamb;

  ClubModel(
      {required this.regId,
      required this.lat,
      required this.lon,
      required this.clubImage,
      required this.email,
      this.timestamb,
      required this.id,
      required this.name,
      required this.location,
      required});

  Map<String, dynamic> toJosn() => {
        "id": id,
        "lat":lat,
        "lon":lon,
        "timestamb":Timestamp.now(),
        "regId": regId,
        "email": email,
        "name": name,
        "location":location,
        "clubImage": clubImage
      };

  factory ClubModel.fromJosn(Map<String, dynamic> json) {
    return ClubModel(
      lat:json["lat"],
      lon:json["lon"],
      timestamb:json["timestamb"],
        regId: json["regId"],
        location:json["location"],
        clubImage: json["clubImage"],
        email: json["email"],
        id: json["id"],
        name: json["name"]);
  }
}
