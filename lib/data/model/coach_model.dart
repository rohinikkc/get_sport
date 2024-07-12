class CoachModel {
  String coachId;
  String email;
  String name;
  String profile;
  String location;
  String trainingClass;
  String fromTIme;
  String toTime;
  String description;
  String certificate;

  CoachModel(
      {required this.coachId,
      required this.description,
      required this.email,
      required this.fromTIme,
      required this.location,
      required this.name,
      required this.profile,
      required this.certificate,
      required this.toTime,
      required this.trainingClass});

  Map<String, dynamic> toJosn() => {
        "coachId": coachId,
        "email": email,
        "description": description,
        "fromTIme": fromTIme,
        "location": location,
        "name": name,
        "profile": profile,
        "certificate": certificate,
        "toTime": toTime,
        "trainingClass": trainingClass
      };

  factory CoachModel.fromJson(Map<String, dynamic> json) {
    return CoachModel(
        certificate: json["certificate"],
        description: json["description"],
        coachId: json["coachId"],
        email: json["email"],
        fromTIme: json["fromTIme"],
        location: json["location"],
        name: json["name"],
        profile: json["profile"],
        toTime: json["toTime"],
        trainingClass: json["trainingClass"]);
  }
}
