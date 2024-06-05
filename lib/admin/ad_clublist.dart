import 'package:flutter/material.dart';
import 'package:getsport/admin/add_club.dart';

class ClubList extends StatefulWidget {
  const ClubList({super.key});

  @override
  State<ClubList> createState() => _ClubListState();
}

class _ClubListState extends State<ClubList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back,color: Colors.blue.shade900),
        title:Text("Club List"),
        actions: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.search,color: Colors.blue.shade900),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: 
        //  Icon(Icons.add,color: Colors.blue.shade900),
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddClub()));
        }, icon: Icon(Icons.add,color: Colors.blue.shade900),)
         
       ),
      
       
        ],
      ),
                      backgroundColor:const Color.fromARGB(255, 70, 109, 166).withOpacity(.6) ,
                   body: Expanded(
               child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context,index){
                return 
                 Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: 200,
                                        width: 330,
                                         decoration:
                                          BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color: Colors.blueGrey)
                                         
                                      ),
                                   child:  Column(

                                    
                 children: [
                   Text(
                     'DEIGO NATIONAL CLUB',
                     style: TextStyle(
                         fontSize: 15,
                         fontWeight: FontWeight.bold,
                         color: Colors.white),
                                    ),
                  
                                     Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.only(top: 30),
                                           child: Image.asset("assets/diego.png",height: 120,width: 120,),
                                         ),
                                        
                                         Column(
                                           children: [
                                             Row(
                                               children: [
                                                 Text("Mumbai",style: TextStyle(color: Colors.white,fontSize: 15),),
                                              Icon(Icons.location_on),

                                               ],
                                             ),SizedBox(
                                              height: 30,
                                             ),
                                         Container(
                                          height: 20,width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.blueGrey
                                          ),
                                          child: Text(" coaching classes available",style: TextStyle(color: Colors.white),),
                                         ),
                                         SizedBox(
                                              height: 15,
                                             ),
                                          Container(
                                          height: 20,width: 200,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            color: Colors.blueGrey
                                          ),
                                          child: Text(" Tournament & Events",style: TextStyle(color: Colors.white),),
                                         ),
                                          SizedBox(
                                              height: 15,
                                             ),
                                        //  Text("Timing:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                                        //  Text("Monday- Friday   9:00am-5:00pm",style: TextStyle(fontSize: 12,color: Colors.white),),
                                         Row(
                                          
                                           children: [
                                             ElevatedButton.icon(onPressed: (){}, 
                                             icon: Icon(Icons.edit,color: Colors.blue,),
                                              label: Text("Edit",style: TextStyle(color: Colors.blue))),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              ElevatedButton.icon(onPressed: (){},
                                          icon: Icon(Icons.delete,color: Colors.blue,),
                                           label: Text("Delete",style: TextStyle(color: Colors.blue)))
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
                   ),
                   )
    );
  }
}