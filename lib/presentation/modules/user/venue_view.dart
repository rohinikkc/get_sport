import 'package:flutter/material.dart';
import 'package:getsport/data/model/venue_model.dart';
import 'package:getsport/presentation/modules/user/event_reg_form.dart';
import 'package:getsport/presentation/modules/user/page_slote_booking.dart';

class VenueView extends StatefulWidget {
  VenueModel model;

  VenueView({super.key, required this.model});

  @override
  State<VenueView> createState() => _VenueViewState();
}

class _VenueViewState extends State<VenueView> {
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.model.imageUrl,
              width: double.infinity,
              height: 200,
            ),

            // SizedBox(height: 20),

            Column(
              children: [
                const Text(
                  "DIEGO FOOTBALL TOURNAMENT",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Row(
                  children: [
                    const Icon(Icons.schedule, color: Colors.blue),
                    Text("9:30am-7:30pm",
                        style: TextStyle(color: Colors.black.withOpacity(0.8))),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.blue,
                    ),
                    Text(
                      "thrissur",
                      style: TextStyle(color: Colors.black.withOpacity(0.8)),
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 160, top: 20),
                  child: Text(
                    'Available Sports:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Basketball'),
                Text('Table Tennis'),
              ],
            ),

            const SizedBox(height: 20),

            const Row(
              children: [
                Text(
                  'Amenities:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.water_drop_outlined),
                    SizedBox(width: 5),
                    Text('Water'),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.bathroom_outlined),
                    SizedBox(width: 5),
                    Text('Washroom'),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.light),
                    SizedBox(width: 5),
                    Text('Flood Light'),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.local_parking_outlined),
                    SizedBox(width: 5),
                    Text('Parking'),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.chair_outlined),
                    SizedBox(width: 5),
                    Text('Seating Area'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {

                showDialog(context: context, builder: (context)=>AlertDialog(

                  title: Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        controller: nameController,
                        validator: (value) {
                          if(value!.isEmpty){
                           return "Field is required";
                          }else{
                            return  null;
                          }
                        },
                        decoration: const InputDecoration(hintText: "Name"),
                        
                      ),
                      const SizedBox(height: 20,),
                       TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if(value!.isEmpty){
                           return "Field is required";
                          }else{
                            return  null;
                          }
                        },
                        decoration: const InputDecoration(hintText: "Email"),
                        
                      ),
                      const SizedBox(height: 30,),
                    
                      ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>SlotePackagePage(
                        amount: widget.model.price,
                        
                        venueName: widget.model.venueName, venueID: widget.model.venueID!, email: emailController.text, name: nameController.text) ),);
                    }
                    
                      }, child: const Text("Book Now"))
                    ],),
                  ),
                ));

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Booking()));

                // print('Book Now button pressed');
              },
              child: const Text('BOOK NOW'),
              style: ElevatedButton.styleFrom(
                // color: Colors.deepPurpleAccent,
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
