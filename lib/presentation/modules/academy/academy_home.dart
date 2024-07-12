import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/presentation/modules/academy/academy_home2.dart';

class AcademyHome extends StatefulWidget {
  const AcademyHome({super.key});

  @override
  State<AcademyHome> createState() => _AcademyHomeState();
}

class _AcademyHomeState extends State<AcademyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AcademyHomepage()),
                );
              },
              child: Column(
                children: [
                  Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "assets/martialarts.png",
                      height: 250,
                      width: 250,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AcademyHomepage()),
                );
              },
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "assets/sports.png",
                      height: 250,
                      width: 250,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
