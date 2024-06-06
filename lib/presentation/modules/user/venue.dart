import 'package:flutter/material.dart';

class Venue extends StatelessWidget {
  const Venue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView( 
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        
        Image.asset(
          "assets/venue.png", 
          width: double.infinity,
          height: 200, 
        ),

        // SizedBox(height: 20), 
        
       
         Column(
          
          children: [
          
            Text("Cavery basketball court",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.black),),
            Row(
              children: [
                Icon(Icons.schedule,color: Colors.blue),
                Text("9:30am-7:30pm",style: TextStyle(color: Colors.black.withOpacity(0.8))),


              ],
            ), SizedBox(height: 10,),
            Row(
              children: [
                Icon(Icons.location_on_outlined,color: Colors.blue,),
                Text("thrissur",style: TextStyle(color: Colors.black.withOpacity(0.8)) ,)
              ],
            ),
         Padding(
           padding: EdgeInsets.only(right: 160,top: 20),
           child: Text(
                  'Available Sports:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
             ),
             
         ), ],
        ),

        SizedBox(height: 10), 

        
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Text('Basketball'),
            Text('Table Tennis'),
          ],
        ),

        SizedBox(height: 20), 

       
        const Row(
          children: [
            Text(
              'Amenities:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        const SizedBox(height: 10), 

        
        const Wrap(
          spacing: 10.0, 
          runSpacing: 10.0, 
          children: [
            Row(
              mainAxisSize: MainAxisSize.min, 
              children: [
                Icon(Icons.water_drop_outlined), 
                SizedBox(width: 5),
                Text('Water'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.bathroom_outlined), 
                SizedBox(width: 5),
                Text('Washroom'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min, 
              children: [
                Icon(Icons.light),
                SizedBox(width: 5),
                Text('Flood Light'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.local_parking_outlined), 
                SizedBox(width: 5),
                Text('Parking'),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min, 
              children: [
                Icon(Icons.chair_outlined), 
                SizedBox(width: 5),
                Text('Seating Area'),
              ],
            ),
          ],
        ),

        SizedBox(height: 20), 

      
        Row(
          children: [
            Text(
              'Upcoming Games:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '0 upcoming',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),

        SizedBox(height: 10),

     
        ElevatedButton(
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>))
            
            // print('Book Now button pressed');
          },
          child: Text('BOOK NOW'),
          style: ElevatedButton.styleFrom(
            // color: Colors.deepPurpleAccent,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ],
    ),
  ),
    );
  }
}