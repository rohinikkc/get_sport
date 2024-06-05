import 'package:flutter/material.dart';

class Bgcolor extends StatelessWidget {
  const Bgcolor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:const Color.fromARGB(255, 70, 109, 166).withOpacity(.6) ,
    );
  }
}
   