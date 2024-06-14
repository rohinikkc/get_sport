import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geocoding/geocoding.dart';
import 'package:getsport/data/model/club_model.dart';
import 'package:getsport/data/model/coach_model.dart';
import 'package:getsport/data/model/event_model.dart';
import 'package:getsport/data/model/locatoion.dart';
import 'package:getsport/data/model/product_model.dart';
import 'package:getsport/data/model/regis_event_model.dart';
import 'package:getsport/data/model/venue_model.dart';
import 'package:getsport/presentation/widget/helper.dart';
import 'package:image_picker/image_picker.dart';

class DbController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;

//..................Authentication

  Future<UserCredential> createaccount(context, email, password) async {
    try {
      return await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (errors) {
      return Helper.errorSnackBar(context, "Error :${errors}");
    }
  }

//===================================================//==================================================//
//...............................store image

  Future<String> uploadImage(XFile imageFile, String path) async {
    SettableMetadata metadata = SettableMetadata(contentType: "image/jpeg");
    final storageRef =
        FirebaseStorage.instance.ref().child('$path/${imageFile.name}');
    try {
      final uploadTask = storageRef.putFile(File(imageFile.path), metadata);
      final snapshot = await uploadTask.whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e.message);
      return '';
    }
  }

//===========================================//==========================================================//

//=====================DELETE DOC

  deleteSelectedDoc(collectionName, docId) async {
    db.collection(collectionName).doc(docId).delete();
  }

//-------------Trainer--------------
  addNewCoach(CoachModel coachModel) async {
    db.collection("Coachs").doc(coachModel.coachId).set(coachModel.toJosn());
  }

  getAllTrainer() {
    return db.collection("Coachs").snapshots();
  }

  updateTrainerData(CoachModel coachModel) {
    db.collection("Coachs").doc(coachModel.coachId).update(coachModel.toJosn());
  }

//-----------------------------//-------------------------//

//-----------------------------CLUB CLUB--------------------------//\\

  addNewClub(id, ClubModel clubmodel) async {
    db.collection("Clubs").doc(id).set(clubmodel.toJosn());
    saveLocation(clubmodel.location, "Club",id);
  }

  getAllClubs() {
    return db.collection("Clubs").snapshots();
  }

  updateClubData(ClubModel clunModel) {
    db.collection("Clubs").doc(clunModel.id).update(clunModel.toJosn());
  }

  Stream<QuerySnapshot> fetchCurrentModuleEvents() {
    return db
        .collection("Events")
        .where("hosterId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

//......................................PRODUCT

  addNewProduct(ProductModel productModel) async {
    final docs = db.collection("Products").doc();

    docs.set(productModel.toJson(docs.id));
  }

  Stream<QuerySnapshot> getAllProducts() {
    return db.collection("Products").snapshots();
  }

  updateProduct(ProductModel productModel) {
    db
        .collection("Products")
        .doc(productModel.productId)
        .update(productModel.toJson(productModel.productId));
  }

//....................VENUE
  Stream<QuerySnapshot> getAllVenues() {
    return db.collection("Venues").snapshots();
  }

  Stream<QuerySnapshot> getAcademiesVenues() {
    return db
        .collection("Venues")
        .where("sponserId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
  }

  Future addNewVenue(VenueModel venueModel) async {
    final docs = db.collection("Venues").doc();

    docs.set(venueModel.toJson(docs.id));
    saveLocation(venueModel.location, "Venue",docs.id);
  }

  updateVenue(VenueModel venueModel) {
    db
        .collection("Venues")
        .doc(venueModel.venueID)
        .update(venueModel.toJson(venueModel.venueID));
  }

  //..........................EVENT

  Stream<QuerySnapshot> getAllEvents() {
    return db.collection("Events").snapshots();
  }

  Future addEvents(EventModel eventModel) async {
    final docs = db.collection("Events").doc();
    docs.set(eventModel.toJson(docs.id));
    saveLocation(eventModel.location, "Event",docs.id);
  }

  registerAnEvent(id, RegEventModel regEventModel) {
    final doc = db
        .collection("Events")
        .doc(id)
        .collection("Registration")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    doc.set(regEventModel.toJosn(doc.id));
  }
//...............................Academy

  Stream<QuerySnapshot> getAllAcademy() {
    return db.collection("Acadamy").snapshots();
  }

//.........................USERS................................//

  Stream<QuerySnapshot> getAllUsers() {
    return db.collection("user").snapshots();
  }

  Stream<QuerySnapshot> getRegisterdEventsIn(evetId) {
    return db
        .collection("Events")
        .doc(evetId)
        .collection("Registration")
        .snapshots();
  }

  Future<DocumentSnapshot> getUserData(collection, id) async {
    return db.collection(collection).doc(id).get();
  }


  saveLocation(location,type,itemid)async{
  
 locationFromAddress(location).then((value) {
  final data=value[0];
  final lat=data.latitude;
  final lon=data.longitude;
LocationModel model=LocationModel(
  itemID:itemid,
  lat: lat, location: location, lon: lon, type: type);
final doc=  db.collection("location").doc();
doc.set(model.toJson(doc.id));

});


  }

 Future<QuerySnapshot> getAllLocation()async{
 return   db.collection("location").get();
  }
}
