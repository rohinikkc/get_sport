import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/crud/controller.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/functions.dart';
import 'package:getsport/data/model/event_model.dart';
import 'package:getsport/presentation/widget/helper.dart';
import 'package:getsport/presentation/widget/sport_category.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  String hosterType;
  AddEvent({super.key, required this.hosterType});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final eventname = TextEditingController();
  final location = TextEditingController();
  final timing = TextEditingController();

  final joinFee = TextEditingController();
  final target = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  XFile? imageFile;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  Timestamp? selectedDateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
        title: const Text("Add Event"),
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
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SportCategoryDropDown(),
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
                      decoration: const InputDecoration(
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
                  InkWell(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050))
                          .then((value) {
                        setState(() {
                          selectedDate = value;
                        });
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.date_range),
                        const Text("Date"),
                        Text(selectedDate != null
                            ? "${selectedDate!.year} - ${selectedDate!.month} - ${selectedDate!.day}"
                            : "Select Date")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () async {
                      await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      ).then((value) {
                        setState(() {
                          selectedTime = value;
                        });
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.timer),
                        const Text("Time"),
                        Text(selectedTime != null
                            ? "${selectedTime!.hour}:${selectedTime!.minute}"
                            : "Select TIme")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      controller: joinFee,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Join Fee",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 100, top: 30, left: 20),
                    child: TextFormField(
                      maxLength: 2,
                      keyboardType: TextInputType.number,
                      controller: target,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is required";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Expected Team",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (imageFile != null) {
                            if (selectedDate != null && selectedTime != null) {
                              DbController.getLocation(location.text)
                                  .then((loc) {
                                DbController()
                                    .uploadImage(imageFile!, "Events")
                                    .then((url) {
                                  DbController()
                                      .addEvents(EventModel(
                                          targetPartipent:
                                              int.parse(target.text),
                                          type: Provider.of<DBFunctions>(
                                                  context,
                                                  listen: false)
                                              .selectedSport!,
                                          lat: loc.latitude,
                                          lon: loc.longitude,
                                          hosterId: FirebaseAuth
                                              .instance.currentUser!.uid,
                                          eventHoster: widget.hosterType,
                                          joinfee: joinFee.text,
                                          eventName: eventname.text,
                                          imageUrl: url,
                                          location: location.text,
                                          time: _combineDateTime()))
                                      .then((value) {
                                    Navigator.pop(context);
                                    Helper.successSnackBar(
                                        context, "Event Added Successful!");
                                  });
                                });
                              }).catchError((onError) {
                                Helper.errorSnackBar(
                                    context, "Error while fetching   location");
                              });
                            } else {
                              Helper.errorSnackBar(
                                  context, "Select Date And Time!");
                            }
                          } else {
                            Helper.errorSnackBar(context, "Pick Image!");
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

  String _combineDateTime() {
    String? combineString;
    if (selectedDate != null && selectedTime != null) {
      final formatedDate =
          DateFormat("dd MMMM yyyy").format(selectedDate!).toString();
      final formatedTime = "${selectedTime!.hour}:${selectedTime!.minute}";
      final list = [formatedDate, formatedTime];
      combineString = list.join(' at ');
      log('Timestamp: $combineString');

      //  25 June 2024 at 13:39:13
    }
    return combineString!;
  }
}
