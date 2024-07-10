import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/data/functions.dart';
import 'package:getsport/presentation/modules/user/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



List<String >sporstImage=["assets/image 10.png","assets/bat.png","assets/basketball.png"];
List<String >martialImage=["assets/kungfu.png","assets/kabadiii.png","assets/kabadiii.png"];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
          // leading: IconButton(onPressed: (){}, icon: icon),
          title: const Text(
            'getsport',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.white,
            )
          ],
          backgroundColor: Colors.blue.shade900.withOpacity(.6),
        ),
        body:
        Center(
          child: Column(children: [
          
          Column(children: [
            Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 10),
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sporstImage.length,
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
                                        builder: (context) =>  Search(selectedType: DBFunctions.sport[index],)));
                              },
                              child: Image.asset(sporstImage[index])),
                           Positioned(
                              top: 20,
                              left: 20,
                              child: Text(
                                DBFunctions.sport[index],
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],),

          
             Column(children: [
               Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 10),
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                      child: Text(
                    "Martial Arts",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
               SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: martialImage.length,
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
                                        builder: (context) =>  Search(selectedType: DBFunctions.sport[index+3],)));
                              },
                              child: Image.asset(martialImage[index])),
                           Positioned(
                              top: 20,
                              left: 20,
                              child: Text(
                              DBFunctions.sport[index+3],
                                style: TextStyle(color: Colors.white),
                              )),
                        ],
                      ),
                    );
                  },
                ),
              ),
             ],)
          
          
          
          
          
          
          
          ],),
        )
        
        
        
        
        
        
        
        //  Column(
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(top: 25, bottom: 10),
        //       child: Container(
        //         width: 300,
        //         height: 50,
        //         decoration: BoxDecoration(
        //             color: Colors.blue.shade900,
        //             borderRadius: BorderRadius.circular(10)),
        //         child: const Center(
        //             child: Text(
        //           "Sports",
        //           style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 15,
        //               fontWeight: FontWeight.bold),
        //         )),
        //       ),
        //     ),
        //     SizedBox(
        //       height: 200,
        //       // width: MediaQuery.of(context),
        //       child: ListView.builder(
        //         scrollDirection: Axis.horizontal,
        //         itemCount: 3,
        //         itemBuilder: (context, index) {
        //           return Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Stack(
        //               children: [
        //                 GestureDetector(
        //                     onTap: () {
        //                       Navigator.push(
        //                           context,
        //                           MaterialPageRoute(
        //                               builder: (context) => const Search()));
        //                     },
        //                     child: Image.asset("assets/download.jpeg")),
        //                 const Positioned(
        //                     top: 20,
        //                     left: 20,
        //                     child: Text(
        //                       "Football",
        //                       style: TextStyle(color: Colors.white),
        //                     )),
        //               ],
        //             ),
        //           );
        //         },
        //       ),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.only(top: 80, bottom: 40),
        //       child: Container(
        //         width: 300,
        //         height: 50,
        //         decoration: BoxDecoration(
        //             color: Colors.blue.shade900,
        //             borderRadius: BorderRadius.circular(10)),
        //         child: const Center(
        //           child: Text(
        //             "Martial Arts",
        //             style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 15,
        //                 fontWeight: FontWeight.bold),
        //           ),
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       height:50 ,
        //       width: double.infinity,
        //       child: ListView.builder(
        //         scrollDirection: Axis.horizontal,
        //         itemCount: 3,
        //         itemBuilder: (context, index) {
        //           return Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Stack(
        //               children: [
        //                 Image.asset(
        //                   "assets/karate.png",
        //                 ),
        //                 const Positioned(
        //                     top: 20,
        //                     left: 20,
        //                     child: Text(
        //                       "karate",
        //                       style: TextStyle(color: Colors.white),
        //                     )),
        //                 GestureDetector(
        //                   onTap: () {
        //                     Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => const Search()));
        //                   },
        //                 )
        //               ],
        //             ),
        //           );
        //         },
        //       ),
        //     )
        //   ],
        // )
        
        );
  }
}
