import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/admin/admin_login.dart';
import 'package:getsport/auth/create_acnt.dart';
import 'package:getsport/event.dart';
import 'package:getsport/screens/bottom_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final PasswordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  bool isloading = false;

  String password = "", email = "";
  login() async {
    try {
      setState(() {
        isloading = true;
      });
      log('===========================try is working==========================================');

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Navigation(indexnum: 0,)));
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Login succesfull')));
      setState(() {
        isloading = false;
      });
    } on FirebaseAuthException catch (e) {
      log('===========================error message $e ==========================================');
      setState(() {
        isloading = false;
      });
      if (e.code == 'user-not-found') {
        setState(() {
          isloading = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user is not found')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('wrong password')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminLogin()));
          }, icon: Icon(Icons.person, color: Colors.black,))
        ],
      ),
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [Colors.blue.shade900, Colors.indigo.shade800])),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Welcome back!",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                const BoxShadow(
                                  color: Color.fromRGBO(169, 124, 231, 0.671),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: Column(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: emailController,
                                        decoration: const InputDecoration(
                                            hintText: "Email",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "please enter a value";
                                          }
                                          RegExp emailRegExp = RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                          if (!emailRegExp.hasMatch(value)) {
                                            return "please enter a valid email ";
                                          }
                                          return null;
                                        },
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: PasswordController,
                                        decoration: const InputDecoration(
                                          hintText: "password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          suffixIcon: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Icon(
                                              Icons.remove_red_eye_sharp,
                                              size: 20,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "please enter a value";
                                          }
                                          return null;
                                        },
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if (_formkey.currentState!.validate()) {}
                                setState(() {
                                  email = emailController.text;
                                  password = PasswordController.text;
                                });
                                login();
                              },
                              child: isloading
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      width: 60,
                                      height: 40,
                                      color: Colors.blue,
                                      child: Text('Login'),
                                    ),
                            )
                          ],
                        )
                        //   GestureDetector(
                        //     onTap: (){
                        //   if(_formkey.currentState!.validate()) {}
                        //
                        // },
                        // ),
                        // Container(
                        //   height: 30,
                        //   margin: EdgeInsets.symmetric(horizontal: 10),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(20),
                        //       color: Colors.blue.shade900),
                        //   child: const Center(
                        //     child: Text(
                        //       "Login",
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 16,
                        //           fontWeight: FontWeight.bold),
                        //     ),
                        //   ),
                        // )

                        ,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('no account'),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Account(),
                                      ));
                                },
                                child: Text(
                                  'Create account',
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
