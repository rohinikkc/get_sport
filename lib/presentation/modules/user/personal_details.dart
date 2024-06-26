import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/crud/controller.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/usermodel.dart';
import 'package:getsport/presentation/widget/helper.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final nameControlller = TextEditingController();
  final phoneController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: DbController()
            .getUserData("user", FirebaseAuth.instance.currentUser!.uid)
            .asStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Helper.indiacator();
          }
          if (!snapshot.hasData) {
            return SizedBox();
          }
          UserModel usemodel =
              UserModel.fromMap(snapshot.data!.data() as Map<String, dynamic>);
          return Scaffold(
            backgroundColor: Colors.blue.shade900.withOpacity(.6),
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              title: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              actions: [
                InkWell(
                  onTap: () {
                    Controller()
                        .pickImage()
                        .then((file) => Controller().uploadImage(file!))
                        .then(
                            (url) => DbController().updateUserProfileImage(url))
                        .then((value) => Navigator.pop(context));
                  },
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: usemodel.imageUrl == ""
                        ? AssetImage("assets/pro.png") as ImageProvider
                        : NetworkImage(usemodel.imageUrl!),
                  ),
                )
              ],
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      controller: nameControlller,
                      validator: (value) {},
                      decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.white, width: 2),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                          hintText: "Phone No.",
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.white, width: 2),
                          ))),
                ),
                ElevatedButton(
                    onPressed: () {
                      DbController().updateUserProfile(
                          nameControlller.text.isEmpty
                              ? usemodel.name
                              : nameControlller.text,
                          phoneController.text.isEmpty
                              ? usemodel.phone
                              : phoneController.text);
                    },
                    child: Text(
                      "SAVE",
                      style: TextStyle(color: Colors.blue.shade900),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Delete Account",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          );
        });
  }
}
