import 'package:flutter/material.dart';

import 'Mechanic_List.dart';
import 'Admin_Userlist.dart';
import 'Mechanic_List.dart';
import 'Mechanic_List.dart';
import 'Mechanic_List.dart';
import 'Mechanic_List.dart';
import 'Mechanic_List.dart';
import 'Mechanic_List.dart';

class Admin_Home_tab extends StatefulWidget {
  const Admin_Home_tab({super.key});

  @override
  State<Admin_Home_tab> createState() => _Admin_Home_tabState();
}

class _Admin_Home_tabState extends State<Admin_Home_tab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(tabs: [Tab(child: Text("User"),
            ),
              Tab(child:Text("Mechanic"),)
              ]),
              Expanded(
              child: TabBarView(children: [
                Admin_Userlist(),
                Mechanic_List(),
              ],),
              )
            ],
            ),
        ),
      );
  }
}
