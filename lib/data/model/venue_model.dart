class VenueModel {
  String venueName;
  String imageUrl;
  String location;
  String timing;
  double price;
  String? venueID;
  String description;

  VenueModel(
      {required this.price,
      required this.description,
      required this.imageUrl,
      required this.location,
      required this.timing,
       this.venueID,
      required this.venueName});

  Map<String, dynamic> toJson(id) => {
        "description": description,
        "venueName": venueName,
        "imageUrl": imageUrl,
        "location": location,
        "timing": timing,
        "price": price,
        "venueID": id
      };

  factory VenueModel.fromJosn(Map<String, dynamic> json) {
    return VenueModel(
        price: json["price"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        location: json["location"],
        timing: json["timing"],
        venueID: json["venueID"],
        venueName: json["venueName"]);
  }
}
