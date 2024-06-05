import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getsport/admin/add_academy.dart';
import 'package:getsport/model/acadamymodel.dart';

class AcademyList extends StatefulWidget {
  const AcademyList({super.key});

  @override
  State<AcademyList> createState() => _AcademyListState();
}

class _AcademyListState extends State<AcademyList> {
  Stream? acadamyStream;
  final _formkey= GlobalKey<FormState>();
  TimeOfDay? classTime;
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sportsController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  _callAcadamy() async {
    acadamyStream =
        await FirebaseFirestore.instance.collection('Acadamy').snapshots();
    setState(() {});
  }

  @override
  void initState() {
    _callAcadamy();
    super.initState();
  }

  _callForEdit(DocumentSnapshot ds) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      validator: (value) {
                        nameController.text.length!=0;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: "Acadamy Name", border: OutlineInputBorder()),
                    ),
                    TextFormField(
                      validator: (value) {
                        locationController.text.length!=0;
                      },
                      controller: locationController,
                      decoration: InputDecoration(
                          hintText: "Location", border: OutlineInputBorder()),
                    ),
                    TextFormField(
                      validator: (value) {
                        sportsController.text.length!=0;
                      },
                      controller: sportsController,
                      decoration: InputDecoration(
                          hintText: "Sports Class", border: OutlineInputBorder()),
                    ),
                    TextFormField(
                      validator: (value) {
                        timeController.text.length!=0;
                      },
                      controller: timeController,
                      decoration: InputDecoration(
                          hintText: "Time", border: OutlineInputBorder()),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blueAccent),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 6.0),
                          child: TextButton(
                            onPressed: () async {
                                  if(_formkey.currentState!.validate()){
                                    final acadamyModel = AcadamyModel(
                                  acadamyName: nameController.text,
                                  image: ds['image'],
                                  location: locationController.text,
                                  sportsClass: sportsController.text,
                                  time: classTime,
                                  id: ds['id']);
                                   await FirebaseFirestore.instance
                                  .collection('Acadamy')
                                  .doc(ds['id'])
                                  .update(acadamyModel.toMap()).then((value) {
                                    Navigator.pop(context);
                                  });
                                  }
                              
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor:const Color.fromARGB(255, 70, 109, 166).withOpacity(.6) ,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue.shade900),
          backgroundColor:
              const Color.fromARGB(255, 139, 192, 235).withOpacity(0.8),
          title: Text("Academy List"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.blue.shade900)),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddAcademy()));
                },
                icon: Icon(Icons.add, color: Colors.blue.shade900)),
          ],
        ),
        backgroundColor:
            const Color.fromARGB(255, 70, 109, 166).withOpacity(.6),
        body: StreamBuilder(
            stream: acadamyStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot ds = snapshot.data!.docs[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 200,
                            width: 330,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.blueGrey)),
                            child: Column(
                              children: [
                                Text(
                                  ds['acadamyName'],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 100,
                                        width: 100,
                                        child: ds.exists
                                            ? Image.network(ds['image'])
                                            : Center(
                                                child: Text("Photo"),
                                              )),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              ds['location'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            Icon(Icons.location_on),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 190,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.blueGrey),
                                          child: Center(
                                            child: Text(
                                              ds['sportsClass'],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Timing:",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text(
                                          "Monday- Friday   ${ds['time']}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                        Row(
                                          children: [
                                            ElevatedButton.icon(
                                                onPressed: () {
                                                  _callForEdit(ds);
                                                },
                                                icon: Icon(
                                                  Icons.edit,
                                                  color: Colors.blue,
                                                ),
                                                label: Text("Edit",
                                                    style: TextStyle(
                                                        color: Colors.blue))),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            ElevatedButton.icon(
                                                onPressed: () {
                                                  FirebaseFirestore.instance.collection('Acadamy').doc(ds['id']).delete();
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.blue,
                                                ),
                                                label: Text("Delete",
                                                    style: TextStyle(
                                                        color: Colors.blue)))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Container();
            }));
  }
}
