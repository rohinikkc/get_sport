import 'package:flutter/material.dart';
import 'package:getsport/club/club_home2.dart';

class ClubHome extends StatefulWidget {
  const ClubHome({super.key});

  @override
  State<ClubHome> createState() => _ClubHomeState();
}

class _ClubHomeState extends State<ClubHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
                            backgroundColor:const Color.fromARGB(255, 70, 109, 166).withOpacity(.6) ,
             body:
              Padding(
                padding: const EdgeInsets.all(50),
                child: SingleChildScrollView(
                  child: Column(
                  children: [
                   
                    Center(
                      child: Container(
                        
                        height: 40,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey
                        ),
                        child: Center(child: Text("Martial Arts",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
                      
                      ),
                      
                    ),
                     GestureDetector(
                      onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>ClubHomepage()),);
                      }
                      
                    ),
                    
                   
                    
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Image.asset("assets/martialarts.png",
                      height: 250,
                      width: 250,),
                    ),
                   Padding(
                     padding: const EdgeInsets.only(top: 350),
                     child: Center(
                       child: Container(
                            
                            height: 40,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blueGrey
                            ),
                            child: Center(child: Text("Sports",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
                          
                          ),
                          
                     ),
                     
                   ),
                    
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ClubHomepage()),);
                      }
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 400),
                      child: Image.asset("assets/sports.png",
                        height: 250,
                        width: 250,),
                    ),
                    
                  ],
                               ),
                               
                ),
              ),


    );
  }
}
