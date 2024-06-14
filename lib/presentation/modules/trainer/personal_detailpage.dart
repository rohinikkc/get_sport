import 'package:flutter/material.dart';

class PersonalDetail extends StatefulWidget {
  const PersonalDetail({super.key});

  @override
  State<PersonalDetail> createState() => _PersonalDetailState();
}

class _PersonalDetailState extends State<PersonalDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor:Colors.blue.shade900.withOpacity(.6) ,
      appBar: AppBar(
        leading: 
        
        IconButton(onPressed: (){
          // Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back), ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Edit Profile",style: TextStyle(fontSize: 20),),
           
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/pro.png"),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white,width: 2),
                  
                )
              )
            ),
            
          ),
           Padding(
             padding: const EdgeInsets.all(10),
             child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white,width: 2),
                    
                  )
                )
              ),
           ),
           ElevatedButton(onPressed: (){}, child: Text("SAVE",style: TextStyle(color: Colors.blue.shade900),)),
           TextButton(onPressed: (){}, child: Text("Delete Account",style: TextStyle(color: Colors.white),))
        ],
      ),

    );
  }
}