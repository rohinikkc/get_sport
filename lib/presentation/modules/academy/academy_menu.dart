import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getsport/data/db_controller.dart';
import 'package:getsport/data/model/acadamymodel.dart';
import 'package:getsport/presentation/modules/academy/academy_account.dart';
import 'package:getsport/presentation/widget/helper.dart';

class AcademyMenu extends StatefulWidget {
  const AcademyMenu({super.key});

  @override
  State<AcademyMenu> createState() => _AcademyMenuState();
}

class _AcademyMenuState extends State<AcademyMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.blue.shade900,
         child: FutureBuilder(
          future: DbController().getUserData("Acadamy", FirebaseAuth.instance.currentUser!.uid),
           builder: (context,snapshot) {

            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            AcadamyModel model=AcadamyModel.fromMap(snapshot.data!.data()! as Map<String,dynamic>);
             return ListView(
              children: [UserAccountsDrawerHeader(
                accountName:Text(model.acadamyName!),
               accountEmail: Text(model.email),
               currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(model.image!),
               ),
               ),
              //  ListTile(
              //   leading: Icon(Icons.person),
              //   iconColor: Colors.white,
              //   title: Text("Account",style: TextStyle(color: Colors.white),
              //   ),
              //   onTap: (){
              //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AcademyAccount()));
              //   },
              //  ),
                
              //   ListTile(
              //   leading: Icon(Icons.notification_add_outlined),
              //   iconColor: Colors.white,
              //   title: Text("Notification",style: TextStyle(color: Colors.white),
              //   ),
              //   onTap: (){},
              //  ),
               
               ListTile(
                leading: Icon(Icons.logout_outlined),
                iconColor: Colors.white,
                title: Text("logout",style: TextStyle(color: Colors.white),
                ),
                onTap: (){
                  Helper.clearPreference(context);
                },
               ),
               ],
             );
           }
         ),
      );
  }
}