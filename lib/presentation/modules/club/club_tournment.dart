import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/event_model.dart';
import 'package:getsport/presentation/modules/admin/add_event.dart';
import 'package:getsport/presentation/modules/club/club_register.dart';

class ClubTournament extends StatefulWidget {
  const ClubTournament({super.key});

  @override
  State<ClubTournament> createState() => _ClubTournamentState();
}

class _ClubTournamentState extends State<ClubTournament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
          title: const Text("TournamentList"),
          actions: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Icon(Icons.search, color: Colors.blue.shade900),
            // ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddEvent(hosterType: "Club")));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        backgroundColor:
            const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
        body: StreamBuilder<QuerySnapshot>(
            stream: DbController().fetchCurrentModuleEvents(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              List<EventModel> listOfEvents = snapshot.data!.docs
                  .map((e) =>
                      EventModel.fromJson(e.data() as Map<String, dynamic>))
                  .toList();
              if (snapshot.hasData) {
                return listOfEvents.isEmpty
                    ? const Center(
                        child: Text("No Events"),
                      )
                    : ListView.builder(
                        itemCount: listOfEvents.length,
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
                                    listOfEvents[index].eventName,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30, left: 10),
                                        child: Image.network(
                                          listOfEvents[index].imageUrl,
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                listOfEvents[index].location,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                              const Icon(Icons.location_on),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.date_range_outlined,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                listOfEvents[index].timig,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          //  Text("Monday- Friday   9:00am-5:00pm",style: TextStyle(fontSize: 12,color: Colors.white),),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              children: [
                                                ElevatedButton.icon(
                                                    onPressed: () {
                                                      DbController()
                                                          .deleteSelectedDoc(
                                                              "Events",
                                                              listOfEvents[
                                                                      index]
                                                                  .eventId);
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.blue,
                                                    ),
                                                    label: const Text("Delete",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.blue))),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ClubRegister(
                                                                  eventId: listOfEvents[
                                                                          index]
                                                                      .eventId!,
                                                                )));
                                                  },
                                                  child: Text("Resitesration",
                                                      style: TextStyle(
                                                          color: Colors.blue)),
                                                )
                                              ],
                                            ),
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
}
