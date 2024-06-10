import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/data/model/event_model.dart';
import 'package:getsport/data/model/regis_event_model.dart';
import 'package:getsport/presentation/modules/user/payment.dart';
import 'package:getsport/presentation/widget/payment_page.dart';

class EventRegForm extends StatefulWidget {
  EventModel model;
  EventRegForm({super.key, required this.model});

  @override
  State<EventRegForm> createState() => _EventRegFormState();
}

class _EventRegFormState extends State<EventRegForm> {
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final teamName = TextEditingController();
  final place = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    DateTime _dateTime = DateTime.now();
    TimeOfDay _selectedtime = TimeOfDay.now();
    void _showdatepicker() {
      showDatePicker(
              context: context,
              firstDate: DateTime.now(),
              lastDate: DateTime(3000))
          .then((Value) => setState(
                () {
                  _dateTime = Value!;
                },
              ));
    }

    return Scaffold(
      backgroundColor: Colors.blue.shade900.withOpacity(.6),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset("assets/booking.png"),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: 500,
                    width: 400,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 15, right: 15),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field Required";
                                } else {
                                  return null;
                                }
                              },
                              controller: name,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  hintText: "Name",
                                  hintStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 15, right: 15),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field Required";
                                } else {
                                  return null;
                                }
                              },
                              controller: phoneNumber,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  hintText: "Phone number",
                                  hintStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 15, right: 15),
                            child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Field Required";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: teamName,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  hintText: "Team Name",
                                  hintStyle: TextStyle(color: Colors.black),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 15, right: 15),
                            child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Field Required";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: place,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  hintText: "Location",
                                  hintStyle: TextStyle(color: Colors.black),
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PaymentPage(
                                            eventId: widget.model.eventId,
                                                amount: double.parse(
                                                    widget.model.joinfee),
                                                regEventModel: RegEventModel(
                                                    location: place.text,
                                                    name: name.text,
                                                    phoneNumber:
                                                        phoneNumber.text,
                                                    regId: FirebaseAuth.instance
                                                        .currentUser!.uid,
                                                    teamName: teamName.text),
                                              )));
                                }
                              },
                              child: const Text("Book Now"))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
