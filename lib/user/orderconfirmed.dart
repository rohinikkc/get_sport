import 'package:flutter/material.dart';

class OrderConfirm extends StatefulWidget {
  const OrderConfirm({super.key});

  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor:const Color.fromARGB(255, 70, 109, 166).withOpacity(.6) ,
        body:
        
         Center(child: Icon(Icons.verified_rounded,color: Colors.white,size: 170,)),
    );
  }
}