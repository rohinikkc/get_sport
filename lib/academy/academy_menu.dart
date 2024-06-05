import 'package:flutter/material.dart';

class AcademyMenu extends StatefulWidget {
  const AcademyMenu({super.key});

  @override
  State<AcademyMenu> createState() => _AcademyMenuState();
}

class _AcademyMenuState extends State<AcademyMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: Drawer(
        backgroundColor: Colors.blue.shade900,
         child: ListView(
          children: [UserAccountsDrawerHeader(
            accountName:Text("Ak2 Academy"),
           accountEmail: Text("ak2@gmail.com"),
           currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("assets/ak2.png"),
           ),
           ),
           ListTile(
            leading: Icon(Icons.person),
            iconColor: Colors.white,
            title: Text("Account",style: TextStyle(color: Colors.white),
            ),
            onTap: (){},
           ),
            
            ListTile(
            leading: Icon(Icons.notification_add_outlined),
            iconColor: Colors.white,
            title: Text("Notification",style: TextStyle(color: Colors.white),
            ),
            onTap: (){},
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