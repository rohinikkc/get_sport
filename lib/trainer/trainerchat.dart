import 'package:flutter/material.dart';

class TrainerChat extends StatefulWidget {
  const TrainerChat({super.key});

  @override
  State<TrainerChat> createState() => _TrainerChatState();
}

class _TrainerChatState extends State<TrainerChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.menu,color: Colors.blue.shade900),
        actions: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.search,color: Colors.blue.shade900),
       ),
        Icon(Icons.notifications,color: Colors.blue.shade900),
        ],
      ),
        backgroundColor: Colors.blue.shade900.withOpacity(.8),
        body: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(right:200,top: 60),
              child: Text("Messages",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Container(
              height:550,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Expanded(  
                child: ListView.builder(
                  
                  itemCount: 5,
                  itemBuilder: (context,index){
                
                  return InkWell(
                    onTap: () {
                      
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: ListTile(
                            
                            
                            leading: CircleAvatar(
                              radius: 60,
                              child: Image.asset("assets/profile.png"),
                          
                            ),
                          
                            title: Text("lara",
                            style: TextStyle(
                              fontSize:20 ,fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle:Text("online",style: TextStyle(
                            fontSize: 13,fontWeight: FontWeight.w300,
                          ),) ,
                          trailing: Text("10:20am"),
                          
                          
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30,left: 90),
                          child: Divider(thickness: .5,),
                        )
                      ],
                    ),
                  );
                  
                  
                },
                
                
                
              )
              ),
        ),
        
          ]

    )
    );
  }
}