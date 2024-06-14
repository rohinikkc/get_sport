import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/functions.dart';
import 'package:getsport/data/model/coach_model.dart';
import 'package:getsport/presentation/modules/trainer/chat_page.dart';
import 'package:getsport/presentation/widget/helper.dart';
import 'package:provider/provider.dart';

class TabTrainerView
 extends StatelessWidget {
  const TabTrainerView
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Consumer<DBFunctions>(
          builder: (context,search,child) {
            return TextFormField(
              onTap:(){
                search.getAllTrainers();
              } ,
              onChanged: (value) {
                search.serchTrainerByName(value);
              },
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search), hintText: "Search"),
            );
          }
        ),
        leading: const Icon(Icons.arrow_back_ios_new_rounded),
        actions: const [
         
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite),
          )
        ],
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
      ),
      backgroundColor: Colors.blue.shade900.withOpacity(.6),
      body: Consumer<DBFunctions>(
        builder: (context,serch,child) {
          return StreamBuilder<QuerySnapshot>(
                stream: DbController().getAllTrainer(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Helper.indiacator();
                  }
                  List<CoachModel> listOfCoach = [];


                 if(serch.displycoachList .isNotEmpty){

                  listOfCoach=serch.displycoachList;
                 }else{
                   listOfCoach = snapshot.data!.docs
                      .map((e) =>
                          CoachModel.fromJson(e.data() as Map<String, dynamic>))
                      .toList();
                 }
                  if (snapshot.hasData) {
                    return Helper.emptyListWidget(
                        listOfCoach,
                        "No Trainers",
                        ListView.builder(
                            itemCount: listOfCoach.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(20),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(color: const Color.fromARGB(255, 19, 19, 19),borderRadius: BorderRadius.circular(20)),
                                child: Row(children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(listOfCoach[index].profile
                                        ),),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                      const SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            color: Color.fromARGB(255, 206, 206, 206),
                                          ),
                                          Text(
                                            listOfCoach[index].location,
                                            style: const TextStyle(
                                                color: Color.fromARGB(255, 206, 206, 206),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                        Align(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(onPressed: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ChatPage(receiverID:listOfCoach[index].coachId , recieverName: listOfCoach[index].name, recieverProfile: listOfCoach[index].profile)));
                                                                      
                                        }, icon: const Icon(Icons.chat,color: Color.fromARGB(255, 206, 206, 206),)),
                                      ),
                                      ],)
                                      
                                    ],
                                  ),
                                )
                              ]),
                              )
          ;                        }));
                  } else {
                    return const SizedBox();
                  }
                });
        }
      ),
     
      
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
