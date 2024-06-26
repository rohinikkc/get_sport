import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/data/auth/forgot.dart';
import 'package:getsport/presentation/modules/academy/academy_home.dart';
import 'package:getsport/presentation/modules/admin/admin_login.dart';
import 'package:getsport/presentation/modules/club/club_home.dart';

import 'package:getsport/presentation/modules/trainer/trainerhome.dart';
import 'package:getsport/presentation/modules/user/create_acnt.dart';
import 'package:getsport/presentation/modules/user/event.dart';
import 'package:getsport/presentation/modules/user/bottom_navigation.dart';
import 'package:getsport/presentation/widget/helper.dart';

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
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  String password = "", email = "";
  login() async {
    try {
      setState(() {
        isloading = true;
      });
      log('===========================try is working==========================================');

      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((credential) async {
        final id = credential.user!.uid;

        if (id == Helper.ADMINUID) {
          Helper.errorSnackBar(context, "Credetial is Incorrent");
          auth.signOut();
        } else {
          final user = await db.collection("user").doc(id).get();
          final club = await db.collection("Clubs").doc(id).get();
          final coach = await db.collection("Coachs").doc(id).get();
          final academy = await db.collection("Acadamy").doc(id).get();
Helper.setPreference(id);
          if (user.exists) {
            // go to user page
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => Navigation(indexnum: 0)),
                (route) => false);
          }

          if (club.exists) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => ClubHome()),
                (route) => false);

            // go to club home
          }
          if (coach.exists) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => TrainerHome()),
                (route) => false);

            // ==>coach home
          }

          if (academy.exists) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => AcademyHome()),
                (route) => false);

            //==>academy home
          }
        }
      });
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => Navigation(
      //               indexnum: 0,
      //             )));
      Helper.successSnackBar(context, "Login succesfull");
      setState(() {
        isloading = false;
      });
    } on FirebaseAuthException catch (e) {
      Helper.errorSnackBar(context, e.toString());

      setState(() {
        isloading = false;
      });
      if (e.code == 'user-not-found') {
        Helper.errorSnackBar(context, 'user is not found');
      } else if (e.code == 'wrong-password') {
        Helper.errorSnackBar(context, 'wrong password');
      } else {
        Helper.errorSnackBar(context, e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminLogin()));
                },
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ))
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: Form(
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
                  child: SingleChildScrollView(
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
                          child: SingleChildScrollView(
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
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            controller: emailController,
                                            decoration: const InputDecoration(
                                                hintText: "Email",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: InputBorder.none),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "please enter a value";
                                              }
                                              RegExp emailRegExp = RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                                              if (!emailRegExp
                                                  .hasMatch(value)) {
                                                return "please enter a valid email ";
                                              }
                                              return null;
                                            },
                                          ),
                                          const SizedBox(
                                            height: 50,
                                          ),
                                          TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
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
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return "please enter a value";
                                              }
                                              return null;
                                            },
                                          )
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(onPressed: (){

                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPswrd()));
                        }, child: Text("Click",style: TextStyle(color: Colors.blue),))
                      ],),
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
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      width: 60,
                                      height: 40,
                                      color: Colors.blue,
                                      child: const Text('Login'),
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
                            const Text('no account'),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Account(),
                                      ));
                                },
                                child: const Text(
                                  'Create account',
                                  style: TextStyle(color: Colors.blue),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ));
  }
}
