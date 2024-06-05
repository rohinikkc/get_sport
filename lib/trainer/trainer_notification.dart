import 'package:flutter/material.dart';

class TrainerNot extends StatefulWidget {
  const TrainerNot({super.key});

  @override
  State<TrainerNot> createState() => _TrainerNotState();
}

class _TrainerNotState extends State<TrainerNot> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
 appBar: AppBar(
          backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back,color: Colors.blue.shade900),
        actions: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.search,color: Colors.blue.shade900),
       ),
       
        ],
      ),
   
        backgroundColor: Colors.blue.shade900.withOpacity(.8),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Jam Drop Group FootBall drills ",
              style: TextStyle(color: Colors.white,fontSize: 18),),
            ),
            Row(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Padding(
                  padding: const EdgeInsets.only(right:10),
                  child: Image.asset("assets/ftball.png",height:130,width: 130,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("10 July 2024 ,10:30am",style: TextStyle(color: Colors.white ,fontWeight: FontWeight.w200),),
                     Padding(
                       padding: const EdgeInsets.only(right: 50),
                       child: Row(
                         children: [
                          
                           Icon(Icons.location_on,color: Colors.white,),
                           
                           Text("Bangalore",style: TextStyle(color:Colors.white),
                           ),
                       
                         ],
                       ),
                     ),
                    Text("Group Training",style: TextStyle(color: Colors.white),),
                   
                 
                 ElevatedButton.icon(onPressed: (){}, 
                 icon: Icon(Icons.delete,color: Colors.blue.shade900,), label: Text("Delete",style: TextStyle(color: Colors.blue.shade900),)),
                 ElevatedButton.icon(onPressed: (){}, 
                 icon: Icon(Icons.turned_in_not_rounded,color: Colors.blue.shade900,), label: Text("Confirm",style: TextStyle(color: Colors.blue.shade900),))
                  ],
                ),
                
               
              ],
              
            )
          ],
        ),
        );
    
  }
}