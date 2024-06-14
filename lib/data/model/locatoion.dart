class LocationModel {
  double lat;
  double lon;
  String location;
  String? id;
  String type;
  String itemID;

  LocationModel(
      { this.id,
      required this.itemID,
      required this.lat,
      required this.location,
      required this.lon,
      required this.type});

  Map<String, dynamic> toJson(ids) =>
      {"lat": lat,"itemID":itemID, "lon": lon, "location": location, "id": ids, "type": type};

  factory LocationModel.fromjson(Map<String, dynamic> json) {
    return LocationModel(
      itemID:json["itemID"],
        id: json["id"],
        lat: json["lat"],
        location: json["location"],
        lon: json["lon"],
        type: json["type"]);
  }
}
