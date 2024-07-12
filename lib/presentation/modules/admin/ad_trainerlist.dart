import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/coach_model.dart';
import 'package:getsport/presentation/modules/admin/add_trainer.dart';
import 'package:getsport/presentation/widget/helper.dart';

class TrainerList extends StatefulWidget {
  const TrainerList({super.key});

  @override
  State<TrainerList> createState() => _TrainerListState();
}

class _TrainerListState extends State<TrainerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
          title: const Text("Coach List"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.blue.shade900),
            ),
            //  Icon(Icons.add,color: Colors.blue.shade900),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddTrainer()));
              },
              icon: Icon(Icons.add, color: Colors.blue.shade900),
            )
          ],
        ),
        backgroundColor:
            const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
        body: StreamBuilder<QuerySnapshot>(
            stream: DbController().getAllTrainer(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Helper.indiacator();
              }
              List<CoachModel> coachList = [];

              coachList = snapshot.data!.docs
                  .map((e) =>
                      CoachModel.fromJson(e.data() as Map<String, dynamic>))
                  .toList();

              if (snapshot.hasData) {
                return Helper.emptyListWidget(
                    coachList,
                    "No Coachs",
                    ListView.builder(
                      itemCount: coachList.length,
                      itemBuilder: (context, index) {
                        var coach = coachList[index];
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
                                  coach.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  coach.description,
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
                                        coach.profile,
                                        height: 80,
                                        width: 80,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              coach.location,
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
                                          "Monday- Friday   ${coach.fromTIme}-${coach.toTime}",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        Row(
                                          children: [
                                            ElevatedButton.icon(
                                                onPressed: () {
                                                  _callForEdit(coach);
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
                                                          "Coachs",
                                                          coach.coachId);
                                                          
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
  TimeOfDay? fromTime;
  TimeOfDay? toTime;

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sportsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  _getTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
   
      fromTime = selectedTime;
       setState(() {
      // periodOfDay = fromTime!.period.toString().split(".")[1];
    });
  }

  // String periodOfDay = "";
  _getToTime() async {
    TimeOfDay? selectedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
   
      toTime = selectedTime;
       setState(() {
      // periodOfDay = fromTime!.period.toString().split(".")[1];
    });
  }

  _callForEdit(CoachModel coach) {
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
                        controller: descriptionController,
                        decoration: const InputDecoration(
                            hintText: "Description",
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
                                if (_formKey.currentState!.validate()) {
                                  if (fromTime != null && toTime != null) {
                                    DbController().updateTrainerData(CoachModel(
                                      certificate:coach.certificate ,
                                        coachId: coach.coachId,
                                        description: descriptionController.text,
                                        email: coach.email,
                                        fromTIme:
                                            "${fromTime!.hour}:${fromTime!.minute} ${fromTime!.period.name.toUpperCase()}",
                                        location: locationController.text,
                                        name: nameController.text,
                                        profile: coach.profile,
                                        toTime:
                                            "${toTime!.hour}:${toTime!.minute} ${toTime!.period.name.toUpperCase()}",
                                        trainingClass: sportsController.text));
                                        Navigator.pop(context);
                                        nameController.clear();
                                        descriptionController.clear();
                                        locationController.clear();
                                        sportsController.clear();
                                        fromTime=null;
                                        toTime=null;
                                        
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
}
