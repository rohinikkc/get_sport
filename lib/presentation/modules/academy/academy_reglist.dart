import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/regis_event_model.dart';

class AcademyReglist extends StatefulWidget {
  String eventId;
  AcademyReglist({super.key, required this.eventId});

  @override
  State<AcademyReglist> createState() => _AcademyReglistState();
}

class _AcademyReglistState extends State<AcademyReglist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
          title: const Text("Registration  List"),
        ),
        backgroundColor:
            const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
        body: StreamBuilder<QuerySnapshot>(
            stream: DbController().getRegisterdEventsIn(widget.eventId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<RegEventModel> register = snapshot.data!.docs
                  .map((e) =>
                      RegEventModel.fromJson(e.data() as Map<String, dynamic>))
                  .toList();
              if (snapshot.hasData) {
                return register.isEmpty
                    ? const Center(
                        child: Text("No Registration"),
                      )
                    : ListView.builder(
                        itemCount: register.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 60,
                                      child: Image.asset("assets/profile.png"),
                                    ),
                                    title: Text(
                                      register[index].name,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // const Text("Age:24",style: TextStyle(
                                        //   fontSize: 13,color: Colors.white
                                        // ),),
                                        // const Text("Tournament Name",style: TextStyle(
                                        //   fontSize: 13,color: Colors.white
                                        // ),),
                                        Text(
                                          register[index].teamName,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          register[index].phoneNumber,
                                          style: const TextStyle(
                                              fontSize: 13,
                                              color: Colors.white),
                                        ),
                                        // const Text(,style: TextStyle(
                                        //   fontSize: 13,color: Colors.white
                                        // ),),
                                        // const Text("10:30am",style: TextStyle(
                                        //   fontSize: 13,color: Colors.white
                                        // ),),
                                        //  ElevatedButton.icon(onPressed: (){},
                                        //             icon: const Icon(Icons.add_task_outlined,color: Colors.blue,),
                                        //              label: const Text("confirm",style: TextStyle(color: Colors.blue)))
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 30, left: 90),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
              } else {
                return const SizedBox();
              }
            }));
  }
}
