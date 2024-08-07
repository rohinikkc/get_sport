import 'dart:io';

import 'package:flutter/material.dart';
import 'package:getsport/presentation/modules/user/login_screen.dart';
import 'package:getsport/data/crud/controller.dart';
import 'package:getsport/presentation/modules/user/venueview.dart';
import 'package:getsport/data/model/usermodel.dart';
import 'package:getsport/presentation/modules/user/bottom_navigation.dart';
import 'package:getsport/presentation/modules/user/newpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';


class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _Accountstate();
}


class _Accountstate extends State<Account>
     {
      Controller controller=Controller();
   final usernameController=TextEditingController();
   final emailController=TextEditingController();
   final PasswordController=TextEditingController();
   final ConfirmPasswordController=TextEditingController();
   final MobilenNumberController=TextEditingController();
   final imagecontroller=TextEditingController();
   final _auth=FirebaseAuth.instance;
   final _formkey=GlobalKey<FormState>();
   File?selectedImage;

   String Email="",Password="";
   Future<void>_pickImageFromGallery()async{
    final pickedImage = await controller.pickImage();
    if (pickedImage != null) {
      setState(() {
        selectedImage = File(pickedImage.path);
});
}
}
Future<void> _register() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        Email= emailController.text;
        Password= PasswordController.text;
      });

      try {
        final userCredential = await _auth.createUserWithEmailAndPassword(
          email: Email,
          password: Password,
        );
        final uid = userCredential.user!.uid;

        String imageUrl = '';
        if (selectedImage != null) {
          imageUrl = await controller.uploadImage(XFile(selectedImage!.path));
        }

        final userModel = UserModel(
            name: usernameController.text,
            email: emailController.text,
            phone: MobilenNumberController.text,
            imageUrl: imageUrl,
            id: uid);

        await controller.addUser(userModel, uid);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration successful')),
        );
        
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Weak password')),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('E-mail is already in use')),
          );
        }
      } catch (e) {
        print(e);
      }
    }
  }

//    registration()async{
//     if(Password!=null){
//       try{
//         setState(() {
//           isloading=true;
//         });
//         // UserCredential userCredential=await firebaseAuth.instance.createUserWithEmailAndPassword(email:email,Password:Password);
//    await FirebaseAuth.instance.createUserWithEmailAndPassword(email:Email,password:Password).then((value) {
// ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content:Text("sign in successfully done")));
//         Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>Navigation(indexnum: 0,)));
//         setState(() {
//           isloading=false;
//         });
//         });
      
//       }
//       on FirebaseAuthException catch(e) {
//         setState(() {
//           isloading=false;
//         });
//         if(e.code=='weak-password'){
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('weak password'),),);
//         }
//         else if(e.code=='email-already in use'){
//           setState(() {
//           isloading=false;
//         });
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content:Text('email already use'),),);
//         }else{
//             ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content:Text(e.code),),);
//         }
//       }
//     }
//    }
  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  bool isloading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: const Color.fromARGB(255, 0, 36, 90),
    body: SingleChildScrollView(
      child: Center(
      child: Form(
        key: _formkey,
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25,),
            const Text("Create Account Now!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color:Colors.white),),
            const SizedBox(height: 20,),
            
            Padding(
              padding: const EdgeInsets.only(top: 20,bottom: 30),
              child: Center(
                child: CircleAvatar(
                  radius: 45,
                  backgroundImage: selectedImage!=null?
                  FileImage(selectedImage!):
                  const AssetImage("assets/profile.png")as ImageProvider,
                  child: IconButton(onPressed: _pickImageFromGallery,
                 icon: const Icon(Icons.camera_alt_rounded,color: Colors.black,), ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: usernameController,
                decoration: InputDecoration(fillColor: Colors.white,filled: true,
                  border:OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: const BorderSide(color: Colors.white)),
                  
                  //  InputBorder.none,
                  hintText: "Name",
                  hintStyle: const TextStyle(
                    color: Colors.grey
                  )
              
                ),
                validator:(value){
                  if(value!.isEmpty){
                    return"please enter a value";
                            
                  }
                  return null ;
                } ,
                ),
            ),
             const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.grey
                      )
                  
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "please enter a valid email";
                      }
                      RegExp emailRegExp=RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
                      );
                      if(!emailRegExp.hasMatch(value)){
                        return"please enter a valid email ";
                      }
                        return null;

                    },
                    ),
                ),
              ),
            ),
              const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child:TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: PasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "password",
                      hintStyle: TextStyle(
                        color: Colors.grey
                      )
                  
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "please enter a value";
                      }
                      return null;
                    }
                    ),
                ),
              ),
            ), 
              const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: ConfirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(
                        color: Colors.grey
                      )
                  
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "please enter a value";
                      }
                      return null;

                    }
                    ),
                ),
              ),
            ),
              const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: MobilenNumberController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mobile Number",
                      hintStyle: TextStyle(
                        color: Colors.grey
                      )
                  
                    ),
                    validator: (value) {
                      if(value!.isEmpty){
                        return "please enter a value";
                      }
                         return null;
                    }
                    ),
                ),
              ),
            ),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all( 30.0),
              child:isloading? const Center(child: CircularProgressIndicator(),):  GestureDetector(
                onTap: _register,
                // (){
                //   if(_formkey.currentState!.validate()) {}
                //   setState(() {
                //      Email=EmailController.text;
                //          Password=PasswordController.text;
                //   });
                //   _register();
                  
                // },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:const Center(
                  child: Text("Sign UP",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
                            ),
              )),

              const SizedBox(
                height: 50,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Are yor accound'),

                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                  }, child: const Text('loggin',style: TextStyle(color: Colors.blue),))
                ],
              )
          ],
        
        ),
      ),
        
    ),  
    ) 
    
    );
     
        
  }
}