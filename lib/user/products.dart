import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/user/prductdet.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
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
      backgroundColor: Colors.blue.shade900.withOpacity(.6),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 180),
            child: Text(
              "Our Products",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return   Row(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Productdetails()),);
                      },
                      child: Container(
                        height: 250,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.amber.shade50,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          children: [
                            Image(image: AssetImage("assets/ballf.png")),
                            Text("VOLATALITY HAND STiTCH FOOTBALL",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,),),
                            Row(
                              children: [
                                Icon(Icons.currency_rupee),
                            Text("2000"),
                             Padding(
                                padding: const EdgeInsets.only(left: 70),
                                child: Icon(Icons.favorite_border,color: Colors.blue.shade900,),
                              )
                      
                              ],
                            ),
                            ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
               Padding(
                 padding: const EdgeInsets.only(left: 3,right: 6),
                 child: Row(
                             children: [
                               GestureDetector(
                                onTap: () {
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Productdetails())); 
                                },
                                 child: Container(
                                                   height: 250,
                                                   width: 160,
                                                   decoration: BoxDecoration(
                                                     color: Colors.amber.shade50,
                                                     borderRadius: BorderRadius.circular(20)
                                                   ),
                                                   child: Column(
                                                     children: [
                                                       Image(
                                                        
                                                         image: AssetImage("assets/helmet.png")),
                                                         Text("Sports youth  Guard Edge Helmet",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                                                         Row(
                                                           children: [
                                                             Icon(Icons.currency_rupee),
                                                             Text("1500"),
                                                             Padding(
                                                               padding: const EdgeInsets.only(left: 70),
                                                               child: Icon(Icons.favorite_border,color: Colors.blue.shade900,),
                                                             )
                                                           ],
                                                         ),
                                                         ],
                                                   ),
                                 ),
                               ),
                             ],
                           ),
                           
               ),
               
            ],
          );
              },
           
            ))
         
         
        ],
      ),
    );
  }
}
