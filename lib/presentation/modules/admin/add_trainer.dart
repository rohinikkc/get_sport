import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getsport/presentation/modules/user/create_acnt.dart';
import 'package:getsport/data/crud/controller.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/coach_model.dart';
import 'package:getsport/presentation/widget/helper.dart';
import 'package:image_picker/image_picker.dart';

class AddTrainer extends StatefulWidget {
  const AddTrainer({super.key});

  @override
  State<AddTrainer> createState() => _AddTrainerState();
}

class _AddTrainerState extends State<AddTrainer> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();

  final passwordController = TextEditingController();

  final locationController = TextEditingController();

  final sportsClassController = TextEditingController();

  final descriptionController = TextEditingController();
  XFile? pickedFile;
  XFile? pickedCertificateFile;

  TimeOfDay? fromTime;
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
  TimeOfDay? toTime;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
        title: const Text("Add Trainer"),
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
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
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
                        hintText: "Trainer Email",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Trainer Name",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: passwordController,
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
                  Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            InkWell(
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
                                      child: Image.file(
                                          fit: BoxFit.cover,
                                          File(pickedFile!.path)))
                                  : Image.asset(
                                      "assets/image.png",
                                      height: 100,
                                      width: 100,
                                    ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.5)),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Controller().pickImage().then((value) {
                                  pickedCertificateFile = value;
                                  setState(() {});
                                });
                              },
                              child: pickedCertificateFile != null
                                  ? SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.file(
                                          fit: BoxFit.cover,
                                          File(pickedCertificateFile!.path)))
                                  : Image.asset(
                                      "assets/image.png",
                                      height: 100,
                                      width: 100,
                                    ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Certificate",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.5)),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: locationController,
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
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: sportsClassController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "sports classes",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: descriptionController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Description",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
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
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if ((pickedFile != null &&
                                  pickedCertificateFile != null) &&
                              (fromTime != null && toTime != null)) {
                            DbController()
                                .createaccount(
                                    context,
                                    emailController.text.trim(),
                                    passwordController.text.trim())
                                .then((value) {
                              _storeImage().then((_) {
                                DbController().addNewCoach(CoachModel(
                                    certificate: _certificate,
                                    coachId: value.user!.uid,
                                    description: descriptionController.text,
                                    email: emailController.text,
                                    fromTIme:
                                        "${fromTime!.hour}:${fromTime!.minute} ${fromTime!.period.name.toUpperCase()}",
                                    location: locationController.text,
                                    name: nameController.text,
                                    profile: _profile,
                                    toTime:
                                        "${toTime!.hour}:${toTime!.minute} ${toTime!.period.name.toUpperCase()}",
                                    trainingClass: sportsClassController.text));
                                Navigator.pop(context);
                              });
                            });
                          } else {
                            Helper.errorSnackBar(
                                context, "Pick image and available time");
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

  String _profile = '';
  String _certificate = '';
  Future _storeImage() async {
    await DbController()
        .uploadImage(pickedFile!, "CoachProfile")
        .then((value) => _profile = value);
    await DbController()
        .uploadImage(pickedCertificateFile!, "CoachCertificate")
        .then((value) => _certificate = value);
  }
}
