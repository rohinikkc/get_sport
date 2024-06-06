// import 'package:flutter/material.dart';
// import 'package:getsport/admin/ad_academylist.dart';
// import 'package:getsport/admin/ad_clublist.dart';
// import 'package:getsport/admin/ad_productlist.dart';
// import 'package:getsport/admin/ad_trainerlist.dart';

// class Ad_menu extends StatefulWidget {
//   const Ad_menu({super.key});

//   @override
//   State<Ad_menu> createState() => _Ad_menuState();
// }

// class _Ad_menuState extends State<Ad_menu> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Colors.blue.shade200,
//        drawer: Drawer(
//         backgroundColor: Colors.blue.shade500,
//          child: ListView(
//           children: [
//            Padding(
//              padding: const EdgeInsets.only(top: 40),
//              child: ListTile(
//               leading: Icon(Icons.add_box),
//               iconColor: Colors.white,
//               title: Text("Academy List",style: TextStyle(color: Colors.white),
//               ),
//               onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>AcademyList()));
//               },
//              ),
//            ),
//            ListTile(
//               leading: Icon(Icons.add_box),
//               iconColor: Colors.white,
//               title: Text("Coach List",style: TextStyle(color: Colors.white),
//               ),
//               onTap: (){
//                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>TrainerList()));

//               },
//              ),
//              ListTile(
//               leading: Icon(Icons.add_box),
//               iconColor: Colors.white,
//               title: Text("Product List",style: TextStyle(color: Colors.white),
//               ),
//               onTap: (){
//                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductList()));

//               },
//              ),
//              ListTile(
//               leading: Icon(Icons.add_box),
//               iconColor: Colors.white,
//               title: Text("Club List",style: TextStyle(color: Colors.white),
//               ),
//               onTap: (){
//                  Navigator.push(context, MaterialPageRoute(builder: (contex)=>ClubList()));
//               },
//              ),
//            ]

//            )
           
//            )
//     );
//   }
// }