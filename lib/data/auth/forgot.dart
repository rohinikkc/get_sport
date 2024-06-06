import 'package:flutter/material.dart';

class ForgotPswrd extends StatefulWidget {
  const ForgotPswrd({super.key});

  @override
  State<ForgotPswrd> createState() => _ForgotPswrdState();
}

class _ForgotPswrdState extends State<ForgotPswrd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 36, 90),
      body: Padding(
        padding: EdgeInsets.all( 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50,),
            const Text("Forgot Password",
            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),),
            const SizedBox(height: 10,),
            const Text("Enter your Email Address",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
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
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.grey
                    )
                
                  )
                  ),
              ),
            ),
          ),
          const SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all( 30.0),
            // child: Container(              
            //   padding: EdgeInsets.all(5),
            //   decoration: BoxDecoration(
            //     color: Colors.deepPurpleAccent,
            //     borderRadius: BorderRadius.circular(10)
            //   ),
              
              child:Center(
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                    // Text("New ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                    // SizedBox(height: 10,),
                    ElevatedButton(onPressed: () 
                   {
                  
                   } ,
                   child:const Text("New password") ,
                   )
                    ],                 
                )  ,         
            ),
            
          )
          // )
          ],
        ),
      ),
    );
  }
}