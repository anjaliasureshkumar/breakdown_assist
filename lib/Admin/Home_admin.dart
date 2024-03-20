import 'package:flutter/material.dart';

import 'Admin_Mechanic.dart';
import 'Admin_User.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                Admin_User(),
                Admin_Mechanic(),
              ],),
              )
            ],
            ),
        ),
      );
  }
}
