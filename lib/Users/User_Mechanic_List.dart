import 'package:breakdown_assist/Users/User_Mechanic_Detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class User_Mechanic_List extends StatefulWidget {
  const User_Mechanic_List({Key?key,required this.selectedLocation})
      : super(key: key);
  final String? selectedLocation;

  @override
  State<User_Mechanic_List> createState() => _User_Mechanic_ListState();
}

class _User_Mechanic_ListState extends State<User_Mechanic_List> {

  int currentPage = 0; // Initialize currentPage here
  int itemsPerPage = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('mechanicsignup')
              .where('status', isEqualTo: 1)
              .get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Error:${snapshot.error}"),
              );
            }
            final mech = snapshot.data?.docs ?? [];
            List<DocumentSnapshot> filteredMechanicsignup = [];
            if (widget.selectedLocation != null) {
              // Filter mechanics by selected location
              filteredMechanicsignup = mech
                  .where((doc) => doc['location'] == widget.selectedLocation)
                  .toList();
            } else {
              // Show all mechanics if no location selected
              filteredMechanicsignup = [...mech];
            }
            final totalItems = filteredMechanicsignup.length;
            final totalPages = (totalItems / itemsPerPage).ceil();
            return  Column(
                children: [
            Expanded(
            child: ListView.builder(
            itemCount: (currentPage == totalPages - 1)
                ? totalItems - (currentPage * itemsPerPage)
                : itemsPerPage,
            itemBuilder: (BuildContext context, int index) {
            final dataIndex = (currentPage * itemsPerPage) + index;
            if (dataIndex >= totalItems) {
            return SizedBox();
            }
            return InkWell(
            onTap: () {
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => User_Mechanic_Detail(id: mech[index].id,)),
            );
            },
            child: Card(
            color: Colors.blue.shade50,
            child: Row(
            children: [
            SizedBox(
            width: 10,
            ),
            Column(
            children: [
            SizedBox(
            height: 10,
            ),
            filteredMechanicsignup[index]['path'] == ''

            ?CircleAvatar(
            backgroundImage: AssetImage(
            "assets/images/person image.jpg"),
            radius: 40,
            ):
            CircleAvatar(
            backgroundImage: NetworkImage(
            filteredMechanicsignup[index]['path']),
            radius: 40,
            ),
            Text(mech[index]['username'], style: TextStyle(fontSize: 20))
            ],
            ),
            Spacer(),
            Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Text(
            mech[index]['experience'],
            style: TextStyle(fontSize: 15),
            ),
            SizedBox(
            height: 10,
            ),
            Text(
            mech[index]['location'],
            style: TextStyle(fontSize: 15),
            ),
            SizedBox(
            height: 10,
            ),
            // Text("Fuel Leacking",
            //     style: TextStyle(fontSize: 15)),
            // SizedBox(
            //   height: 10,
            // ),
            Container(
            decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(10)),
            child: Center(
            child: Text(
            "Available",
            style: TextStyle(
            fontSize: 20, color: Colors.white),
            )),
            ),
            ],
            ),
            Spacer(),
            ],
            ),
            ),

            );

            },
            ),
            ),
                  NumberPaginator(
                    numberPages: totalPages,
                    initialPage: currentPage,
                    onPageChange: (int newPage) {
                      setState(() {
                        currentPage = newPage;
                      });
                    },
                  ),
                ],
            );
          },
      ),
    );
  }
}
