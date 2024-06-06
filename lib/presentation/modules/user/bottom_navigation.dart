import 'package:flutter/material.dart';
import 'package:getsport/presentation/modules/user/academy.dart';
import 'package:getsport/presentation/modules/trainer/trainer_home.dart';
import 'package:getsport/presentation/modules/user/homepage.dart';
import 'package:getsport/presentation/modules/user/search.dart';

class Navigation extends StatefulWidget {
  int indexnum=0;

  Navigation({super.key,required this.indexnum});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final _pages=[
    const HomePage(),
    const Search(),
    const Academy(),
    const TrainerHome(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[widget.indexnum],
      bottomNavigationBar: mynav(
        index:widget.indexnum,
        onTap:(index){
          setState(() {
            widget.indexnum=index;
          });
        }
      ),
    );
  }
}
Widget mynav({
  int?index,
  void Function(int)?onTap,
  selectedcolor,
})
{
  return BottomNavigationBar(
    showSelectedLabels: true,
    currentIndex: index!,
    backgroundColor: Colors.black,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.blueGrey,
    showUnselectedLabels: true,
    onTap: onTap,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home",
     
      // backgroundColor: Colors.black
      ),
      BottomNavigationBarItem(icon: Icon(Icons.search,),label:"Search",
      // backgroundColor: Colors.black
      ),
       BottomNavigationBarItem(icon: Icon(Icons.school_sharp,),label:"Academy",

      ),
             BottomNavigationBarItem(icon: Icon(Icons.person,),label:"Trainer",
             )
    ],
  );
}