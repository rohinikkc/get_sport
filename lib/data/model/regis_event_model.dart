class RegEventModel {
  String regId;
  String name;
  String teamName;
  String location;
  String phoneNumber;
  RegEventModel(
      {required this.location,
      required this.name,
      required this.phoneNumber,
      required this.regId,
      required this.teamName});

  Map<String, dynamic> toJosn(id) => {
        "regId": id,
        "name": name,
        "teamName": teamName,
        "location": location,
        "phoneNumber": phoneNumber
      };

  factory RegEventModel.fromJson(Map<String, dynamic> json) {
    return RegEventModel(
        location: json["location"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        regId: json["regId"],
        teamName: json["teamName"]);
  }
}
