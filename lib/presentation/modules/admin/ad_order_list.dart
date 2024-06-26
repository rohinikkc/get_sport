import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/buy_product_model.dart';
import 'package:getsport/data/model/product_model.dart';
import 'package:getsport/presentation/modules/user/prductdet.dart';
import 'package:getsport/presentation/widget/helper.dart';

class AdOrderList extends StatelessWidget {
  const AdOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          title: const Text(
            'Order List',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: FutureBuilder<QuerySnapshot<Map<String,dynamic>>>(
            future: DbController().getAllOrderForAdmin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Helper.indiacator();
              }
              log(snapshot.data!.docs.length.toString());
              List<BuyProductModel> listOfProducts =
                  snapshot.data!.docs.map((e) => BuyProductModel.fromJosn(e.data()as Map<String ,dynamic>)).toList();

              return Helper.emptyListWidget(
                  listOfProducts,
                  "Order Not Found",
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: .7),
                    itemCount: listOfProducts.length,
                    itemBuilder: (context, index) {
                      return Padding(
                              padding: const EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                
                             
                                },
                                child: Container(
                                  height: 250,
                                  width: 160,
                                  decoration: BoxDecoration(
                                      color: Colors.amber.shade50,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          width: double.infinity,
                                          height: 150,
                                          child: Image.network(
                                              fit: BoxFit.cover,
                                              listOfProducts[index].productModel.imageUrl)),
                                      Text(
                                        listOfProducts[index].productModel.name,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.currency_rupee),
                                          Text(listOfProducts[index].productModel.price.toString()),
                                          // IconButton(
                                          //   onPressed: (){
                                          //     DbController().addToWishList(listOfProducts[index].productId);
                                          //   },
                                          //   icon: StreamBuilder<DocumentSnapshot>(
                                          //     stream: DbController().checkTheProductIsAleradyExistInWishList(listOfProducts[index].productId),

                                          //     builder: (context, snapshot) {
                                          //       if(snapshot.connectionState==ConnectionState.waiting){
                                          //         return Icon(
                                          //         Icons.favorite_border,
                                          //         color: Colors.blue.shade900,
                                          //       );

                                          //       }

                                          //       bool isLiked;
                                          //       if(snapshot.data!.exists){
                                          //       isLiked=true;
                                          //       }else{
                                          //         isLiked=false;
                                          //       }
                                          //       return Icon(
                                          //       isLiked?Icons.favorite:  Icons.favorite_border,
                                          //         color: Colors.blue.shade900,
                                          //       );
                                          //     }
                                          //   ),
                                          // )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                        
                    },
                  ));
            }));
  }
}
