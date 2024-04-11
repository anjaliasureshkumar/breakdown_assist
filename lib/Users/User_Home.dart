
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'User_Mechanic_List.dart';
import 'User_Notification.dart';
import 'User_Profile.dart';
import 'User_Request_Mechanic_List.dart';
class User_home extends StatefulWidget {
  const User_home({super.key});

  @override
  State<User_home> createState() => _User_homeState();
}

class _User_homeState extends State<User_home> {

  String? _selectedLocation = 'All Locations'; // Initial selection
  List<String> _locations = []; // Initial list with "All Locations"

  @override
  void initState() {
    super.initState();
    // Fetch locations from Firebase on initialization
    _fetchLocations();
  }

  // Function to fetch locations from Firebase
  void _fetchLocations() async {
    // Clear the list
    _locations.clear();
    // Add "All Locations" as the default option
    _locations.add('All Locations');

    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('mechanics').get();
    List<String> locations = [];
    querySnapshot.docs.forEach((doc) {
      locations.add(doc['location']);
    });
    setState(() {
      _locations.addAll(locations); // Add fetched locations to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade100,
          leading: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return User_Profile();
                },
              ));
            },
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/person image.jpg"),
            ),
          ),
            centerTitle: true,
            title: DropdownButton<String>(
              dropdownColor: Colors.white,
              value: _selectedLocation,
              icon: Icon(Icons.arrow_drop_down),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLocation = newValue;
                });
              },
              items: _locations.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => User_Notification()));
                },
                icon: Icon(
                  Icons.notifications,
                  color: Colors.amber,
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Container(
                color: Colors.lightBlue.shade100,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueAccent.shade100),
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(
                      child: Text(
                        "Mechanic",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Request",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        body:  TabBarView(children: [
          User_Mechanic_List(selectedLocation:  _selectedLocation == 'All Locations'
            ? null
            : _selectedLocation),
          User_Request_Mechanic_List(),
        ]),
      ),
    );
  }
}
