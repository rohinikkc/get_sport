class VenueModel {
  String venueName;
  String imageUrl;
  String location;
  String timing;
  double price;
  String? venueID;
  String description;
String sponserId;
  VenueModel(
      {required this.price,
      required this.description,
      required this.imageUrl,
      required this.location,
      required this.timing,
       this.venueID,
       required this.sponserId,
      required this.venueName});

  Map<String, dynamic> toJson(id) => {
        "description": description,
        "venueName": venueName,
        "imageUrl": imageUrl,
        "location": location,
        "timing": timing,
        "price": price,
        "venueID": id,"sponserId":sponserId
      };

  factory VenueModel.fromJosn(Map<String, dynamic> json) {
    return VenueModel(
      sponserId:json["sponserId"],
        price: json["price"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        location: json["location"],
        timing: json["timing"],
        venueID: json["venueID"],
        venueName: json["venueName"]);
  }
}
