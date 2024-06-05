import 'package:flutter/material.dart';

class AddVenue extends StatefulWidget {
  const AddVenue({super.key});

  @override
  State<AddVenue> createState() => _AddVenueState();
}

class _AddVenueState extends State<AddVenue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back,color: Colors.blue.shade900),
        title:Text("Add Venue"),
        actions: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.add,color: Colors.blue.shade900),
         
       ),
      
       
        ],
      ),
                backgroundColor:const Color.fromARGB(255, 70, 109, 166).withOpacity(.6) ,
                body: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                                          height: 600,
                                          width: 350,
                                           decoration:
                                            BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              border: Border.all(color: Colors.blueGrey)
                                           
                                        ),
                                     child:  Column(
                  
                                      
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(right: 50,left: 20),
                       child: TextFormField(
                                                        decoration: InputDecoration(
                                                          hintText: "Venue Name",hintStyle: TextStyle(color: Colors.grey),
                                                         
                                                        ),),
                     ),
                   
                    
                                       Padding(
                                         padding: const EdgeInsets.only(top: 30),
                                         child: Image.asset("assets/image.png",height: 100,width: 100,),
                                       ),
                                                                                 
                                       Padding(
                                         padding: const EdgeInsets.only(right: 20,top: 30,left:20 ),
                                         child: TextFormField(
                                               decoration: InputDecoration(
                                                 hintText: "Location",hintStyle: TextStyle(color: Colors.grey),
                                                
                                               ),
                                             ),
                                       ),
                                          
                                           Padding(
                                             padding: const EdgeInsets.only(right: 20,top: 30,left:20),
                                             child: TextFormField(
                                               decoration: InputDecoration(
                                                 hintText: "Timing",hintStyle: TextStyle(color: Colors.grey),
                                                
                                               ),
                                             ),
                                           ),
                                           SizedBox(
                                            height: 20,
                                           ),
                                           ElevatedButton(onPressed: (){}, child: Text("Submit",style: TextStyle(color: Colors.black),))
                   ],
                                     ),
                                        
                                        
                                         
                                                      
                                          
                                        ),
                ),
    );
  }
}