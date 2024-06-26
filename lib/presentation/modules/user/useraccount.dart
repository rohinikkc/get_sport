import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/usermodel.dart';
import 'package:getsport/presentation/modules/trainer/personal_detailpage.dart';
import 'package:getsport/presentation/modules/user/personal_details.dart';
import 'package:getsport/presentation/widget/helper.dart';

class UserAccount extends StatefulWidget {
  
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DbController().getUserData("user", FirebaseAuth.instance.currentUser!.uid),
      builder: (context,snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Helper.indiacator();
        }
        UserModel userModel=UserModel.fromMap(snapshot.data!.data()as Map<String,dynamic>);
        return Scaffold(
                backgroundColor:Colors.blue.shade900.withOpacity(.6) ,
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon:const Icon(Icons.arrow_back)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userModel.name,style: const TextStyle(fontSize: 15),),
               Text(userModel.email,style: const TextStyle(fontSize: 12),) 
              ],
            ),
            actions: [
               CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/pro.png"),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  height: 80,
                  width:double.infinity ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                    
                  ),
                  child: Row(
                    children: [
                      const Text("Personal Details>>",style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 65),
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditProfile()));
                          },
                          child: const Text("Edit",style: TextStyle(color: Colors.blue
                          ),
                          ),
                        ),
                        
                        
                      )
                    ],
                  ), 
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 80,
                    width:double.infinity ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                      
                    ),
                    child: const Row(
                      children: [
                        Text("Qualified Sport>>",style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 100),
                          child: Text("Edit",style: TextStyle(color: Colors.blue
                          ),
                          ),
                          
                          
                          
                        )
                      ],
                    ), 
                  ),
                ),
              ],
              
            ),
          
          ),
        
        );
      }
    );
  }
}