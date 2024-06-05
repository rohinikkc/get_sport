import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/crud/controller.dart';
import 'package:getsport/model/acadamymodel.dart';
import 'package:image_picker/image_picker.dart';

class AddAcademy extends StatefulWidget {
  const AddAcademy({super.key});

  @override
  State<AddAcademy> createState() => _AddAcademyState();
}

class _AddAcademyState extends State<AddAcademy> {
  File? selectedImage;
  Uint8List? image;

  Controller controller = Controller();
  TimeOfDay? classTime;
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sportsClassController = TextEditingController();
  TextEditingController timingController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> _pickImageFromGallery() async {
    final pickedImage = await controller.pickImage();
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
        image = selectedImage?.readAsBytesSync();
      });
    }
  }

String periodOfDay="";
  _getTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    setState(() {
      classTime = selectedTime;
      periodOfDay = classTime!.period.toString().split(".")[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        iconTheme: IconThemeData(color: Colors.blue.shade900),
        title: Text("Add Academy"),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 600,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blueGrey)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, top: 30, left: 20),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, top: 30, left: 20),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50, left: 20),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Academy Name",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: selectedImage != null
                              ? FileImage(selectedImage!)
                              : AssetImage("assets/profile.png")
                                  as ImageProvider,
                        )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (image != null)
                        Image.memory(
                          image!,
                          width: 100,
                          height: 100,
                        ),
                      Container(
                        color: Color.fromARGB(255, 70, 109, 166),
                        child: TextButton(
                            onPressed: _pickImageFromGallery,
                            child: Text(
                              "Pick Image From Gallery",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, top: 30, left: 20),
                        child: TextFormField(
                          controller: locationController,
                          decoration: InputDecoration(
                            hintText: "Location",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, top: 30, left: 20),
                        child: TextFormField(
                          controller: sportsClassController,
                          decoration: InputDecoration(
                            hintText: "sports classes",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 20, top: 30, left: 20),
                        child: Row(
                          children: [
                            Text(classTime != null?
                              "${classTime!.hourOfPeriod}: ${classTime!.minute} ${classTime!.period.toString().split(".")[1].toUpperCase()}": "Select Time", style: TextStyle(color: Colors.white),
                              ),
                            IconButton(
                                onPressed: _getTime,
                                icon: Icon(Icons.watch_later_outlined, color: Colors.white,))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            String imageUrl = '';
                            if (selectedImage != null) {
                              imageUrl = await controller
                                  .uploadImage(XFile(selectedImage!.path));
                            }
                            final userCredential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            final uid = userCredential.user!.uid;
                            final acadamyModel = AcadamyModel(
                                acadamyName: nameController.text,
                                image: imageUrl,
                                location: locationController.text,
                                sportsClass: sportsClassController.text,
                                time: classTime,
                                id: uid);

                            FirebaseFirestore.instance
                                .collection("Acadamy")
                                .doc(uid)
                                .set(acadamyModel.toMap())
                                .then((value) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Acadamy Added"),
                              ));
                              Navigator.pop(context);
                            });
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
