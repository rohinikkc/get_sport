import 'package:flutter/material.dart';

class ClubRegister extends StatefulWidget {
  const ClubRegister({super.key});

  @override
  State<ClubRegister> createState() => _ClubRegisterState();
}

class _ClubRegisterState extends State<ClubRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: AppBar(
          backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
        leading: Icon(Icons.arrow_back,color: Colors.blue.shade900),
        title:Text("Registration  List"),
        actions: [
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.search,color: Colors.blue.shade900),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Icon(Icons.add,color: Colors.blue.shade900),
         
       ),
      
       
        ],
      ),
                backgroundColor:const Color.fromARGB(255, 70, 109, 166).withOpacity(.6) ,
             body: ListView.builder(
              itemCount: 4,
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
                            fontSize:20 ,fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                                                    ),
                        subtitle:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Age:24",style: TextStyle(
                              fontSize: 13,color: Colors.white
                            ),),
                            Text("Tournament Name",style: TextStyle(
                              fontSize: 13,color: Colors.white
                            ),),
                            Text("lara@gmail.com",style: TextStyle(
                              fontSize: 13,color: Colors.white
                            ),),
                            Text("9748512378",style: TextStyle(
                              fontSize: 13,color: Colors.white
                            ),),
                            Text("25june2024",style: TextStyle(
                              fontSize: 13,color: Colors.white
                            ),),
                            Text("10:30am",style: TextStyle(
                              fontSize: 13,color: Colors.white
                            ),),
                             ElevatedButton.icon(onPressed: (){},
                                        icon: Icon(Icons.add_task_outlined,color: Colors.blue,),
                                         label: Text("confirm",style: TextStyle(color: Colors.blue)))
                          ],
                        ) ,
                        
                        
                        
                        
                        
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30,left: 90),
                        child: Divider(thickness: 1,),
                      )
                    ],
                  ),
                );
              
                          
             },
                 )

    );
  }
}