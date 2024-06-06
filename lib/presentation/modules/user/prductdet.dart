import 'package:flutter/material.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({super.key});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: 
         
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios), ),
        actions:  [
          IconButton(onPressed: (){}, icon:  Icon(Icons.search),),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.card_travel),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite),
          )
        ],
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
      ),
          backgroundColor:const Color.fromARGB(255, 70, 109, 166).withOpacity(.6) ,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset("assets/ballf.png",height: 300,width: 300,),
            ),
            SizedBox(
              height: 5,
            ),
            Text("SG Sierra Plus kashmir willow Cricket Bat",style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15
            ),),
                       Text("Rs.1500",style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15
            ),),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: ElevatedButton(onPressed: (){}, child: Text("Add Cart",style: TextStyle(color: Colors.blue),)),
                ),
                SizedBox(
                  width: 10,
                ),
                                ElevatedButton(onPressed: (){}, child: Text("Buy Now",style: TextStyle(color: Colors.blue),)),

              ],
            )

          ],
        ),
      
      //  Column(
      //   children: [
          
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //          height: 200,
      //          width: double.infinity,
      //         decoration: BoxDecoration(
      //           color: Colors.blue
            
      //         ),
            
      //       ),
      //     ),

      //   Image.asset("assets/ballf.png")
      //   ],
      // ),
    );
  }
}