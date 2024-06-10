import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/club_model.dart';
import 'package:getsport/presentation/modules/admin/add_club.dart';

class ClubList extends StatefulWidget {
  const ClubList({super.key});

  @override
  State<ClubList> createState() => _ClubListState();
}

class _ClubListState extends State<ClubList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
          title: const Text("Club List"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.blue.shade900),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    //  Icon(Icons.add,color: Colors.blue.shade900),
                    IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddClub()));
                  },
                  icon: Icon(Icons.add, color: Colors.blue.shade900),
                )),
          ],
        ),
        backgroundColor:
            const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
        body: StreamBuilder<QuerySnapshot>(
            stream: DbController().getAllClubs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<ClubModel> clubs = snapshot.data!.docs
                  .map((e) =>
                      ClubModel.fromJosn(e.data() as Map<String, dynamic>))
                  .toList();
              if (snapshot.hasData) {
                return clubs.isEmpty
                    ? const Center(
                        child: Text("No Clubs"),
                      )
                    : ListView.builder(
                        itemCount: clubs.length,
                        itemBuilder: (context, index) {
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
                                    clubs[index].name,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: Image.network(
                                          clubs[index].clubImage,
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                clubs[index].location,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                              Icon(Icons.location_on),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          // Container(
                                          //   height: 20,
                                          //   width: 200,
                                          //   decoration: BoxDecoration(
                                          //       borderRadius:
                                          //           BorderRadius.circular(20),
                                          //       color: Colors.blueGrey),
                                          //   child: const Text(
                                          //     " coaching classes available",
                                          //     style: TextStyle(
                                          //         color: Colors.white),
                                          //   ),
                                          // ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          // Container(
                                          //   height: 20,
                                          //   width: 200,
                                          //   decoration: BoxDecoration(
                                          //       borderRadius:
                                          //           BorderRadius.circular(20),
                                          //       color: Colors.blueGrey),
                                          //   child: const Text(
                                          //     " Tournament & Events",
                                          //     style: TextStyle(
                                          //         color: Colors.white),
                                          //   ),
                                          // ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          //  Text("Timing:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                                          //  Text("Monday- Friday   9:00am-5:00pm",style: TextStyle(fontSize: 12,color: Colors.white),),
                                          Row(
                                            children: [
                                              ElevatedButton.icon(
                                                  onPressed: () {
                                                    _callForEdit(clubs[index]);
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
                                                            "Clubs",
                                                            clubs[index].id);
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
                      );
              } else {
                return const SizedBox();
              }
            }));
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  _callForEdit(ClubModel model) {
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
                                  DbController().updateClubData(ClubModel(
                                      regId: model.regId,
                                      clubImage: model.clubImage,
                                      email: model.email,
                                      id: model.id,
                                      name: nameController.text,
                                      location: locationController.text));
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
