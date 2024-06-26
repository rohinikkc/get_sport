import 'package:cloud_firestore/cloud_firestore.dart';

class VenueModel {
  String venueName;
  String imageUrl;
  String location;
  String timing;
  double price;
  String? venueID;
  String description;
  String sponserId;
  Timestamp? timestamp;
  double lat;
  double lon;
  String type;
  num rating;
  VenueModel(
      {required this.price,
      required this.description,
      required this.imageUrl,
      required this.rating,
      required this.lat,
      required this.type,
      required this.lon,
      this.timestamp,
      required this.location,
      required this.timing,
      this.venueID,
      required this.sponserId,
      required this.venueName});

  Map<String, dynamic> toJson(id) => {
        "description": description,
        "type":type,"rating":rating,
        "venueName": venueName,
        "imageUrl": imageUrl,
        "location": location,
        "timing": timing,
        "price": price,
        "venueID": id,
        "sponserId": sponserId,
        "timestamp": Timestamp.now(),
        "lon": lon,
        "lat": lat,
      };

  factory VenueModel.fromJosn(Map<String, dynamic> json) {
    return VenueModel(
      rating:json["rating"],
      type:json["type"],
        lat: json["lat"],
        lon: json["lon"],
        timestamp: json["timestamp"],
        sponserId: json["sponserId"],
        price: json["price"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        location: json["location"],
        timing: json["timing"],
        venueID: json["venueID"],
        venueName: json["venueName"]);
  }
}
