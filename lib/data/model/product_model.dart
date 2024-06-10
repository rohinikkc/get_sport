class ProductModel {
  String name;
  double price;
  String imageUrl;
  double rating;
  String ?productId;

  ProductModel(
      {required this.imageUrl,
      required this.name,
      required this.price,
       this.productId,
      required this.rating});

  Map<String, dynamic> toJson(id) => {
        "name": name,
        "price": price,
        "imageUrl": imageUrl,
        "productId": id,
        "rating": rating
      };

  factory ProductModel.fromJosn(Map<String, dynamic> json) {
    return ProductModel(
        productId: json["productId"],
        rating: json["rating"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        price: json["price"]);
  }
}
