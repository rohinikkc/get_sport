import 'package:flutter/material.dart';
class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 36, 90),
      body: Padding(
        padding: EdgeInsets.all( 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Text("New password",
            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 30,),
             Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
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
          SizedBox(height: 20,),
           Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
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