import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/usermodel.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
          title: const Text("Users List"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.blue.shade900),
            ),
            
          ],
        ),
        backgroundColor:
            const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
        body: StreamBuilder<QuerySnapshot>(
            stream: DbController().getAllUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<UserModel> listofUsers

               = snapshot.data!.docs
                  .map((e) =>
                      UserModel.fromMap(e.data() as Map<String, dynamic>))
                  .toList();
              if (snapshot.hasData) {
                return listofUsers

                .isEmpty
                    ? const Center(
                        child: Text("No Users"),
                      )
                    : ListView.builder(
                        itemCount: listofUsers

                        .length,
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
                                    listofUsers

                                    [index].name,
                                    style: const TextStyle(
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
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                            fit: BoxFit.cover,
                                            listofUsers

                                            [index].imageUrl!,
                                            height: 120,
                                            width: 120,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          const Row(
                                            children: [
                                              Icon(
                                                Icons.currency_rupee,
                                                color: Colors.white,
                                              ),
                                             
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),

                                          //  Text("Timing:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                                          //  Text("Monday- Friday   9:00am-5:00pm",style: TextStyle(fontSize: 12,color: Colors.white),),
                                          Row(
                                            children: [
                                             
                                              ElevatedButton.icon(
                                                  onPressed: () {

                                                    DbController().deleteSelectedDoc("user", listofUsers

                                                    [index].id);
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
}