import 'package:flutter/material.dart';
import 'package:getsport/presentation/modules/club/club.notification.dart';
import 'package:getsport/presentation/modules/club/club_account.dart';

class ClubMenu extends StatefulWidget {
  const ClubMenu({super.key});

  @override
  State<ClubMenu> createState() => _ClubMenuState();
}

class _ClubMenuState extends State<ClubMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             drawer: Drawer(
        backgroundColor: Colors.blue.shade900,
         child: ListView(
          children: [UserAccountsDrawerHeader(
            accountName:Text("Real Madrid Club"),
           accountEmail: Text("madrid@gmail.com"),
           currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("assets/club.png"),
           ),
           ),
           ListTile(
            leading: Icon(Icons.person),
            iconColor: Colors.white,
            title: Text("Account",style: TextStyle(color: Colors.white),
            ),
            
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ClubAccount()));
            },
           ),
            
            ListTile(
            leading: Icon(Icons.notification_add_outlined),
            iconColor: Colors.white,
            title: Text("Notification",style: TextStyle(color: Colors.white),
            ),
            onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>ClubNotification()));
 
            },
           ),
           
           ListTile(
            leading: Icon(Icons.logout_outlined),
            iconColor: Colors.white,
            title: Text("logout",style: TextStyle(color: Colors.white),
            ),
            onTap: (){},
           ),
           ],
         ),
      ),

    );
  }
}