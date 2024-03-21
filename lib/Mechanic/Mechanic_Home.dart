




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Mechanic_Rating.dart';
import 'Mechanic_Tab.dart';
import 'Service_Page.dart';

class Mechanic_Home extends StatefulWidget {
  const Mechanic_Home({super.key});

  @override
  State<Mechanic_Home> createState() => _Mechanic_HomeState();
}

class _Mechanic_HomeState extends State<Mechanic_Home> {
  int _indexNum=0;
  List tabs = [
    Mechanic_Request(),
    Mechanic_Service_Page(),
    Mechanic_Rating(),


  ];
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(

          leading: GestureDetector(
            onTap: (){
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Edit_profile()),
              // );


            },
            child: CircleAvatar(

              backgroundImage: ExactAssetImage("assets/images/person image.jpg"),
            ),
          ),
          actions: [
            IconButton(onPressed: (){
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Nofification_Mech()),
              // );


            }, icon: Icon(Icons.notification_add_outlined))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            label: "Request",
            icon: Icon(Icons.person_search),
          ),
          BottomNavigationBarItem(
            label: "Service",
            icon: Icon(Icons.miscellaneous_services)
            ,),
          BottomNavigationBarItem(
              label: "Rating",
              icon: Icon(Icons.eighteen_up_rating_outlined))
        ],
            iconSize: 25,



            currentIndex: _indexNum,
            onTap: (int index){

              setState(() {
                _indexNum= index;
              });

            }
        ),
        body: tabs.elementAt(_indexNum),

      ),








    );
  }
}

