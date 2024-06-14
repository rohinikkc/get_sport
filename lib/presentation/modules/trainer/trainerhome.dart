import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/functions.dart';
import 'package:getsport/data/model/usermodel.dart';
import 'package:getsport/presentation/modules/trainer/trainer_notification.dart';
import 'package:getsport/presentation/modules/trainer/chat_page.dart';
import 'package:getsport/presentation/modules/trainer/trainermenu.dart';
import 'package:provider/provider.dart';

class TrainerHome extends StatelessWidget {
  const TrainerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const TrainerMenu(),
        appBar: AppBar(
          backgroundColor:
              const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          leading: Builder(builder: (context) {
            return InkWell(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(Icons.menu, color: Colors.blue.shade900));
          }),

          title: Consumer<DBFunctions>(
            builder: (context,search,child) {
              return TextFormField(
                onTap: ()async {
           search.getUserData();
                },
                onChanged: (value){
                  search.serchUserByName(value,);
                },
                decoration: InputDecoration(hintText: "Search",suffixIcon:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search, color: Colors.blue.shade900),
              ),
               ),
              
              );
            }
          ),
          actions: [

            
          
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TrainerNot()));
                },
                icon: Icon(Icons.notifications, color: Colors.blue.shade900))
          ],
        ),
        backgroundColor: Colors.blue.shade900.withOpacity(.8),
        body: Column(children: [
          const Padding(
            padding: EdgeInsets.only(right: 200, top: 60),
            child: Text(
              "Messages",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10)),
              child: Consumer<DBFunctions>(
                builder: (context,serching,child) {
                  return StreamBuilder<QuerySnapshot>(
                      stream: DbController().getAllUsers(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                         List<UserModel> users =[];
                        if(serching.displyUserList.isNotEmpty){
                          users=serching.displyUserList;

                        }else{
                         users = snapshot.data!.docs
                            .map((e) => UserModel.fromMap(
                                e.data() as Map<String, dynamic>))
                            .toList();

                        }
                  
                       
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(
                                   receiverID: users[index].id!,
                                   recieverName: users[index].name, 
                                   recieverProfile: users[index].imageUrl??"",
                  
                                  )));
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          radius: 60,
                                          child: users[index].imageUrl == ""
                                              ? Image.asset(
                                                fit: BoxFit.contain,
                                                "assets/profile.png")
                                              : Image.network(
                                                  fit: BoxFit.fill,
                                                  users[index].imageUrl!),
                                        ),
                                        title:  Text(
                                          users[index].name,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: const Text(
                                          "online",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        trailing: const Text("10:20am"),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(right: 30, left: 90),
                                      child: Divider(
                                        thickness: .5,
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
                      });
                }
              ),
            ),
          ),
        ]));
  }

  
}
