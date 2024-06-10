import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:getsport/data/model/buy_product_model.dart';

class DBFunctions{
final db=FirebaseFirestore.instance;



buyAProduct(BuyProductModel buyProductModel){

  final docs=db.collection("Orders").doc();
  docs.set(buyProductModel.toJson(docs.id));
}







}