import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back,color: Colors.blue.shade900),
        title:Text("Product List"),
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
                     'VOLATALITY HAND STiTCH FOOTBALL',
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
                                           child: Image.asset("assets/ballf.png",height: 120,width: 120,),
                                         ),
                                        
                                         Column(
                                           children: [
                                             Row(
                                               children: [
                                             Icon(Icons.currency_rupee,color: Colors.white,),
                                              Text("2000",style: TextStyle(color: Colors.white,fontSize: 15),),
                                              

                                               ],
                                             ),SizedBox(
                                              height: 30,
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