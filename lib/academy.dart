import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Academy extends StatelessWidget {
  const Academy({super.key});

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
        child:ListView.builder(
          itemCount: 5,
          itemBuilder: (context,Index){
        return 
         Row(
        children: [
          Image.asset("assets/ak2.png"),
      
          Padding(
            padding:  EdgeInsets.only(bottom: 170),
            child:  Column(
              children: [
                Text(
                  'AK2 FOOTBALL ACADEMY',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 70),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      Text(
                        "Malappuram",
                        style: TextStyle(
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                      color: Colors.blue,
                      ),   
                    ),
                  ],
                )
              ],
            ),
        
          )]);
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
