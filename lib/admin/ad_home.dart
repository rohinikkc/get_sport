import 'package:flutter/material.dart';
import 'package:getsport/admin/ad_academylist.dart';
import 'package:getsport/admin/ad_clublist.dart';
import 'package:getsport/admin/ad_martialhome.dart';
import 'package:getsport/admin/ad_menu.dart';
import 'package:getsport/admin/ad_productlist.dart';
import 'package:getsport/admin/ad_trainerlist.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
        leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            )),
      ),
      drawer: Drawer(
          backgroundColor: Colors.blue.shade500,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ListTile(
                leading: Icon(Icons.add_box),
                iconColor: Colors.white,
                title: Text(
                  "Academy List",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AcademyList()));
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              iconColor: Colors.white,
              title: Text(
                "Coach List",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TrainerList()));
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              iconColor: Colors.white,
              title: Text(
                "Product List",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductList()));
              },
            ),
            ListTile(
              leading: Icon(Icons.add_box),
              iconColor: Colors.white,
              title: Text(
                "Club List",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => ClubList()));
              },
            ),
          ])),
      backgroundColor: const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey),
                  child: Center(
                      child: Text(
                    "Martial Arts",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Ad_menu()),);
                  },
                  child: Image.asset(
                    "assets/martialarts.png",
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    height: 30,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueGrey),
                    child: Center(
                        child: Text(
                      "Sports",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>Ad_menu()),);
                  },
                  child: Image.asset(
                    "assets/sports.png",
                    height: 250,
                    width: 250,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
