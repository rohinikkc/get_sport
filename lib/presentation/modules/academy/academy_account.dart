import 'package:flutter/material.dart';
import 'package:getsport/presentation/modules/academy/details_editpage.dart';

class AcademyAccount extends StatefulWidget {
  const AcademyAccount({super.key});

  @override
  State<AcademyAccount> createState() => _AcademyAccountState();
}

class _AcademyAccountState extends State<AcademyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor:Colors.blue.shade900.withOpacity(.6) ,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ak2 Academy",style: TextStyle(fontSize: 15),),
           Text("ak2academy@gmail.com",style: TextStyle(fontSize: 12),) 
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/pro.png"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 80,
              
              width:double.infinity ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
                
              ),
              child: Row(
                children: [
                  Text("Details>>",style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child:TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsEdit()));
                    }, child: Text("Edit",style: TextStyle(color: Colors.blue)
                    //  
                    ),
                    ),
                    
                    
                  )
                ],
              ), 
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 80,
                width:double.infinity ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                  
                ),
                child: Row(
                  children: [
                    Text("Available Sport>>",style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: TextButton(onPressed: (){}, child: Text("Edit",style: TextStyle(color: Colors.blue)
                     
                      ),
                      ),
                      
                      
                      
                    )
                  ],
                ), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                height: 80,
                width:double.infinity ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                  
                ),
                child: Row(
                  children: [
                    Text("Upcoming events>>",style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: TextButton(onPressed: (){}, child: Text("Edit",style: TextStyle(color: Colors.blue)
                     
                      ),
                      ),
                      
                      
                      
                    )
                  ],
                ), 
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(onPressed: (){

                }, child: Text("LogOut",style: TextStyle(color: Colors.blue.shade900),)),
              )
          ],
          
        ),
      
      ),

    );
  }
}