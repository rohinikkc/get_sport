import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/presentation/modules/user/payment.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context)
   { DateTime _dateTime=DateTime.now();
     TimeOfDay _selectedtime=TimeOfDay.now();
     void _showdatepicker(){
      showDatePicker(context: context, firstDate: DateTime.now(), 
      lastDate: DateTime(3000)).then((Value)=> setState(() {
       _dateTime=Value!;
      },));
     }
    return  Scaffold(
      backgroundColor: Colors.blue.shade900.withOpacity(.6),
      
       body:SingleChildScrollView(
        child: Column(
        children: [
          SizedBox(height: 60,),
          Image.asset("assets/booking.png"),
         Center(
        
        
         child: Padding(
           padding: const EdgeInsets.only(top: 20),
           child: Container(
                 height: 500,
                 width: 400,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60))
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
                        child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderSide:BorderSide(color: Colors.blue)),
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.black
                          )
                        ),  
                        ),
                      ),
                      
                        Padding(
                          padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
                          child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide:BorderSide(color: Colors.blue)),
                            hintText: "Phone number",
                            hintStyle: TextStyle(color: Colors.black
                            )
                          ),  
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
                          child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide:BorderSide(color: Colors.blue)),
                            hintText: "Date",
                            hintStyle: TextStyle(color: Colors.black),
                            suffixIcon: Icon(Icons.calendar_month)
                          ),  
                          ),
                        ),
                       Padding(
                          padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
                          child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderSide:BorderSide(color: Colors.blue)),
                            hintText: "Time",
                            hintStyle: TextStyle(color: Colors.black),
                            suffixIcon: Icon(Icons.timer_outlined)
                          ),  
                          ),
                        ), 
                        SizedBox(height: 20,),
                         ElevatedButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Payment()));
       }, child: Text("Book Now"))
                    ],
                  ),
           ),
         ),
       ),
      
       ],
       ) ,),
      
      
    );
  }
}