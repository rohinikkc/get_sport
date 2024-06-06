import 'package:flutter/material.dart';

class Helper{

 static h(context){
  return MediaQuery.of(context).size.height;
}

static  w(context){
    return MediaQuery.of(context).size.width;

}


static errorSnackBar(context,message){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(message)));
}
static successSnackBar(context,message){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Text(message)));
}



static Widget indiacator(){
  return const  Center(child: CircularProgressIndicator(),);
}

static Widget emptyListWidget(List<dynamic>list,  String message,Widget child){
  return  list.isEmpty?  Center(child: Text(message),):child;
}








}