import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/product_model.dart';
import 'package:getsport/presentation/modules/user/prductdet.dart';
import 'package:getsport/presentation/widget/helper.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          title: Text(
            'Wish List',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: FutureBuilder(
            future: DbController().getMyWishList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Helper.indiacator();
              }
              List<String> listOfProducts =
                  snapshot.data!.docs.map((e) => e["id"] as String).toList();

              return Helper.emptyListWidget(
                  listOfProducts,
                  "Wish List is Empty",
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: .7),
                    itemCount: listOfProducts.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder(
                          future: DbController()
                              .getSelectedProductData(listOfProducts[index]),
                          builder: (context, snaphot) {
                            if(snaphot.connectionState==ConnectionState.waiting){
                              return SizedBox();
                            }
                            ProductModel model = ProductModel.fromJosn(
                                snaphot.data!.data() as Map<String, dynamic>);
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Productdetails(
                                              model: model,
                                            )),
                                  );
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
                                              model.imageUrl)),
                                      Text(
                                        model.name,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.currency_rupee),
                                          Text(model.price.toString()),
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
                          });
                    },
                  ));
            }));
  }
}
