//collection
class UserModel {
  String name;
  String email;
  String phone;
  String? imageUrl;
  String? id;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    this.imageUrl,
    this.id,
  });


  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "id": id,
        "phone": phone,
        "imageUrl": imageUrl,
      };

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      name: data["name"],
      email: data["email"],
      phone: data["phone"],
      imageUrl: data["imageUrl"],
      id: data["id"],
    );
  }
}