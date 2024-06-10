import 'package:flutter/material.dart';
import 'package:getsport/presentation/modules/user/bottom_navigation.dart';

class OrderConfirm extends StatefulWidget {
  const OrderConfirm({super.key});

  @override
  State<OrderConfirm> createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Navigation(indexnum: 0)), (route) => false);
    });
    return Scaffold(
          backgroundColor:const Color.fromARGB(255, 70, 109, 166).withOpacity(.6) ,
        body:
        
         const Center(child: Icon(Icons.verified_rounded,color: Colors.white,size: 170,)),
    );
  }
}