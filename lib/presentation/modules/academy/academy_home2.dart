import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/acadamymodel.dart';
import 'package:getsport/presentation/modules/academy/academy_menu.dart';
import 'package:getsport/presentation/modules/academy/academy_reglist.dart';
import 'package:getsport/presentation/modules/academy/academy_tournamentslist.dart';
import 'package:getsport/presentation/modules/academy/academy_venuelist.dart';

class AcademyHomepage extends StatefulWidget {
  const AcademyHomepage({super.key});

  @override
  State<AcademyHomepage> createState() => _AcademyHomepageState();
}

class _AcademyHomepageState extends State<AcademyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AcademyMenu(),
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          leading:
              // Icon(Icons.menu,color: Colors.blue.shade900),
              Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu, color: Colors.blue.shade900));
          }),
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Icon(Icons.search, color: Colors.blue.shade900),
          //   ),
          // ],
        ),
        backgroundColor: Colors.blue.shade900.withOpacity(.8),
        body: Column(children: [
           Padding(
            padding: EdgeInsets.only(right: 200, top: 60),
            child: FutureBuilder(
          future: DbController().getUserData("Acadamy", FirebaseAuth.instance.currentUser!.uid),
           builder: (context,snapshot) {

            if(snapshot.connectionState==ConnectionState.waiting){
              return Center();
            }
            AcadamyModel model=AcadamyModel.fromMap(snapshot.data!.data()! as Map<String,dynamic>);
                return Text(
                 model.acadamyName!.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                );
              }
            ),
          ),
          Container(
            height: 550,
            width: 500,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AcademyTournament()));
                      },
                      icon: Icon(
                        Icons.run_circle,
                        color: Colors.blue.shade900,
                      ),
                      label: const Text(
                        "Tournaments List",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // ElevatedButton.icon(
                    //   onPressed: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) =>  AcademyReglist()));
                    //   },
                    //   icon: Icon(
                    //     Icons.app_registration_outlined,
                    //     color: Colors.blue.shade900,
                    //   ),
                    //   label: const Text(
                    //     "Registration List",
                    //     style: TextStyle(
                    //         color: Colors.black,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 18),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AcademyVenuelist()));
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AcademyTournament()));
                      },
                      icon: Icon(
                        Icons.sports_basketball_sharp,
                        color: Colors.blue.shade900,
                      ),
                      label: const Text(
                        "Venues",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
