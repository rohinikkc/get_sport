import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getsport/data/crud/controller.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/functions.dart';
import 'package:getsport/data/model/product_model.dart';
import 'package:getsport/presentation/widget/helper.dart';
import 'package:getsport/presentation/widget/sport_category.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();

  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back, color: Colors.blue.shade900),
        title: const Text("Add Academy"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.add, color: Colors.blue.shade900),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 400,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blueGrey)),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SportCategoryDropDown(),
                  Padding(
                    padding: const EdgeInsets.only(right: 50, left: 20),
                    child: TextFormField(
                      controller: name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Product Name",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Controller().pickImage().then((value) {
                        imageFile = value;
                        setState(() {});
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: imageFile != null
                          ? Image.file(
                              File(imageFile!.path),
                              height: 100,
                              width: 100,
                            )
                          : Image.asset(
                              "assets/image.png",
                              height: 100,
                              width: 100,
                            ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 20, top: 30, left: 20),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: price,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field is empty";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "price",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (imageFile != null) {
                            DbController()
                                .uploadImage(imageFile!, "Product")
                                .then((url) {
                              DbController()
                                  .addNewProduct(ProductModel(
                                      type: Provider.of<DBFunctions>(context,
                                              listen: false)
                                          .selectedSport!,
                                      imageUrl: url,
                                      name: name.text,
                                      price: double.parse(price.text),
                                      rating: 0))
                                  .then((value) {
                                Helper.successSnackBar(
                                    context, "Product added successful");
                                Navigator.pop(context);
                              });
                            });
                          } else {
                            Helper.errorSnackBar(context, "Pick Image!");
                          }
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
