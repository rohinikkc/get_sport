import 'package:flutter/material.dart';

class AcademyTournament extends StatefulWidget {
  const AcademyTournament({super.key});

  @override
  State<AcademyTournament> createState() => _AcademyTournamentState();
}

class _AcademyTournamentState extends State<AcademyTournament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
          backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back,color: Colors.blue.shade900),
        title:Text("TournamentList"),
        actions: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.search,color: Colors.blue.shade900),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.add,color: Colors.blue.shade900),
         
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
                     '5A side knockout Tournament',
                     style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                         color: Colors.white),
                                    ),
                  
                                     Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Padding(
                                           padding: const EdgeInsets.only(top: 30,left: 10),
                                           child: Image.asset("assets/map.png",height: 100,width: 100,),
                                         ),
                                        
                                         Column(
                                           children: [
                                             Row(
                                               children: [
                                                 Text("Malappuram",style: TextStyle(color: Colors.white,fontSize: 15),),
                                              Icon(Icons.location_on),

                                               ],
                                             ),SizedBox(
                                              height: 20,
                                             ),
                                             Row(
                                               children: [
                                                 Icon(Icons.date_range_outlined,color: Colors.white,),
                                                 Text("24 july 2024",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),

                                               ],
                                             ),
                                             SizedBox(
                                              height: 20,
                                             ),
                                        //  Text("Monday- Friday   9:00am-5:00pm",style: TextStyle(fontSize: 12,color: Colors.white),),
                                         Padding(
                                           padding: const EdgeInsets.only(left: 10),
                                           child: Row(
                                            
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