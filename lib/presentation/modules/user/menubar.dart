import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/model/usermodel.dart';
import 'package:getsport/presentation/modules/user/bottom_navigation.dart';
import 'package:getsport/presentation/modules/user/useraccount.dart';
import 'package:getsport/presentation/widget/helper.dart';

class Menu extends StatefulWidget {
  Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String id = _auth.currentUser!.uid;

    return Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_sharp,
              )),
        ),
        body: SingleChildScrollView(
          child:  StreamBuilder(
                      stream: _firestore.collection('user').doc(id).snapshots(),
                      builder: (context, snapshot) {

                        if(snapshot.connectionState==ConnectionState.waiting){
                          return Helper.indiacator();
                        }
                        UserModel userModel =
                            UserModel.fromMap(snapshot.data!.data()!);
                        // String image  = userModel.imageUrl.toString()=="";
                        // DocumentSnapshot image=snapshot.data!;
                        return Column(
                children: [
                  Row(
                    children: [
                     userModel.imageUrl==""?CircleAvatar(
                      
                       radius: 40,
                       child: Text("No Profile",style: TextStyle(fontSize: 8),),
                       ):
                             CircleAvatar(
                                radius: 40, backgroundImage: NetworkImage(userModel.imageUrl!)
                                // fetch the image
                                ),
                        
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "HI, Welcome Back",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                                    userModel.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                            // StreamBuilder(
                            //   stream: FirebaseFirestore.instance
                            //       .collection('user')
                            //       .doc(id)
                            //       .snapshots(),
                            //   builder: (context, snapshot) {
                            //     UserModel userModel =
                            //         UserModel.fromMap(snapshot.data!.data()!);
                            //     //String image=userModel.imageUrl.toString();
                            //     return Padding(
                            //       padding: const EdgeInsets.only(top: 10, left: 10),
                            //       child: 
                            //     );
                            //   },
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
              
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('Account'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserAccount()));
              
                      print('Account tapped');
                    },
                  ),
              
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text('Notification'),
                    onTap: () {
                      print('Notification tapped');
                    },
                  ),
              
                  ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text(' Order Details'),
                    onTap: () {
                      print('Orders tapped');
                    },
                  ),
              
                  ListTile(
                    leading: const Icon(Icons.favorite),
                    title: const Text(' favourites '),
                    onTap: () {
                      print('Wishlist tapped');
                    },
                  ),
              
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Help & Support'),
                    onTap: () {
                      print('Help and Support tapped');
                    },
                  ),
              
                  ListTile(
                    leading: const Icon(Icons.info),
                    title: const Text('App info'),
                    onTap: () {
                      print('App info tapped');
                    },
                  ),
                  //  const SizedBox(//),
              
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () {
                      Helper.clearPreference(context);
              
                      print('Logout tapped');
                    },
                  )
                ],
              );
            }
          ),
        ));
  }
}
