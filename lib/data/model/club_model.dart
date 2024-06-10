class ClubModel {
  String id;
  String regId;
  String email;
  String name;
  String clubImage;
  String location;

  ClubModel(
      {required this.regId,
      required this.clubImage,
      required this.email,
      required this.id,
      required this.name,
      required this.location,
      required});

  Map<String, dynamic> toJosn() => {
        "id": id,
        "regId": regId,
        "email": email,
        "name": name,
        "location":location,
        "clubImage": clubImage
      };

  factory ClubModel.fromJosn(Map<String, dynamic> json) {
    return ClubModel(
        regId: json["regId"],
        location:json["location"],
        clubImage: json["clubImage"],
        email: json["email"],
        id: json["id"],
        name: json["name"]);
  }
}
