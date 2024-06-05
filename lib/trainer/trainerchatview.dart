import 'package:flutter/material.dart';

class TrainerChatview extends StatelessWidget {
  const TrainerChatview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back,color: Colors.blue.shade900),
        title: Row(
          children: [
             ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset("assets/profile.png",
              height: 45,
              width: 45,),
             ),
             Padding(
               padding: const EdgeInsets.all(10),
               child: Text("Lara"),
             )
          ],
        )
      ), 
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context,Index){
          return  Expanded(child: Container(
            color: Colors.blue,
            child: ListView(
              padding: EdgeInsets.all(15),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text("Today",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: Colors.grey,
                  ),
                )),
                SizedBox(height: 20),
                
              ],
            ),
          ));
          
        }),
    );
  }
}