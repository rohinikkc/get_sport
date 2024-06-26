import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/model/buy_product_model.dart';
import 'package:getsport/data/model/product_model.dart';
import 'package:getsport/presentation/modules/user/orderconfirmed.dart';
import 'package:getsport/presentation/widget/payment_page.dart';

class ProductBuy extends StatefulWidget {
  ProductModel model;
  ProductBuy({super.key, required this.model});

  @override
  State<ProductBuy> createState() => _ProductBuyState();
}

class _ProductBuyState extends State<ProductBuy> {
  final name = TextEditingController();
  final address = TextEditingController();
  final mobilenumber = TextEditingController();
  final __forkKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.card_travel),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.favorite),
          )
        ],
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
      ),
      backgroundColor: const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
      body: Form(
        key: __forkKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Delivery Contact",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is Empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: TextFormField(
                  controller: address,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is Empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      hintText: "Address",
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: TextFormField(
                  controller: mobilenumber,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Field is Empty";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      hintText: "Mobile Number",
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Order Summary",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 200, left: 10, top: 10),
                    child: Text(
                      "AMOUNT",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    "Rs.${widget.model.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 200, left: 45, top: 10),
                    child: Text(
                      "GST",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    "Rs.0.0",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 140, left: 10, top: 10),
                    child: Text(
                      "TOTAL AMOUNT",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    "Rs.${widget.model.price}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (__forkKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentPage(
                                    amount: widget.model.price,
                                    buyProductModel: BuyProductModel(
                                        uid: FirebaseAuth
                                            .instance.currentUser!.uid,
                                        address: address.text,
                                        mobileNamber: mobilenumber.text,
                                        name: name.text,
                                        productModel: widget.model),
                                  )));
                    }
                  },
                  child: const Text(
                    "confirm",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
