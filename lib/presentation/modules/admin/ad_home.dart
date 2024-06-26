import 'package:flutter/material.dart';
import 'package:getsport/presentation/modules/admin/ad_academylist.dart';
import 'package:getsport/presentation/modules/admin/ad_clublist.dart';
import 'package:getsport/presentation/modules/admin/ad_eventlist.dart';
import 'package:getsport/presentation/modules/admin/ad_menu.dart';
import 'package:getsport/presentation/modules/admin/ad_order_list.dart';
import 'package:getsport/presentation/modules/admin/ad_productlist.dart';
import 'package:getsport/presentation/modules/admin/ad_trainerlist.dart';
import 'package:getsport/presentation/modules/admin/ad_user_list.dart';
import 'package:getsport/presentation/modules/admin/ad_venues_list.dart';
import 'package:getsport/presentation/spash_screen.dart';
import 'package:getsport/presentation/widget/helper.dart';

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
        backgroundColor: const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ));
          }
        ),
      ),
      drawer: Drawer(
          backgroundColor: Colors.blue.shade500,
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ListTile(
                leading: const Icon(Icons.add_box),
                iconColor: Colors.white,
                title: const Text(
                  "Academy List",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AcademyList()));
                },
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add_box),
              iconColor: Colors.white,
              title: const Text(
                "Coach List",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TrainerList()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box),
              iconColor: Colors.white,
              title: const Text(
                "Product List",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ProductList()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box),
              iconColor: Colors.white,
              title: const Text(
                "Club List",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => const ClubList()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box),
              iconColor: Colors.white,
              title: const Text(
                "Venue List",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VenuesListPage()));
              },
            ),
             ListTile(
              leading: const Icon(Icons.add_box),
              iconColor: Colors.white,
              title: const Text(
                "Event List",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const EventList()));
              },
            ),
             ListTile(
              leading: const Icon(Icons.add_box),
              iconColor: Colors.white,
              title: const Text(
                "Users List",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UsersList()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box),
              iconColor: Colors.white,
              title: const Text(
                "Order List",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AdOrderList()));
              },
            ),
             ListTile(
              leading: const Icon(Icons.logout),
              iconColor: Colors.white,
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
              Helper.clearPreference(context);
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
                  child: const Center(
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
                    child: const Center(
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
