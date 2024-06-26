import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/event_model.dart';
import 'package:getsport/data/model/product_model.dart';
import 'package:getsport/presentation/modules/admin/add_event.dart';
import 'package:getsport/presentation/modules/admin/add_product.dart';
import 'package:getsport/presentation/modules/club/club_register.dart';
import 'package:getsport/presentation/widget/helper.dart';

class EventList extends StatefulWidget {
  const EventList({super.key});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.blue.shade900)),
          title: const Text("Event List"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.blue.shade900),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  AddEvent(hosterType: "GetSport",)));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add, color: Colors.blue.shade900),
              ),
            ),
          ],
        ),
        backgroundColor:
            const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
        body: StreamBuilder<QuerySnapshot>(
            stream: DbController().getAllEvents(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<EventModel> listOfEvents
               = snapshot.data!.docs
                  .map((e) =>
                      EventModel.fromJson(e.data() as Map<String, dynamic>))
                  .toList();
              if (snapshot.hasData) {
                return listOfEvents
                .isEmpty
                    ? const Center(
                        child: Text("No Events"),
                      )
                    : ListView.builder(
                        itemCount: listOfEvents
                        .length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            // height: 200,
                            width: 330,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.blueGrey)),
                            child: Column(
                              children: [
                               
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(
                                          fit: BoxFit.cover,
                                          listOfEvents
                                          [index].imageUrl,
                                          height: 120,
                                          width: 120,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                         Text(
                                  listOfEvents
                                  [index].eventName,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.currency_rupee,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "Join fee :${listOfEvents
                                              [index]
                                                  .joinfee}"
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      
                          
                                        //  Text("Timing:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                                        //  Text("Monday- Friday   9:00am-5:00pm",style: TextStyle(fontSize: 12,color: Colors.white),),
                                        
                                      ],
                                    ),
                                    const SizedBox()
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                           
                                            ElevatedButton.icon(
                                                onPressed: () {
                                        
                                                  DbController().deleteSelectedDoc("Events", listOfEvents
                                                  [index].eventId);
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.blue,
                                                ),
                                                label: const Text("Delete",
                                                    style: TextStyle(
                                                        color: Colors.blue))),
                                        
                                                        const SizedBox(width: 20,),
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
                                                child: const Text("Registration",
                                                    style: TextStyle(
                                                        color: Colors.blue)),
                                              )
                                          ],
                                        ),
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