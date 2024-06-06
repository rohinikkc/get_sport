import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/model/usermodel.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:terra_treasures/model/user_model.dart';

class Controller {
  final db = FirebaseFirestore.instance;

  Future<void> addUser(UserModel userModel, String uid) async {
    final docRef = db.collection("user").doc(uid);
    await docRef.set(userModel.toMap());
    fetchAllUser();
  }

  Future<void> create(String name, String email, String phoneNumber, String imageUrl) async {
    final collectionRef = FirebaseFirestore.instance.collection('user');
    await collectionRef.add({
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
 
      'imageUrl': imageUrl,
    });
    
  }

  List<UserModel> listOfData = [];

  Future<List<UserModel>> fetchAllUser() async {
    final snapshot = await db.collection("user").get();
    listOfData = snapshot.docs.map((e) => UserModel.fromMap(e.data())).toList();
    print(listOfData);
    return listOfData;
  }

  UserModel? singleUserData;

  Future<void> fetchSingleUserData(String id) async {
    final snapshot = await db.collection("user").doc(id).get();
    singleUserData = UserModel.fromMap(snapshot.data()!);
  }
  

  Future<XFile?> pickImage() async {
    final imagePicker = ImagePicker();
    return await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
  }

  Future<String> uploadImage(XFile imageFile) async {
    final storageRef = FirebaseStorage.instance.ref().child('images/${imageFile.name}');
    try {
      final uploadTask = storageRef.putFile(File(imageFile.path));
      final snapshot = await uploadTask.whenComplete(() => null);
      return await snapshot.ref.getDownloadURL();
    } on FirebaseException catch (e) {
      print(e.message);
      return '';
    }
  }
}