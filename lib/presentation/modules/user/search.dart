import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/functions.dart';
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
import 'package:getsport/presentation/widget/rating_bar.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  String selectedType;
  Search({super.key, required this.selectedType});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
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
              // IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MapPage()));
                  },
                  icon: const Icon(Icons.location_on))
            ],
            backgroundColor:
                const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          ),
          body: Consumer<DBFunctions>(builder: (context, controller, child) {
            return FutureBuilder(
                future: controller.getcCurrentLatLonPosition(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return AlertDialog(
                      elevation: 10,
                      shape: const ContinuousRectangleBorder(),
                      title: Row(
                        children: [
                          const Spacer(),
                          Helper.indiacator(),
                          const Spacer(),
                          const Text(
                            "Fething Location...",
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return AlertDialog(
                      elevation: 10,
                      shape: const ContinuousRectangleBorder(),
                      title: Row(
                        children: [
                          const Spacer(),
                          const Spacer(),
                          Text(
                            snapshot.error.toString(),
                            style: TextStyle(fontSize: 15),
                          ),
                          const Spacer(),
                        ],
                      ),
                    );
                  }
                  return TabBarView(children: [
                    FutureBuilder(
                        future: DbController().getAllEventsinCurrentLocation(
                            Provider.of<DBFunctions>(context, listen: false)
                                .position!,
                            widget.selectedType),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Helper.indiacator();
                          }
                          List<EventModel> listOfEvents = [];
                          listOfEvents = snapshot.data!
                              .map((e) => EventModel.fromJson(
                                  e.data() as Map<String, dynamic>))
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
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.blue.shade300),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: SizedBox(
                                                    height: 200,
                                                    width: 150,
                                                    child: Image.network(
                                                        listOfEvents[index]
                                                            .imageUrl),
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 30,
                                                              bottom: 5),
                                                      child: Text(
                                                        listOfEvents[index]
                                                            .eventName
                                                            .toUpperCase(),
                                                        style: const TextStyle(
                                                            letterSpacing: 2,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      child: Row(
                                                        children: [
                                                          const Icon(Icons
                                                              .location_on),
                                                          Text(
                                                              listOfEvents[index]
                                                                  .location
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      14)),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        FutureBuilder(
                                                            future: DbController()
                                                                .getRegEventCount(
                                                                    listOfEvents[
                                                                            index]
                                                                        .eventId),
                                                            builder: (context,
                                                                snapshot) {
                                                              if (snapshot
                                                                      .connectionState ==
                                                                  ConnectionState
                                                                      .waiting) {
                                                                return Text(
                                                                    "calulating...");
                                                              }
                                                              return Text(
                                                                "Remining Slote :${listOfEvents[index].targetPartipent - snapshot.data!}",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                              );
                                                            }),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                            "Reg. Fee :₹${listOfEvents[index].joinfee}"),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Text(
                                                            "Timing: ${listOfEvents[index].time}"),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                        "Hosted by: ${listOfEvents[index].eventHoster}"),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        FutureBuilder(
                                            future: DbController()
                                                .getRegEventCount(
                                                    listOfEvents[index]
                                                        .eventId),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                              final availableSlote =
                                                  listOfEvents[index]
                                                          .targetPartipent -
                                                      snapshot.data!;
                                              return ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              availableSlote ==
                                                                      0
                                                                  ? Colors.grey
                                                                  : Colors
                                                                      .green),
                                                  onPressed: () {
                                                    if (availableSlote != 0) {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      EventView(
                                                                        model: listOfEvents[
                                                                            index],
                                                                      )));
                                                    }
                                                  },
                                                  child: Text(
                                                    availableSlote == 0
                                                        ? "Slote Full"
                                                        : "Resister Now",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ));
                                            })
                                      ],
                                    );
                                  },
                                ));
                          } else {
                            return const SizedBox();
                          }
                        }),
                    // Center(child: Text("event")),
                    // Center(child: Text("venues")),
                    // Center(child: Text("clubs")),
                    FutureBuilder(
                        future: DbController().getAllVenuesinCurrentLocation(
                            Provider.of<DBFunctions>(context, listen: false)
                                .position!,
                            widget.selectedType),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Helper.indiacator();
                          }
                          List<VenueModel> listofVenues = [];
                          listofVenues = snapshot.data!
                              .map((e) => VenueModel.fromJosn(
                                  e.data() as Map<String, dynamic>))
                              .toList();

                          if (snapshot.hasData) {
                            return Helper.emptyListWidget(
                                listofVenues,
                                "No Venues",
                                ListView.builder(
                                  itemCount: listofVenues.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onLongPress: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: const Text(
                                                "Rate for this venue"),
                                            content: CustomeRatingBar(
                                              isConst: false,
                                              itemSized: 40,
                                              initialRating: 0,
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    FirebaseFirestore.instance
                                                        .collection("Venues")
                                                        .doc(listofVenues[index]
                                                            .venueID!)
                                                        .update({
                                                      "rating": listofVenues[
                                                                  index]
                                                              .rating +
                                                          Provider.of<DBFunctions>(
                                                                  context,
                                                                  listen: false)
                                                              .ratingStar!
                                                    }).then((value) {
                                                      Provider.of<DBFunctions>(
                                                              context,
                                                              listen: false)
                                                          .clearRating();
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                  child: const Text("Rate"))
                                            ],
                                          ),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.5),
                                            child: Container(
                                              height: 200,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue.shade300),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Image.network(
                                                        listofVenues[index]
                                                            .imageUrl),
                                                  ),
                                                  Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 30,
                                                                bottom: 30),
                                                        child: Text(
                                                          listofVenues[index]
                                                              .venueName,
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 80),
                                                        child: Row(
                                                          children: [
                                                            const Icon(Icons
                                                                .location_on),
                                                            Text(listofVenues[
                                                                    index]
                                                                .location),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 100),
                                                        child: Row(
                                                          children: [
                                                            const Icon(Icons
                                                                .currency_rupee),
                                                            Text(listofVenues[
                                                                    index]
                                                                .price
                                                                .toString()),
                                                          ],
                                                        ),
                                                      ),
                                                      CustomeRatingBar(
                                                          isConst: true,
                                                          initialRating:
                                                              CustomeRatingBar.rating(
                                                                  listofVenues[
                                                                          index]
                                                                      .rating
                                                                      .toDouble()))
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.green),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            VenueView(
                                                              model:
                                                                  listofVenues[
                                                                      index],
                                                            )));
                                              },
                                              child: const Text(
                                                "Book Now",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))
                                        ],
                                      ),
                                    );
                                  },
                                ));
                          } else {
                            return const SizedBox();
                          }
                        }),
                    FutureBuilder(
                        future: DbController().getAllClubsinCurrentLocation(
                          Provider.of<DBFunctions>(context, listen: false)
                              .position!,
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Helper.indiacator();
                          }
                          List<ClubModel> listOfClubs = [];
                          listOfClubs = snapshot.data!
                              .map((e) => ClubModel.fromJosn(
                                  e.data() as Map<String, dynamic>))
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
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.blue.shade300),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: Image.network(
                                                      listOfClubs[index]
                                                          .clubImage),
                                                ),
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 30,
                                                              bottom: 30),
                                                      child: Text(
                                                        listOfClubs[index].name,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 80),
                                                      child: Row(
                                                        children: [
                                                          const Icon(Icons
                                                              .location_on),
                                                          Text(
                                                              listOfClubs[index]
                                                                  .location),
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
                                  },
                                ));
                          } else {
                            return const SizedBox();
                          }
                        }),
                  ]);
                });
          }),
        ));
  }
}
