import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:getsport/auth/login_screen.dart';
import 'package:getsport/venue.dart';

class Pagethree extends StatelessWidget {
  const Pagethree({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      backgroundColor:Colors.blue.shade900.withOpacity(.6),
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_sharp)),
        backgroundColor: Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        actions: [TextButton(onPressed: (){
                log('===========================signuout succes ==========================================');

          FirebaseAuth.instance.signOut().then((value) =>  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),)));
         
        }, child: Text('logout'))],
      ),
     
  body: 
  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SizedBox(
          height: 50,
          width: 400,
           child: TextFormField(
                  decoration: InputDecoration(
                   hintText: 'search',
                   hintStyle: TextStyle(color: Colors.white,),
                   
                  //  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 255, 247, 0),width: 5)),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(7),
                     borderSide: const BorderSide(color: Colors.white,width: 5)
                     
                   )
                  ),
                 ),
         ),
  Expanded(child: ListView.builder(itemCount: 5,itemBuilder: (context,index){
    return Padding(padding: EdgeInsets.all(10),
    child: 
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Venue()));
        },
        child: Container(
          
        height: 140,
        width: 400,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,width: 1),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/ven.jpg"),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Venue', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Calicut Arena'),
                    Text('Kozhikode'),
                    Text('₹500 per hour'),
            
                       
                  ],
                ),
              ],
            ),
          ),
        
        ],)
            
             
        
          
            ),
      )
    );

   
    
  })),
  
  
        // Venue section
        
        // SizedBox(height: 20),
  
        // // Event section
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Image.asset("assets/image 34.png"),
        //     SizedBox(width: 10),
        //     Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text('Event', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        //         Text('Soccer Championship'),
        //         Text('Kozhikode'),
        //         Text('₹200 per ticket'),
        //       ],
        //     ),
        //   ],
        // ),
  
        // SizedBox(height: 20),
  
        // // Match section
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text('UK Beach Soccer Championships 2024', style: TextStyle(fontSize: 16)),
        //     Text('20 May 2024, 05:00 PM'),
        //   ],
        // ),
  
        SizedBox(height: 20),
  
        // Book button
        
      ],
    ),
  ),
);
  
  }
}