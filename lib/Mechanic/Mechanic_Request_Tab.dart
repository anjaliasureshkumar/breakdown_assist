// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Mechanic_Service_Accept_Reject.dart';
//
// class Mechanic_Request_Tab extends StatefulWidget {
//   const Mechanic_Request_Tab({super.key});
//
//   @override
//   State<Mechanic_Request_Tab> createState() => _Mechanic_Request_TabState();
// }
//
// class _Mechanic_Request_TabState extends State<Mechanic_Request_Tab> {
//   void initState() {
//     // TODO: implement initState
//     getSavedData();
//     super.initState();
//     getSavedData();
//   }
//
//   var ID = '';
//   Future<void> getSavedData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     ID = prefs.getString('id')!;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: FutureBuilder(
//           future: FirebaseFirestore.instance
//               .collection("mechreq")
//               .where('mechid', isEqualTo: ID)
//               .get(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text("Error:${snapshot.error}"),
//               );
//             }
//             final user = snapshot.data?.docs ?? [];
//             return ListView.separated(
//                 separatorBuilder: (context, index) => Divider(
//                       thickness: 5,
//                       color: Colors.white,
//                     ),
//                 itemCount: user.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return InkWell(
//                     onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => Mechanic_Service_Accept_Reject(id: user[index].id,)),
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
//                       child: Card(
//                         color: Colors.blue.shade200,
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               width: 10,
//                             ),
//
//                             Column(
//                               children: [
//
//                                 SizedBox(
//                                   height: 5,
//                                 ),user[index]['userprofile']==''?
//                                 CircleAvatar(
//                                   radius: 40,
//                                   backgroundImage:
//                                       NetworkImage(user?[index]["userprofile"]),
//                                 ):CircleAvatar(
//                                   radius: 40,
//                                   backgroundImage:
//                                  AssetImage("assets/images/person image.jpg")
//                                 ),
//                                 Text(user[index]['username'],
//                                     style: TextStyle(fontSize: 20))
//                               ],
//                             ),
//                             SizedBox(
//                               width: 70,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   user[index]['work'],
//                                   style: TextStyle(fontSize: 20),
//                                 ),
//                                 Text(user[index]['date'],
//                                     style: TextStyle(fontSize: 20)),
//                                 Text(user[index]['time'],
//                                     style: TextStyle(fontSize: 20)),
//                                 Text(user[index]['location'],
//                                     style: TextStyle(fontSize: 20)),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 });
//           }),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mechanic_Service_Accept_Reject.dart';


class Mechanic_Request_Tab extends StatefulWidget {
  const Mechanic_Request_Tab({Key? key});

  @override
  State<Mechanic_Request_Tab> createState() => _Mechanic_Request_TabState();
}

class _Mechanic_Request_TabState extends State<Mechanic_Request_Tab> {
  late String ID = '';
  int currentPage = 0;
  int itemsPerPage = 5;

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  void getDetails() async {
    final mechDetail = await SharedPreferences.getInstance();
    setState(() {
      ID = mechDetail.getString('id')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ID.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("mechreq")
            .where('mechid', isEqualTo: ID)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
          final detail = snapshot.data?.docs ?? [];
          final totalItems = detail.length;
          final totalPages = (totalItems / itemsPerPage).ceil();

          return Column(
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
                          context,
                          MaterialPageRoute(
                            builder: (context) => Mechanic_Service_Accept_Reject(
                                id: detail[dataIndex].id),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          color: Colors.lightBlue.shade50,
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Column(
                                children: [
                                  SizedBox(height: 5),
                                  detail[dataIndex]['userprofile'] == ''
                                      ? CircleAvatar(
                                    radius: 35,
                                    backgroundImage: AssetImage(
                                        "assets/images/person image.jpg"),
                                  )
                                      : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        detail[dataIndex]['userprofile']),
                                    radius: 35,
                                  ),
                                  Text(detail[dataIndex]['username'],
                                      style: TextStyle(fontSize: 20)),
                                ],
                              ),
                              SizedBox(width: 70),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    detail[dataIndex]['work'],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(detail[dataIndex]['date'],
                                      style: TextStyle(fontSize: 20)),
                                  Text(detail[dataIndex]['time'],
                                      style: TextStyle(fontSize: 20)),
                                  Text(detail[dataIndex]['location'],
                                      style: TextStyle(fontSize: 20)),
                                ],
                              )
                            ],
                          ),
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