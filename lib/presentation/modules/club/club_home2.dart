import 'package:flutter/material.dart';
import 'package:getsport/presentation/modules/club/club_menu.dart';
import 'package:getsport/presentation/modules/club/club_register.dart';
import 'package:getsport/presentation/modules/club/club_tournment.dart';

class ClubHomepage extends StatefulWidget {
  const ClubHomepage({super.key});

  @override
  State<ClubHomepage> createState() => _ClubHomepageState();
}

class _ClubHomepageState extends State<ClubHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ClubMenu(),
                  appBar: AppBar(
         backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: 
        // Icon(Icons.menu,color: Colors.blue.shade900),
        Builder(
          builder: (context) {
            return IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();
              // Navigator.push(context,MaterialPageRoute(builder: (context)=>AcademyMenu()) );
            }, icon:Icon(Icons.menu,color: Colors.blue.shade900) );
          }
        ),
        
        actions: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.search,color: Colors.blue.shade900),
       ),
        ],
      ),
        backgroundColor: Colors.blue.shade900.withOpacity(.8),
        body: Column(
          children: [

            const Padding(
              padding: EdgeInsets.only(right:200,top: 60),
              child: Text("REAL MADRID CLUB",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
            ),
            Container(
              height:565,
              width: 500,

              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                       ElevatedButton.icon(
                        onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>const ClubTournament()));

                        }, 
                       icon: Icon(Icons.run_circle,color: Colors.blue.shade900,), 
                       label:const Text("Tournaments List",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),), ),

                       const SizedBox(
                        height: 30,

                       ),
                      //   ElevatedButton.icon(
                      //   onPressed: (){

                      //   }, 
                      //  icon: Icon(Icons.app_registration_outlined,color: Colors.blue.shade900,), 
                      //  label:const Text("Registration List",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),), ),
                      //                         const SizedBox(
                      //   height: 30,

                      //  ),
                        
                    ],
                  ),
                ),
                
                
                ),
              )
          ])
    );
  }
}