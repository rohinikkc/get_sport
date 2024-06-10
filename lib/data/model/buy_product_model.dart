import 'package:getsport/data/model/product_model.dart';

class BuyProductModel {
  String? id;
  String uid;
  String name;
  String address;
  String mobileNamber;
  ProductModel productModel;

  BuyProductModel(
      { this.id,
      required this.uid,
      required this.address,
      required this.mobileNamber,
      required this.name,
      required this.productModel});

  Map<String, dynamic> toJson(docid) => {
        "id": docid,
        "uid": uid,
        "name": name,
        "address": address,
        "mobileNamber": mobileNamber,
        "productModel": productModel.toJson(productModel.productId)
      };

  factory BuyProductModel.fromJosn(Map<String, dynamic> json) {
    return BuyProductModel(
        id: json["id"],
        uid: json["uid"],
        address: json["address"],
        mobileNamber: json["mobileNamber"],
        name: json["name"],
        productModel: json["productModel"]);
  }
}
