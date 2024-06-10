import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/coach_model.dart';
import 'package:getsport/data/model/product_model.dart';
import 'package:getsport/data/model/venue_model.dart';
import 'package:getsport/presentation/modules/admin/add_venue.dart';
import 'package:getsport/presentation/widget/helper.dart';

class VenuesListPage extends StatelessWidget {
  VenuesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
          title: const Text("Venue List"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.blue.shade900),
            ),
            //  Icon(Icons.add,color: Colors.blue.shade900),
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddVenue()));
              },
              icon: Icon(Icons.add, color: Colors.blue.shade900),
            )
          ],
        ),
        backgroundColor:
            const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
        body: StreamBuilder<QuerySnapshot>(
            stream: DbController().getAllVenues(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Helper.indiacator();
              }
              List<VenueModel> venueList = [];

              venueList = snapshot.data!.docs
                  .map((e) =>
                      VenueModel.fromJosn(e.data() as Map<String, dynamic>))
                  .toList();

              if (snapshot.hasData) {
                return Helper.emptyListWidget(
                    venueList,
                    "No Venus",
                    ListView.builder(
                      itemCount: venueList.length,
                      itemBuilder: (context, index) {
                        var venue = venueList[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 200,
                            width: 330,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.blueGrey)),
                            child: Column(
                              children: [
                                Text(
                                  venue.venueName,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  venue.description,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: Image.network(
                                        venue.imageUrl,
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              venue.location,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            const Icon(Icons.location_on),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          "Timing:",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "Monday- Friday   ${venue.timing}",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        Row(
                                          children: [
                                            ElevatedButton.icon(
                                                onPressed: () {
                                                  _callForEdit(venue, context);
                                                },
                                                icon: const Icon(
                                                  Icons.edit,
                                                  color: Colors.blue,
                                                ),
                                                label: const Text("Edit",
                                                    style: TextStyle(
                                                        color: Colors.blue))),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            ElevatedButton.icon(
                                                onPressed: () {
                                                  DbController()
                                                      .deleteSelectedDoc(
                                                          "Venues",
                                                          venue.venueID);
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.blue,
                                                ),
                                                label: const Text("Delete",
                                                    style: TextStyle(
                                                        color: Colors.blue)))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ));
              } else {
                return const SizedBox();
              }
            }));
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final location = TextEditingController();

  final description = TextEditingController();

  final timing = TextEditingController();

  _callForEdit(VenueModel model, context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field is empty";
                          } else {
                            return null;
                          }
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                            hintText: "Name", border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field is empty";
                          } else {
                            return null;
                          }
                        },
                        controller: priceController,
                        decoration: const InputDecoration(
                            hintText: "Price", border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        // keyboardType: TextInputType.number,
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
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        // keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field is empty";
                          } else {
                            return null;
                          }
                        },
                        controller: location,
                        decoration: const InputDecoration(
                            hintText: "Location", border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        // keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field is empty";
                          } else {
                            return null;
                          }
                        },
                        controller: timing,
                        decoration: const InputDecoration(
                            hintText: "Timing", border: OutlineInputBorder()),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blueAccent),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 6.0),
                            child: TextButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  DbController().updateVenue(VenueModel(
                                      price: double.parse(priceController.text),
                                      description: description.text,
                                      imageUrl: model.imageUrl,
                                      location: location.text,
                                      timing: timing.text,
                                      venueName: nameController.text,
                                      venueID: model.venueID));

                                  Helper.successSnackBar(
                                      context, "Updation Successful");
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
