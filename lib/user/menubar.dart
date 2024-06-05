import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getsport/model/usermodel.dart';
import 'package:getsport/screens/bottom_navigation.dart';
import 'package:getsport/user/useraccount.dart';

class Menu extends StatefulWidget {
   Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
final _firestore=FirebaseFirestore.instance;
final _auth=FirebaseAuth.instance;

  
  @override
  Widget build(BuildContext context) {
    String id=_auth.currentUser!.uid;

    return  Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_sharp,)),
        
      ),
      body:
       SingleChildScrollView(
         child: Column(children: [
          Row(
         
            children: [
              StreamBuilder(stream: _firestore.collection('user').doc(id).snapshots(),
                 builder: (context,snapshot)
                 {
                  UserModel userModel=UserModel.fromMap(snapshot.data!.data()!);
              String image=userModel.imageUrl.toString();
                  // DocumentSnapshot image=snapshot.data!;
                  return   
                  CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(image)
                // fetch the image
              );
                 }),
              
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("HI, Welcome Back",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                      StreamBuilder(stream: FirebaseFirestore.instance.collection('user').doc(id).snapshots(),
            builder: (context,snapshot){
              UserModel userModel=UserModel.fromMap(snapshot.data!.data()!);
              //String image=userModel.imageUrl.toString();
              return  Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child:  Text(userModel.name,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
              );
            },
             
            ),
                      
                      
                  ],
                ),
              ),
            ],
          ),
               
         ListTile(
           leading: Icon(Icons.account_circle),
           title: Text('Account'),
           onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UserAccount()));
            
             print('Account tapped');
           },
         ),
         
         
         ListTile(
           leading: Icon(Icons.info),
           title: Text('Reset your contact info'),
           onTap: () {
             // Handle reset contact info tap event
             print('Reset contact info tapped');
           },
         ),
         
         
         ListTile(
           leading: Icon(Icons.notifications),
           title: Text('Get notification for Events Venues, Forum replies and Updates'),
           onTap: () {
            
             print('Notification tapped');
           },
         ),
         
         
         ListTile(
           leading: Icon(Icons.shopping_cart),
           title: Text('Find Order Updates, Returns & Cancellations.'),
           onTap: () {
          
             print('Orders tapped');
           },
         ),
         
         
         ListTile(
           leading: Icon(Icons.favorite),
           title: Text('Save & view your favourites here.'),
           onTap: () {
            
             print('Wishlist tapped');
           },
         ),
         
         
         ListTile(
           leading: Icon(Icons.settings),
           title: Text('Reset your password'),
           onTap: () {
             
             print('Setting tapped');
           },
         ),
         
         
         ListTile(
           leading: Icon(Icons.help),
           title: Text('Raise a concern or read our FAQs'),
           onTap: () {
             print('Help and Support tapped');
           },
         ),
         
         
         ListTile(
           leading: Icon(Icons.info),
           title: Text('App info'),
           onTap: () {
            
             print('App info tapped');
           },
         ),
         SizedBox(height: 130,),
         
         
         ListTile(
           leading: Icon(Icons.logout),
           title: Text('Logout'),
           onTap: () {
            
             print('Logout tapped');
           },
         )
         
         
               ],),
       )
      
 
    );
  }
}