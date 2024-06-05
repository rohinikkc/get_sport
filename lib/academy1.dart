import 'package:flutter/material.dart';

class Academypg1 extends StatefulWidget {
  const Academypg1({super.key});

  @override
  State<Academypg1> createState() => _Academypg1State();
}

class _Academypg1State extends State<Academypg1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
        
          
        ],
        backgroundColor:
            const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
      ),
      backgroundColor: Colors.blue.shade900.withOpacity(.6),
        body:
        
        
         Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               
               const SizedBox(height: 10.0),
               Text(
                 'AK2 FOOTBALL ACADEMY',
                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
               ),
               const Text('Malappuram'),
               const Text('4.2'),
               const SizedBox(height: 10.0),
               Row(
                 children: [
                   const Text('Timing:'),
                   const SizedBox(width: 10.0),
                   Text('9:00 AM-5:00 PM'),
                 ],
               ),
               Row(
                 children: [
                   const Text('Monday-Saturday'),
                   const Spacer(),
                   Text('Sunday Closed'),
                 ],
               ),
               const SizedBox(height: 10.0),
               Row(
                 children: [
                   const Text('Sports classes'),
                   const Spacer(),
                   Text('Mode Of Instruction'),
                 ],
               ),
               Row(
                 children: [
                   const Text('FOOTBALL'),
                   const Spacer(),
                   Text('OFFLINE'),
                 ],
               ),
               const SizedBox(height: 10.0),
               ElevatedButton(
                 onPressed: () {
                   // Add functionality here (e.g., navigate to a new screen)
                 },
                 child: Text('SEND ENQUIRY'),
               ),
             ],
           ),
         ),
      
    );
  }
}