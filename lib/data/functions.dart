import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/acadamymodel.dart';
import 'package:getsport/data/model/buy_product_model.dart';
import 'package:getsport/data/model/coach_model.dart';
import 'package:getsport/data/model/event_model.dart';
import 'package:getsport/data/model/product_model.dart';
import 'package:getsport/data/model/usermodel.dart';
import 'package:getsport/presentation/modules/admin/ad_user_list.dart';

class DBFunctions with ChangeNotifier {

double ?ratingStar;

changeRating(index){
  ratingStar=index;
  log(ratingStar.toString());
  notifyListeners();
}

clearRating(){
  ratingStar=null;
  notifyListeners();
}

  final db = FirebaseFirestore.instance;

  static List<String> sport = [
    "Football",
    "Cricket",
    "Basketball",
    "Kungfu",
    "Karata",
    "Kabadi"
  ];

  String? selectedSport;
  selectSport(value) {
    selectedSport = value;
    log(selectedSport!);
    notifyListeners();
  }

 
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

Position? position;
  getcCurrentLatLonPosition()async{
  return await  _determinePosition().then((value){
    
    position=value;
    log(position.toString());
    return position;
  });
    
  }

  buyAProduct(BuyProductModel buyProductModel) {
    final docs = db.collection("Orders").doc();
    docs.set(buyProductModel.toJson(docs.id));
  }

  List<UserModel> userList = [];

  getUserData() async {
    final snapshot = await FirebaseFirestore.instance.collection("user").get();
    userList = snapshot.docs.map((e) => UserModel.fromMap(e.data())).toList();
  }

  //seaching
  List<UserModel> displyUserList = [];
  serchUserByName(
    String value,
  ) {
    displyUserList = List.from(userList);
    displyUserList = userList.where((element) {
      return element.name.toLowerCase().contains(value.toLowerCase());
    }).toList();
    notifyListeners();
  }

//-------------academy evnt serch
  List<EventModel> eventList = [];

  getAllEvent() async {
    final snapshot = await db
        .collection("Events")
        .where("hosterId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    eventList = snapshot.docs
        .map((e) => EventModel.fromJson(e.data() as Map<String, dynamic>))
        .toList();
  }

  //seaching
  List<EventModel> displyEventList = [];
  serchEventByName(
    String value,
  ) {
    displyEventList = List.from(eventList);
    displyEventList = eventList.where((element) {
      return element.eventName.toLowerCase().contains(value.toLowerCase());
    }).toList();
    notifyListeners();
  }

  //  product in user
  List<ProductModel> productList = [];

  getProductEvent() async {
    final snapshot = await db.collection("Products").get();

    productList = snapshot.docs
        .map((e) => ProductModel.fromJosn(e.data() as Map<String, dynamic>))
        .toList();
  }

  //seaching
  List<ProductModel> displyproductList = [];
  serchProductByName(
    String value,
  ) {
    displyproductList = List.from(productList);
    displyproductList = productList.where((element) {
      return element.name.toLowerCase().contains(value.toLowerCase());
    }).toList();
    notifyListeners();
  }

  List<CoachModel> coachList = [];

  getAllTrainers() async {
    final snapshot = await db.collection("Coachs").get();

    coachList =
        snapshot.docs.map((e) => CoachModel.fromJson(e.data())).toList();
  }

  //seaching
  List<CoachModel> displycoachList = [];
  serchTrainerByName(
    String value,
  ) {
    displycoachList = List.from(coachList);
    displycoachList = coachList.where((element) {
      return element.name.toLowerCase().contains(value.toLowerCase());
    }).toList();
    notifyListeners();
  }

//---------------search Academy
  List<AcadamyModel> academyList = [];

  getAllAcademy() async {
    final snapshot = await db.collection("Acadamy").get();

    academyList =
        snapshot.docs.map((e) => AcadamyModel.fromMap(e.data())).toList();
  }

  //seaching
  List<AcadamyModel> displyacademyList = [];
  serchAcademybyName(
    String value,
  ) {
    displyacademyList = List.from(academyList);
    displyacademyList = academyList.where((element) {
      return element.location!.toLowerCase().contains(value.toLowerCase());
    }).toList();
    notifyListeners();
  }



}
