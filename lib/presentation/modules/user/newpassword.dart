import 'package:flutter/material.dart';
class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 36, 90),
      body: Padding(
        padding: const EdgeInsets.all( 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
            const Text("New password",
            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
            const SizedBox(height: 30,),
             Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12)
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "New password",
                    hintStyle: TextStyle(
                      color: Colors.grey
                    )
                
                  )
                  ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
           Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12)
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                      color: Colors.grey
                    )
                
                  )
                  ),
              ),
            ),
          ),
          

          
        ],
        
        ))
    );
    
  }
}