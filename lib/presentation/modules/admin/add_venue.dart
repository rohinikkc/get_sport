import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getsport/data/crud/controller.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/functions.dart';
import 'package:getsport/data/model/venue_model.dart';
import 'package:getsport/presentation/widget/helper.dart';
import 'package:getsport/presentation/widget/sport_category.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddVenue extends StatefulWidget {
  String currentUserID;
  AddVenue({super.key, required this.currentUserID});

  @override
  State<AddVenue> createState() => _AddVenueState();
}

class _AddVenueState extends State<AddVenue> {
  final name = TextEditingController();
  final location = TextEditingController();

  final price = TextEditingController();

  final description = TextEditingController();

  final timing = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  XFile? imagefile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
        title: const Text("Add Venue"),
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

                  SportCategoryDropDown(),
                  Padding(
                    padding: const EdgeInsets.only(right: 50, left: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is empty";
                        } else {
                          return null;
                        }
                      },
                      controller: name,
                      decoration: const InputDecoration(
                        hintText: "Venue Name",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: InkWell(
                      onTap: () {
                        Controller().pickImage().then((value) {
                          imagefile = value;

                          setState(() {});
                        });
                      },
                      child: imagefile != null
                          ? Image.file(
                              File(imagefile!.path),
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is empty";
                        } else {
                          return null;
                        }
                      },
                      controller: location,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is empty";
                        } else {
                          return null;
                        }
                      },
                      controller: price,
                      decoration: const InputDecoration(
                        hintText: "Price",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is empty";
                        } else {
                          return null;
                        }
                      },
                      controller: description,
                      decoration: const InputDecoration(
                        hintText: "Description",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is empty";
                        } else {
                          return null;
                        }
                      },
                      controller: timing,
                      decoration: const InputDecoration(
                        hintText: "Timing",
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
                          if (imagefile != null) {
                            DbController.getLocation(location.text).then((loc) {
                              DbController()
                                  .uploadImage(imagefile!, "Venue")
                                  .then((value) {
                                DbController()
                                    .addNewVenue(VenueModel(
                                      rating: 0.0,
                                      type: Provider.of<DBFunctions>(context,listen: false).selectedSport!,
                                        lat: loc.latitude,
                                        lon: loc.longitude,
                                        sponserId: widget.currentUserID,
                                        price: double.parse(price.text),
                                        description: description.text,
                                        imageUrl: value,
                                        location: location.text,
                                        timing: timing.text,
                                        venueName: name.text))
                                    .then((value) {
                                  Navigator.pop(context);
                                  Helper.successSnackBar(
                                      context, "Venue added successful");
                                });
                              });
                            }).catchError((error) {
                              Helper.errorSnackBar(
                                  context, "Error while fetching location");
                            });
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
}
