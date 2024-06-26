import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/presentation/modules/admin/add_academy.dart';
import 'package:getsport/data/model/acadamymodel.dart';
import 'package:getsport/presentation/widget/helper.dart';

class AcademyList extends StatefulWidget {
  const AcademyList({super.key});

  @override
  State<AcademyList> createState() => _AcademyListState();
}

class _AcademyListState extends State<AcademyList> {
  Stream<QuerySnapshot>? acadamyStream;
  final _formkey = GlobalKey<FormState>();
  TimeOfDay? fromTime;
  TimeOfDay? toTime;

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sportsController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  _callAcadamy() async {
    acadamyStream =
        FirebaseFirestore.instance.collection('Acadamy').snapshots();
    setState(() {});
  }

  @override
  void initState() {
    _callAcadamy();
    super.initState();
  }

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

  _callForEdit(DocumentSnapshot ds) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Form(
                key: _formkey,
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
                            hintText: "Acadamy Name",
                            border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field is empty";
                          } else {
                            return null;
                          }
                        },
                        controller: locationController,
                        decoration: const InputDecoration(
                            hintText: "Location", border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field is empty";
                          } else {
                            return null;
                          }
                        },
                        controller: sportsController,
                        decoration: const InputDecoration(
                            hintText: "Sports Class",
                            border: OutlineInputBorder()),
                      ),
                      Row(
                        children: [
                          Text(
                            fromTime != null
                                ? "${fromTime!.hourOfPeriod}: ${fromTime!.minute} ${fromTime!.period.toString().split(".")[1].toUpperCase()}"
                                : "Select From",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          IconButton(
                              onPressed: _getTime,
                              icon: const Icon(
                                Icons.watch_later_outlined,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            toTime != null
                                ? "${toTime!.hour}: ${toTime!.minute} ${toTime!.period.name.toUpperCase()}"
                                : "Select To",
                            style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          IconButton(
                              onPressed: _getToTime,
                              icon: const Icon(
                                Icons.watch_later_outlined,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ))
                        ],
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
                                if (_formkey.currentState!.validate()) {
                                  if (fromTime != null && toTime != null) {
                                   DbController.getLocation(locationController.text).then((loc)async{

                                     final acadamyModel = AcadamyModel(
                                      lat: loc.latitude,
                                      lon: loc.longitude,
                                      
                                        fromTime:
                                            "${fromTime!.hour}:${fromTime!.minute} ${fromTime!.period.name.toUpperCase()}",
                                        email: ds["email"],
                                        acadamyName: nameController.text,
                                        image: ds['image'],
                                        location: locationController.text,
                                        sportsClass: sportsController.text,
                                        toTime:
                                            "${toTime!.hour}:${toTime!.minute} ${toTime!.period.name.toUpperCase()}",
                                        id: ds['id']);
                                    await FirebaseFirestore.instance
                                        .collection('Acadamy')
                                        .doc(ds['id'])
                                        .update(acadamyModel.toMap())
                                        .then((value) {
                                      Navigator.pop(context);
                                    });

                                   }).catchError((error){
                                    Helper.errorSnackBar(context, "Error while fetching location");
                                   });
                                  } else {
                                    Helper.errorSnackBar(context, "Pick Time!");
                                  }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor:const Color.fromARGB(255, 70, 109, 166).withOpacity(.6) ,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue.shade900),
          backgroundColor:
              const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          title: const Text("Academy List"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.blue.shade900)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddAcademy()));
                },
                icon: Icon(Icons.add, color: Colors.blue.shade900)),
          ],
        ),
        backgroundColor:
            const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
        body: StreamBuilder(
            stream: acadamyStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return snapshot.hasData
                  ? snapshot.data!.docs.isEmpty
                      ? const Center(
                          child: Text("No Academy"),
                        )
                      : ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot ds = snapshot.data!.docs[index];
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                // height: 200,
                                // width: 330,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.blueGrey)),
                                child: Column(
                                  children: [
                                    Text(
                                      ds['acadamyName'],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: ds.exists
                                                ? SizedBox(
                                                    height: 100,
                                                    width: 100,
                                                    child: Image.network(
                                                      ds['image'],
                                                      fit: BoxFit.cover,
                                                    ))
                                                : const Center(
                                                    child: Text("Photo"),
                                                  )),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  ds['location'],
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                ),
                                                const Icon(Icons.location_on),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            Container(
                                              height: 30,
                                              width: 190,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.blueGrey),
                                              child: Center(
                                                child: Text(
                                                  ds['sportsClass'],
                                                  style: const TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                            const Text(
                                              "Timing:",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: Text(
                                                "Monday- Friday ${ds['fromTime']} To ${ds['toTime']}",
                                                style: const TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                ElevatedButton.icon(
                                                    onPressed: () {
                                                      _callForEdit(ds);
                                                    },
                                                    icon: const Icon(
                                                      Icons.edit,
                                                      color: Colors.blue,
                                                    ),
                                                    label: const Text("Edit",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.blue))),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                ElevatedButton.icon(
                                                    onPressed: () {
                                                      FirebaseFirestore.instance
                                                          .collection('Acadamy')
                                                          .doc(ds['id'])
                                                          .delete();
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.blue,
                                                    ),
                                                    label: const Text("Delete",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.blue)))
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
                        )
                  : Container();
            }));
  }
}
