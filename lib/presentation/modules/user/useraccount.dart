import 'package:flutter/material.dart';
import 'package:getsport/presentation/modules/trainer/personal_detailpage.dart';

class UserAccount extends StatefulWidget {
  const UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor:Colors.blue.shade900.withOpacity(.6) ,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("roh",style: TextStyle(fontSize: 15),),
           Text("roh@gmail.com",style: TextStyle(fontSize: 12),) 
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
                  Text("Personal Details>>",style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 65),
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalDetail()));
                      },
                      child: Text("Edit",style: TextStyle(color: Colors.blue
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
                child: Row(
                  children: [
                    Text("Qualified Sport>>",style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
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
}