import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/presentation/modules/trainer/trainermenu.dart';

class MsgSend extends StatelessWidget {
  const MsgSend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TrainerMenu(),
      appBar: AppBar(
          backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Builder(builder: (context){
          return IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon:         Icon(Icons.menu,color: Colors.blue.shade900),
);
        }),
        //  Icon(Icons.menu,color: Colors.blue.shade900),
        actions: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.search,color: Colors.blue.shade900),
       ),
        Icon(Icons.notifications,color: Colors.blue.shade900),
        ],
      ),
   
        backgroundColor: Colors.blue.shade900.withOpacity(.8),
    );
  }
}