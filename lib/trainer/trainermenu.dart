import 'package:flutter/material.dart';

class TrainerMenu extends StatelessWidget {
  const TrainerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.blue.shade900,
         child: ListView(
          children: [UserAccountsDrawerHeader(
            accountName:Text("John Smith"),
           accountEmail: Text("johnsmith@gmail.com"),
           currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage("assets/trainer.png"),
           ),
           ),
           ListTile(
            leading: 
            Icon(Icons.person),
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
            leading: Icon(Icons.calendar_month),
            iconColor: Colors.white,
            title: Text("schedule",style: TextStyle(color: Colors.white),
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