import 'package:flutter/material.dart';
import 'package:getsport/presentation/spash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static h(context) {
    return MediaQuery.of(context).size.height;
  }

  static w(context) {
    return MediaQuery.of(context).size.width;
  }

  static errorSnackBar(context, message) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }

  static successSnackBar(context, message) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.green, content: Text(message)));
  }

  static Widget indiacator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static Widget emptyListWidget(
      List<dynamic> list, String message, Widget child) {
    return list.isEmpty
        ? Center(
            child: Text(message),
          )
        : child;
  }

static  setPreference(value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    pref.setString("UID", value);
  }

 static Future<String> getPreferences() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    return pref.getString("UID") ?? "";
  }

static Future  clearPreference(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove("UID").then((value) {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>SpashScreen()), (route) => false);

    });
  }

 static var ADMINUID="pg7yf6cYTrgvO5j6PRt8dqEsd192";
 static var recieverUPIID="getsports@paytm";
}
