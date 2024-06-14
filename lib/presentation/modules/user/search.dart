import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/club_model.dart';
import 'package:getsport/data/model/event_model.dart';
import 'package:getsport/data/model/venue_model.dart';
import 'package:getsport/presentation/modules/user/event.dart';
import 'package:getsport/presentation/modules/user/eventview.dart';
import 'package:getsport/presentation/modules/user/map.dart';
import 'package:getsport/presentation/modules/user/menubar.dart';
import 'package:getsport/presentation/modules/user/venue.dart';
import 'package:getsport/presentation/modules/user/venue_view.dart';
import 'package:getsport/presentation/widget/helper.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
                tabs: [
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 10),
                    child: Tab(text: "Events"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Tab(text: "Venues"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Tab(text: "Clubs"),
                  ),
                ],
                indicatorColor: Colors.purple,
                indicatorWeight: 20,
                // indicator: BoxDecoration(borderRadius: BorderRadius.circular(10),
                // color: Colors.purple),
                isScrollable: true),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Menu()));
              },
              icon: const Icon(Icons.menu),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(onPressed: () {
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapPage()));

              }, icon: const Icon(Icons.location_on))
            ],
            backgroundColor:
                const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          ),
          body: TabBarView(children: [
            StreamBuilder<QuerySnapshot>(
                stream: DbController().getAllEvents(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Helper.indiacator();
                  }
                  List<EventModel> listOfEvents = [];
                  listOfEvents = snapshot.data!.docs
                      .map((e) =>
                          EventModel.fromJson(e.data() as Map<String, dynamic>))
                      .toList();

                  if (snapshot.hasData) {
                    return Helper.emptyListWidget(
                        listOfEvents,
                        "No Events",
                        ListView.builder( 

                          itemCount: listOfEvents.length,
                          itemBuilder: (context, index) {
                          return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.5),
                              child: Container(
                                height: 200,
                                width: 400,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue.shade300),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child:
                                          Image.network(listOfEvents[index].imageUrl),
                                    ),
                                     Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30, bottom: 30),
                                          child: Text(
                                            listOfEvents[index].eventName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 80),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.location_on),
                                              Text(listOfEvents[index].location),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 100),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.currency_rupee),
                                              Text(listOfEvents[index].joinfee),
                                            ],
                                          ),
                                        ),
                                         const SizedBox(
                                          height: 10,
                                        ),
                                        Text("Hosted by: ${listOfEvents[index].eventHoster}"),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  EventView(model: listOfEvents[index],)));
                                },
                                child: const Text("Resister"))
                          ],
                        );
                        },));
                  } else {
                    return const SizedBox();
                  }
                }),
            // Center(child: Text("event")),
            // Center(child: Text("venues")),
            // Center(child: Text("clubs")),
            StreamBuilder<QuerySnapshot>(
                stream: DbController().getAllVenues(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Helper.indiacator();
                  }
                  List<VenueModel> listofVenues = [];
                  listofVenues = snapshot.data!.docs
                      .map((e) =>
                          VenueModel.fromJosn(e.data() as Map<String, dynamic>))
                      .toList();

                  if (snapshot.hasData) {
                    return Helper.emptyListWidget(
                        listofVenues,
                        "No Venues",
                        ListView.builder( 
                          itemCount: listofVenues.length,
                          itemBuilder: (context, index) {
                          return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.5),
                              child: Container(
                                height: 200,
                                width: 400,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue.shade300),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child:
                                          Image.network(listofVenues[index].imageUrl),
                                    ),
                                     Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30, bottom: 30),
                                          child: Text(
                                            listofVenues[index].venueName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 80),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.location_on),
                                              Text(listofVenues[index].location),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 100),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.currency_rupee),
                                              Text(listofVenues[index].price.toString()),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>  VenueView(model: listofVenues[index],)));
                                },
                                child: const Text("BOOK"))
                          ],
                        );
                        },));
                  } else {
                    return const SizedBox();
                  }
                }), StreamBuilder<QuerySnapshot>(
                stream: DbController().getAllClubs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Helper.indiacator();
                  }
                  List<ClubModel> listOfClubs = [];
                  listOfClubs = snapshot.data!.docs
                      .map((e) =>
                          ClubModel.fromJosn(e.data() as Map<String, dynamic>))
                      .toList();

                  if (snapshot.hasData) {
                    return Helper.emptyListWidget(
                        listOfClubs,
                        "No Clubs",
                        ListView.builder( 
                          itemCount: listOfClubs.length,
                          itemBuilder: (context, index) {
                          return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.5),
                              child: Container(
                                height: 200,
                                width: 400,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue.shade300),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child:
                                          Image.network(listOfClubs[index].clubImage),
                                    ),
                                     Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 30, bottom: 30),
                                          child: Text(
                                            listOfClubs[index].name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 80),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.location_on),
                                              Text(listOfClubs[index].location),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        // Padding(
                                        //   padding: EdgeInsets.only(right: 100),
                                        //   child: Row(
                                        //     children: [
                                        //       Icon(Icons.currency_rupee),
                                        //       Text(listOfClubs[index),
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // ElevatedButton(
                            //     onPressed: () {
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //               builder: (context) => const Event()));
                            //     },
                            //     child: const Text("BOOK"))
                          ],
                        );
                        },));
                  } else {
                    return const SizedBox();
                  }
                }),
          ]),
        ));
  }
}
