class EventModel {
  String? eventId;
  String eventName;
  String location;
  String timig;
  String imageUrl;
  String joinfee;
  String eventHoster;

  EventModel(
      {required this.joinfee,
      this.eventId,
      required this.eventHoster,
      required this.eventName,
      required this.imageUrl,
      required this.location,
      required this.timig});

  Map<String, dynamic> toJson(id) => {
        "eventId": id,
        "eventHoster":eventHoster,
        "joinfee": joinfee,
        "eventName": eventName,
        "location": location,
        "timig": timig,
        "imageUrl": imageUrl,
      };

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      eventHoster:json["eventHoster"],
        joinfee: json["joinfee"],
        eventId: json["eventId"],
        eventName: json["eventName"],
        imageUrl: json["imageUrl"],
        location: json["location"],
        timig: json["timig"]);
  }
}
