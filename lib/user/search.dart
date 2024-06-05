import 'package:flutter/material.dart';
import 'package:getsport/event.dart';
import 'package:getsport/user/menubar.dart';
import 'package:getsport/venue.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
       appBar: AppBar(
        bottom: const TabBar(tabs: [
          Padding(
            padding: EdgeInsets.only(left: 5,right: 10),
            child: Tab(text: "Events"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Tab(text: "Venues"),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Tab(text: "Clubs"),
          ),
          
        ],
        indicatorColor: Colors.purple,
        indicatorWeight: 20,
        // indicator: BoxDecoration(borderRadius: BorderRadius.circular(10),
        // color: Colors.purple),
        isScrollable: true),
        leading:
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Menu()));
        }, 
        icon:Icon(Icons.menu),
),
        actions: [
          IconButton(onPressed:(){} , icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.location_on))
          
        ],
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
      ),
      body:  TabBarView(children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.5),
              child: Container(
                
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10) ,
                 color: Colors.blue.shade300
                ),
                child: Row(
                  children: [
                        
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset("assets/tournament.png"),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30,bottom: 30),
                          child: Text("Football Tournament",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                      Text("calicut"),
                      
                        ],
                      
                      ),
                      
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: Row(
                        children: [
                          Icon(Icons.currency_rupee),
                      Text("500"),
                      
                        ],
                      ),
                    ),

                      ],
                    ),
                        
                  ],
                ) ,
                
              ),
              
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Event()));
            }, child: Text("BOOK"))
          ],
        ),
        // Center(child: Text("event")),
        // Center(child: Text("venues")),
        // Center(child: Text("clubs")),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.5),
              child: Container(
                
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10) ,
                 color: Colors.blue.shade300
                ),
                child: Row(
                  children: [
                        
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset("assets/tournament.png"),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30,bottom: 30),
                          child: Text("Football Tournament",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                      Text("calicut"),
                      
                        ],
                      
                      ),
                      
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: Row(
                        children: [
                          Icon(Icons.currency_rupee),
                      Text("500"),
                      
                        ],
                      ),
                    ),

                      ],
                    ),
                        
                  ],
                ) ,
              ),
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Venue()));
            }, child: Text("BOOK"))
          ],
        ),
          Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.5),
              child: Container(
                
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10) ,
                 color: Colors.blue.shade300
                ),
                child: Row(
                  children: [
                        
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset("assets/tournament.png"),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30,bottom: 30),
                          child: Text("Football Tournament",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),
                          ),
                        ),
                    Padding(
                      padding: const EdgeInsets.only(right: 80),
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                      Text("calicut"),
                      
                        ],
                      
                      ),
                      
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: Row(
                        children: [
                          Icon(Icons.currency_rupee),
                      Text("500"),
                      
                        ],
                      ),
                    ),

                      ],
                    ),
                        
                  ],
                ) ,
              ),
            ),
          ],
        ),

      ]),
    ));
    
  }
}