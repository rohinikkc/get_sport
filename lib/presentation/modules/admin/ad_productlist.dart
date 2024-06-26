import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/product_model.dart';
import 'package:getsport/presentation/modules/admin/add_product.dart';
import 'package:getsport/presentation/widget/helper.dart';

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
          leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
          title: const Text("Product List"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.blue.shade900),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AddProduct()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.add, color: Colors.blue.shade900),
              ),
            ),
          ],
        ),
        backgroundColor:
            const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
        body: StreamBuilder<QuerySnapshot>(
            stream: DbController().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<ProductModel> listOfProduct = snapshot.data!.docs
                  .map((e) =>
                      ProductModel.fromJosn(e.data() as Map<String, dynamic>))
                  .toList();
              if (snapshot.hasData) {
                return listOfProduct.isEmpty
                    ? const Center(
                        child: Text("No Products"),
                      )
                    : ListView.builder(
                        itemCount: listOfProduct.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 200,
                              width: 330,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blueGrey)),
                              child: Column(
                                children: [
                                  Text(
                                    listOfProduct[index].name,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30),
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Image.network(
                                            fit: BoxFit.cover,
                                            listOfProduct[index].imageUrl,
                                            height: 120,
                                            width: 120,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.currency_rupee,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                listOfProduct[index]
                                                    .price
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),

                                          //  Text("Timing:",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),),
                                          //  Text("Monday- Friday   9:00am-5:00pm",style: TextStyle(fontSize: 12,color: Colors.white),),
                                          Row(
                                            children: [
                                              ElevatedButton.icon(
                                                  onPressed: () {
                                                    _callForEdit(listOfProduct[index]);
                                                  },
                                                  icon: const Icon(
                                                    Icons.edit,
                                                    color: Colors.blue,
                                                  ),
                                                  label: const Text("Edit",
                                                      style: TextStyle(
                                                          color: Colors.blue))),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              ElevatedButton.icon(
                                                  onPressed: () {

                                                    DbController().deleteSelectedDoc("Products", listOfProduct[index].productId);
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete,
                                                    color: Colors.blue,
                                                  ),
                                                  label: const Text("Delete",
                                                      style: TextStyle(
                                                          color: Colors.blue)))
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
                      );
              } else {
                return const SizedBox();
              }
            }));
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  _callForEdit(ProductModel model) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field is empty";
                          } else {
                            return null;
                          }
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                            hintText: "Name", border: OutlineInputBorder()),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Field is empty";
                          } else {
                            return null;
                          }
                        },
                        controller: priceController,
                        decoration: const InputDecoration(
                            hintText: "Price", border: OutlineInputBorder()),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blueAccent),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 6.0),
                            child: TextButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  DbController().updateProduct(ProductModel(
                                    type: model.type,
                                    productId: model.productId,
                                      imageUrl: model.imageUrl,
                                      name: nameController.text,
                                      price: double.parse(priceController.text),
                                      rating: model.rating));
                                  Helper.successSnackBar(
                                      context, "Updation Successful");
                                  Navigator.pop(context);
                                }
                              },
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
