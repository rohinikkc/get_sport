import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/event_model.dart';
import 'package:getsport/data/model/message_model.dart';

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
        body: StreamBuilder<QuerySnapshot>(
          stream: DbController().getAllEvents(),
          builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<EventModel> list = snapshot.data!.docs
                .map((e) =>
                    EventModel.fromJson(e.data() as Map<String, dynamic>))
                .toList();

            if (snapshot.hasData) {
            return ListView.separated(itemBuilder: (context,index){
              return Column(
              children: [
                 Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(list[index].eventName,
                  style: TextStyle(color: Colors.white,fontSize: 18),),
                ),
                Row(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.only(right:10),
                      child: Image.network(list[index].imageUrl,height:130,width: 130,),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(list[index].time,style: TextStyle(color: Colors.white ,fontWeight: FontWeight.w200),),
                          Padding(
                           padding: EdgeInsets.only(right: 50),
                           child: Row(
                             children: [
                              
                               Icon(Icons.location_on,color: Colors.white,),
                               
                               Text(list[index].location,style: TextStyle(color:Colors.white),
                               ),
                           
                             ],
                           ),
                         ),
                         Text("Join Fee ${list[index].joinfee}",style: TextStyle(color: Colors.white),),
                       
                     
                    //  ElevatedButton.icon(onPressed: (){}, 
                    //  icon: Icon(Icons.delete,color: Colors.blue.shade900,), label: Text("Delete",style: TextStyle(color: Colors.blue.shade900),)),
                    //  ElevatedButton.icon(onPressed: (){}, 
                    //  icon: Icon(Icons.turned_in_not_rounded,color: Colors.blue.shade900,), label: Text("Confirm",style: TextStyle(color: Colors.blue.shade900),))
                      ],
                    ),
                    
                   
                  ],
                  
                )
              ],
            );
            
            }, separatorBuilder: (context, index) => const SizedBox(height: 20,), itemCount: list.length);
          }else{
            return SizedBox();
          }
          
          }
        )

        
        );
    
  }
}