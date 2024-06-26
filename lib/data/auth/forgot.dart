import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getsport/presentation/widget/helper.dart';

class ForgotPswrd extends StatefulWidget {
  const ForgotPswrd({super.key});

  @override
  State<ForgotPswrd> createState() => _ForgotPswrdState();
}

class _ForgotPswrdState extends State<ForgotPswrd> {
  final emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 36, 90),
      body: Padding(
        padding: const EdgeInsets.all( 25.0),
        child: SingleChildScrollView(
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
                child:  Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
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
if(emailController.text.isNotEmpty){
  FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim()).then((value){
    Helper.successSnackBar(context, "send password reset link");
    Navigator.pop(context);
  }).catchError((error){
  Helper.errorSnackBar(context, "Error while sending reset password link!!");
  });
}
                    
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
      ),
    );
  }
}