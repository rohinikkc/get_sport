import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/data/crud/controller.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/acadamymodel.dart';
import 'package:getsport/presentation/widget/helper.dart';
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
  TimeOfDay? fromTime;
  TimeOfDay? toTime;

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

  // String periodOfDay = "";
  _getTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    setState(() {
      fromTime = selectedTime;
      // periodOfDay = fromTime!.period.toString().split(".")[1];
    });
  }

  // String periodOfDay = "";
  _getToTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    setState(() {
      toTime = selectedTime;
      // periodOfDay = fromTime!.period.toString().split(".")[1];
    });
  }

  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        iconTheme: IconThemeData(color: Colors.blue.shade900),
        title: const Text("Add Academy"),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _fromKey,
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
                          padding: const EdgeInsets.only(
                              right: 20, top: 30, left: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, top: 30, left: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            controller: passwordController,
                            decoration: const InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 50, left: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            controller: nameController,
                            decoration: const InputDecoration(
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
                                : const AssetImage("assets/profile.png")
                                    as ImageProvider,
                          )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (image != null)
                          Image.memory(
                            image!,
                            width: 100,
                            height: 100,
                          ),
                        Container(
                          color: const Color.fromARGB(255, 70, 109, 166),
                          child: TextButton(
                              onPressed: _pickImageFromGallery,
                              child: const Text(
                                "Pick Image From Gallery",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, top: 30, left: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            controller: locationController,
                            decoration: const InputDecoration(
                              hintText: "Location",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, top: 30, left: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field is required";
                              } else {
                                return null;
                              }
                            },
                            controller: sportsClassController,
                            decoration: const InputDecoration(
                              hintText: "sports classes",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, top: 30, left: 20),
                          child: Row(
                            children: [
                              Text(
                                fromTime != null
                                    ? "${fromTime!.hourOfPeriod}: ${fromTime!.minute} ${fromTime!.period.toString().split(".")[1].toUpperCase()}"
                                    : "Select From",
                                style: const TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: _getTime,
                                  icon: const Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 20, top: 30, left: 20),
                          child: Row(
                            children: [
                              Text(
                                toTime != null
                                    ? "${toTime!.hour}: ${toTime!.minute} ${toTime!.period.name.toUpperCase()}"
                                    : "Select To",
                                style: const TextStyle(color: Colors.white),
                              ),
                              IconButton(
                                  onPressed: _getToTime,
                                  icon: const Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (_fromKey.currentState!.validate()) {
                                if (selectedImage != null) {
                                  if (fromTime != null || toTime != null) {
                                    DbController.getLocation(
                                            locationController.text)
                                        .then((loc) async {
                                        await controller
                                          .uploadImage(
                                              XFile(selectedImage!.path))
                                          .then((url) async {
                                       try{
                                         final userCredential =
                                            await FirebaseAuth.instance
                                                .createUserWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text,
                                                );
                                                 final uid = userCredential.user!.uid;
                                        final acadamyModel = AcadamyModel(
                                            lat: loc.latitude,
                                            lon: loc.longitude,
                                            fromTime:
                                                "${fromTime!.hour}:${fromTime!.minute} ${fromTime!.period.name.toUpperCase()}",
                                            email: emailController.text,
                                            acadamyName: nameController.text,
                                            image: url,
                                            location: locationController.text,
                                            sportsClass:
                                                sportsClassController.text,
                                            toTime:
                                                "${toTime!.hour}:${toTime!.minute} ${toTime!.period.name.toUpperCase()}",
                                            id: uid);

                                        FirebaseFirestore.instance
                                            .collection("Acadamy")
                                            .doc(uid)
                                            .set(acadamyModel.toMap())
                                            .then((value) async {
                                          await DbController().saveLocation(
                                              locationController.text.trim(),
                                              "Acadamy",
                                              uid);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                            content: Text("Acadamy Added"),
                                          ));
                                          Navigator.pop(context);
                                        });
                                       }catch(error){
                                        Helper.errorSnackBar(context, error.toString());
                                       }
                                       
                                         });
                                       }).catchError((error) {
                                      Helper.errorSnackBar(context,
                                          "Error while fetching location");
                                    });
                                  } else {
                                    Helper.errorSnackBar(context, "Pick Time");
                                  }
                                } else {
                                  Helper.errorSnackBar(context, "Pick Image");
                                }
                              }
                            },
                            child: const Text(
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
      ),
    );
  }
}
