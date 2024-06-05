import 'package:flutter/material.dart';

class ClubAccount extends StatefulWidget {
  const ClubAccount({super.key});

  @override
  State<ClubAccount> createState() => _ClubAccountState();
}

class _ClubAccountState extends State<ClubAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Real Madrid Club",style: TextStyle(fontSize: 15),),
           Text("Madrid@gmail.com",style: TextStyle(fontSize: 12),) 
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
                  Text("Details>>",style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: Text("Edit",style: TextStyle(color: Colors.blue
                    ),
                    ),
                    
                    
                  )
                ],
              ), 
            ),
            
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: Container(
            //     height: 80,
            //     width:double.infinity ,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       color: Colors.grey.shade200,
                  
            //     ),
            //     child: Row(
            //       children: [
            //         Text("Qualified Sport>>",style: TextStyle(fontSize: 20),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(left: 100),
            //           child: Text("Edit",style: TextStyle(color: Colors.blue
            //           ),
            //           ),
                      
                      
                      
            //         )
            //       ],
            //     ), 
            //   ),
            // ),
          ],
          
        ),
      
      ),

    );
  }
}