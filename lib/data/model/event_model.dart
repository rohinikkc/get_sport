import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String? eventId;
  String eventName;
  String location;
  String time;
  String imageUrl;
  String joinfee;
  String eventHoster;
  String hosterId;
  double lat;
  double lon;
  Timestamp? timestamp;
  String type;
  int targetPartipent;

  EventModel(
      {required this.joinfee,
      this.eventId,
      required this.targetPartipent,
      required this.type,
      this.timestamp,
      required this.lat,
      required this.lon,
      required this.hosterId,
      required this.eventHoster,
      required this.eventName,
      required this.imageUrl,
      required this.location,
      required this.time});

  Map<String, dynamic> toJson(id) => {
        "eventId": id,
        "type": type,
        "targetPartipent": targetPartipent,
        "timestamp": Timestamp.now(),
        "lat": lat,
        "lon": lon,
        "hosterId": hosterId,
        "eventHoster": eventHoster,
        "joinfee": joinfee,
        "eventName": eventName,
        "location": location,
        "time": time,
        "imageUrl": imageUrl,
      };

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
        targetPartipent: json["targetPartipent"],
        type: json["type"],
        lon: json["lon"],
        timestamp: json["timestamp"],
        lat: json["lat"],
        hosterId: json["hosterId"],
        eventHoster: json["eventHoster"],
        joinfee: json["joinfee"],
        eventId: json["eventId"],
        eventName: json["eventName"],
        imageUrl: json["imageUrl"],
        location: json["location"],
        time: json["time"]);
  }
}
