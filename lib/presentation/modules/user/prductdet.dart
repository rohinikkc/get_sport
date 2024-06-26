import 'package:flutter/material.dart';
import 'package:getsport/data/model/product_model.dart';
import 'package:getsport/presentation/modules/user/product_buy.dart';

class Productdetails extends StatefulWidget {
  ProductModel model;
  Productdetails({super.key, required this.model});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Image.network(
              fit: BoxFit.cover,
              widget.model.imageUrl,
              height: 300,
              width: 300,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.model.name,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            "Rs.${widget.model.price}",
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 40,
          ),

          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  ProductBuy(model: widget.model,)));
              },
              child: const Text(
                "Buy Now",
                style: TextStyle(color: Colors.blue),
              )),
          // Row(
          //   children: [
          //     // Padding(
          //     //   padding: const EdgeInsets.all(40),
          //     //   child: ElevatedButton(
          //     //       onPressed: () {},
          //     //       child: const Text(
          //     //         "Add Cart",
          //     //         style: TextStyle(color: Colors.blue),
          //     //       )),
          //     // ),
          //     // const SizedBox(
          //     //   width: 10,
          //     // ),

          //   ],
          // )
        ],
      ),

      //  Column(
      //   children: [

      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Container(
      //          height: 200,
      //          width: double.infinity,
      //         decoration: BoxDecoration(
      //           color: Colors.blue

      //         ),

      //       ),
      //     ),

      //   Image.asset("assets/ballf.png")
      //   ],
      // ),
    );
  }
}
