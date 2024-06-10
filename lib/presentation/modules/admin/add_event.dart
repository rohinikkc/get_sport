import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getsport/data/crud/controller.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/event_model.dart';
import 'package:getsport/presentation/widget/helper.dart';
import 'package:image_picker/image_picker.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final eventname = TextEditingController();
  final location = TextEditingController();
  final timing = TextEditingController();

  final joinFee = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  XFile? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
        title: Text("Add Event"),
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
          height: 600,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blueGrey)),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 50, left: 20),
                    child: TextFormField(
                      controller: eventname,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Event Name",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: InkWell(
                      onTap: () {
                        Controller().pickImage().then((value) {
                          imageFile = value;
                          setState(() {});
                        });
                      },
                      child: imageFile != null
                          ? Image.file(
                              File(imageFile!.path),
                              height: 100,
                              width: 100,
                            )
                          : Image.asset(
                              "assets/image.png",
                              height: 100,
                              width: 100,
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: location,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Location",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: timing,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Timing",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: joinFee,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Join Fee",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (imageFile != null) {
                            DbController()
                                .uploadImage(imageFile!, "Events")
                                .then((url) {
                              DbController()
                                  .addEvents(EventModel(
                                    eventHoster: "HopeHub",
                                      joinfee: joinFee.text,
                                      eventName: eventname.text,
                                      imageUrl: url,
                                      location: location.text,
                                      timig: timing.text))
                                  .then((value) {
                                Navigator.pop(context);
                                Helper.successSnackBar(context, "Event Added Successful!");
                              });
                            });
                          } else {
                            Helper.errorSnackBar(context, "Pick Image!");
                          }
                        }
                      },
                      child: Text(
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
