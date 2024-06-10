import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getsport/data/crud/controller.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/club_model.dart';
import 'package:getsport/presentation/widget/helper.dart';
import 'package:image_picker/image_picker.dart';

class AddClub extends StatefulWidget {
  const AddClub({super.key});

  @override
  State<AddClub> createState() => _AddClubState();
}

class _AddClubState extends State<AddClub> {
  final _key = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final clubName = TextEditingController();
  final password = TextEditingController();
  final location = TextEditingController();
  final regIDController = TextEditingController();

  XFile? pickedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
        title: const Text("Add Club"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add, color: Colors.blue.shade900),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          // height: 600,
          // width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blueGrey)),
          child: Form(
            key: _key,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: regIDController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Reg. ID",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Club Email",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: clubName,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Club Name",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: InkWell(
                      onTap: () {
                        Controller().pickImage().then((value) {
                          pickedFile = value;
                          setState(() {});
                        });
                      },
                      child: pickedFile != null
                          ? SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.file(File(pickedFile!.path)))
                          : Image.asset(
                              "assets/image.png",
                              height: 100,
                              width: 100,
                            ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: location,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Location",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          if (pickedFile != null) {
                            DbController()
                                .uploadImage(pickedFile!, 'Club')
                                .then((url) {
                              DbController()
                                  .createaccount(context, emailController.text,
                                      password.text)
                                  .then((value) {
                                DbController().addNewClub(
                                    value.user!.uid,
                                    ClubModel(
                                      location: location.text,
                                        regId: regIDController.text,
                                        clubImage: url,
                                        email: emailController.text,
                                        id: value.user!.uid,
                                        name: clubName.text));
                                        Navigator.pop(context);
                              });
                            });
                          } else {
                            Helper.errorSnackBar(context, "Pick club image");
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
        ),
      ),
    );
  }
}
