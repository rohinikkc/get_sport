import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
          title: Text(
            'Calvery FootBall court',
            style: TextStyle(color: Colors.white,fontSize: 15),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.white,
            )
          ],
          backgroundColor: Colors.blue.shade900.withOpacity(.6),
        ),
            // backgroundColor:const Color.fromARGB(255, 70, 109, 166).withOpacity(.6) ,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                Text("Malappuram",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                
                
                  ],
                ),
              ),
              Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40,),
                        child: Container(
                          height: 30,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueGrey
                          ),
                          child: Center(child: Text("slot1 6 july 2024 10:30am",style: TextStyle(color: Colors.white),)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      
                      Text("Payment Summary",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 20,
                      ),
                       Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 200,left: 10,top: 10),
                             child: Text("AMOUNT",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                           ),
                          Text("Rs.500",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15 ),),
                       
                         ],
                       ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 200,left: 45,top: 10),
                            child: Text("GST",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                          ),
                                                                          Text("Rs258",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15 ),),
                      
                        ],
                      ),
                                            SizedBox(
                        height: 20,
                      ),

                       Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 140,left: 10,top: 10),
                            child: Text("TOTAL AMOUNT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                          ),
                                                                          Text("Rs758",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      
                        ],
                      ),
                                                                  SizedBox(
                        height: 200,
                      ),

                     Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 140,left: 10,top: 10),
                            child: Column(
                              children: [
                                Text("Rs.758",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                Text("1 slot ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)

                              ],
                            ),
                          ),
                                                                          // Text("Rs.758",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                      ElevatedButton(onPressed: (){}, child: Text("proceed",style: TextStyle(color: Colors.blue,),))
                        ],
                      ),
                    ],
                  )
            ],
          ),
    );
  }
}