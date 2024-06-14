import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/functions.dart';
import 'package:getsport/data/model/product_model.dart';
import 'package:getsport/presentation/modules/user/prductdet.dart';
import 'package:getsport/presentation/widget/helper.dart';
import 'package:provider/provider.dart';

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
        title: Consumer<DBFunctions>(
          builder: (context,search,child) {
            return TextFormField(
              onTap:(){
                search.getProductEvent();
              } ,
              onChanged: (value) {
                search.serchProductByName(value);
              },
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search), hintText: "Search"),
            );
          }
        ),
        leading: const Icon(Icons.menu),
        actions: const [
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
          const Padding(
            padding: EdgeInsets.only(right: 180),
            child: Text(
              "Our Products",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Expanded(
              child: Consumer<DBFunctions>(
                builder: (context,search,child) {
                  return StreamBuilder<QuerySnapshot>(
                      stream: DbController().getAllProducts(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Helper.indiacator();
                        }
                        List<ProductModel> listOfProducts=[];
                        if(search.productList.isNotEmpty){
                          listOfProducts=search.displyproductList;

                        }else{
                          listOfProducts = snapshot.data!.docs
                            .map((e) => ProductModel.fromJosn(
                                e.data() as Map<String, dynamic>))
                            .toList();
                        }
                  
                        if (snapshot.hasData) {
                          return Helper.emptyListWidget(
                              listOfProducts,
                              "No Products",
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
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Productdetails(
                                                    model: listOfProducts[index],
                                                  )),
                                        );
                                      },
                                      child: Container(
                                        height: 250,
                                        width: 160,
                                        decoration: BoxDecoration(
                                            color: Colors.amber.shade50,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                width: double.infinity,
                                                height: 150,
                                                child: Image.network(
                                                    fit: BoxFit.cover,
                                                    listOfProducts[index]
                                                        .imageUrl)),
                                            Text(
                                              listOfProducts[index].name,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.currency_rupee),
                                                Text(listOfProducts[index]
                                                    .price
                                                    .toString()),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 70),
                                                  child: Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.blue.shade900,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ));
                        } else {
                          return const SizedBox();
                        }
                      });
                }
              ))
        ],
      ),
    );
  }
}
