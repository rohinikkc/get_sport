import 'package:flutter/material.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.deepPurpleAccent, 

  
  appBar: AppBar(
    title: Text(
      'Wish List',
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.deepPurpleAccent, 
  ),

  
  body: Center(
    child: Text(
      'Wish List',
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
    
  
