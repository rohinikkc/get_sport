import 'package:flutter/material.dart';

class Noti extends StatelessWidget {
  const Noti({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
  backgroundColor: Colors.deepPurpleAccent, 

  
  appBar: AppBar(
    title: Text(
      'Notification ',
      style: TextStyle(color: Colors.white), 
    ),
    backgroundColor: Colors.deepPurpleAccent, 
  ),

  
  body: Center(
    child: Text(
      'Notification ',
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