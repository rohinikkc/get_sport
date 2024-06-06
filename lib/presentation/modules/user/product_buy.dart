import 'package:flutter/material.dart';
import 'package:getsport/presentation/modules/user/orderconfirmed.dart';

class ProductBuy extends StatefulWidget {
  const ProductBuy({super.key});

  @override
  State<ProductBuy> createState() => _ProductBuyState();
}

class _ProductBuyState extends State<ProductBuy> {
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
              padding: const EdgeInsets.all(10),
              child: Text("Delivery Contact",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
              child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide:BorderSide(color: Colors.blue)),
                            hintText: "Name",
                            hintStyle: TextStyle(color: Colors.black
                            )
                          ),  
                          ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
              child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide:BorderSide(color: Colors.blue)),
                            hintText: "Address",
                            hintStyle: TextStyle(color: Colors.black
                            )
                          ),  
                          ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
              child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide:BorderSide(color: Colors.blue)),
                            hintText: "Mobile Number",
                            hintStyle: TextStyle(color: Colors.black
                            )
                          ),  
                          ),
            ),
            SizedBox(height: 10,),
            
            Text("Order Summary",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(
                        height: 20,
                      ),
                       Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 200,left: 10,top: 10),
                             child: Text("AMOUNT",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.white),),
                           ),
                          Text("Rs.500",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.white ),),
                       
                         ],
                       ),
                       SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 200,left: 45,top: 10),
                            child: Text("GST",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.white),),
                          ),
                                     Text("Rs258",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15 ,color: Colors.white),),
                      
                        ],
                      ),
                                            SizedBox(
                        height: 10,
                      ),
                                         Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 140,left: 10,top: 10),
                            child: Text("TOTAL AMOUNT",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
                          ),
                                                                          Text("Rs758",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.white),),
                      
                        ],
                      ),
                                                                  SizedBox(
                        height: 20,
                      ),
                        ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderConfirm()));
                        }, child: Text("confirm",style: TextStyle(color: Colors.blue,),))


          ],
         ),
    );
  }
}