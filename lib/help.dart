import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.deepPurpleAccent, 

  
  appBar: AppBar(
    title: Text(
      'Help and Support',
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.deepPurpleAccent, 
  ),

  
  body: Center(
    child: Text(
      'Help and Support',
      style: TextStyle(
        fontSize: 40, 
        fontWeight: FontWeight.bold,
        color: Colors.white, 
      ),
    ),
    
  ),
);
  
  }
}