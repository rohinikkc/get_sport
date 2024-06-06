import 'package:flutter/material.dart';
import 'package:getsport/presentation/modules/user/eventview.dart';

class Event extends StatelessWidget {
  const Event({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back,color: Colors.blue.shade900),
        title:Text("EVENTS"),
       
      ),
                      backgroundColor:const Color.fromARGB(255, 70, 109, 166).withOpacity(.6) ,

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
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EventView()));
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
                Image.asset("assets/tournament.png",height: 100,width: 100,),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Event', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Calicut Arena'),
                    Text('Kozhikode'),
                    Text('₹500 per person'),
            
                       
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

         
        

        //   child: Column(
        //     children: [
        //       Image.asset('assets/kabadi.png'),
        //       Text('Kabaddi Championship League'),
        //       Text('Thrissur 300km'),
        //       Row(
        //         children: [
        //           Text('SatJune 12,2024'),
        //           Spacer(),
        //           Text('09:00am - 04:00pm'),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),

       
        // Text('200/Person'),

       
        // ElevatedButton(
        //   onPressed: () {
         
        //     print('Book Now button pressed');
        //   },
        //   child: Text('BOOK NOW'),
        // ),
    ]
    ,)),);
        
    
    
  
  }
}