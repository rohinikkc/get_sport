import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/user/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'getsport',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.white,
            )
          ],
          backgroundColor: Colors.blue.shade900.withOpacity(.6),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 10),
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  "Sports",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(
              height: 200,
              width: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Search()));
                            },
                            child: Image.asset("assets/download.jpeg")),
                        Positioned(
                            top: 20,
                            left: 20,
                            child: Text(
                              "Football",
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 40),
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    "Martial Arts",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/karate.png",
                        ),
                        Positioned(
                            top: 20,
                            left: 20,
                            child: Text(
                              "karate",
                              style: TextStyle(color: Colors.white),
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Search()));
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
