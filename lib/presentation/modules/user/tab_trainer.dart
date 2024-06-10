import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/coach_model.dart';
import 'package:getsport/presentation/widget/helper.dart';

class TabTrainerView
 extends StatelessWidget {
  const TabTrainerView
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite),
          )
        ],
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
      ),
      backgroundColor: Colors.blue.shade900.withOpacity(.6),
      body: Expanded(
        child:StreamBuilder<QuerySnapshot>(
              stream: DbController().getAllTrainer(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Helper.indiacator();
                }
                List<CoachModel> listOfCoach = [];
                listOfCoach = snapshot.data!.docs
                    .map((e) =>
                        CoachModel.fromJson(e.data() as Map<String, dynamic>))
                    .toList();
                if (snapshot.hasData) {
                  return Helper.emptyListWidget(
                      listOfCoach,
                      "No Academy",
                      ListView.builder(
                          itemCount: listOfCoach.length,
                          itemBuilder: (context, index) {
                            return Row(children: [
                              SizedBox(
                                  height: 200,
                                  width: 150,
                                  child: Image.network(
                                      fit: BoxFit.cover,
                                      listOfCoach[index].profile)),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 170),
                                child: Column(
                                  children: [
                                    Text(
                                      listOfCoach[index]
                                          .name
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 70),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            listOfCoach[index].location,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20)),
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ]);
                          }));
                } else {
                  return const SizedBox();
                }
              }) ),
     
      
          // Text(
          //   'Feathrall Coaching Classes',
          //   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          // ),
          // Text('Football clup'),
          // SizedBox(height: 10.0),
          // Text(
          //   'DIEGO FOOTBALL ACADEMY',
          //   style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          // ),
          // Text('Malappuram'),
          // Text('42'),
          // Text('Football Coaching Classes'),
          // Text('Football club'),
        
      );
    
  }
}
