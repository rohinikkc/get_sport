import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/model/buy_product_model.dart';
import 'package:getsport/data/model/usermodel.dart';
import 'package:getsport/presentation/modules/admin/ad_user_list.dart';

class DBFunctions  with ChangeNotifier{
final db=FirebaseFirestore.instance;



buyAProduct(BuyProductModel buyProductModel){

  final docs=db.collection("Orders").doc();
  docs.set(buyProductModel.toJson(docs.id));


 
}
List<UserModel>userList=[];

getUserData()async{
  final snapshot=     await  FirebaseFirestore.instance.collection("user").get();
  userList=snapshot.docs.map((e) => UserModel.fromMap(e.data())).toList();
}
 //seaching
List<UserModel>displyUserList=[];
  serchUserByName(String value,){
    displyUserList=List.from(userList);
    displyUserList=userList.where((element){
      return  element.name.toLowerCase().contains(value.toLowerCase());
    }).toList();
    notifyListeners();
   
  }







}