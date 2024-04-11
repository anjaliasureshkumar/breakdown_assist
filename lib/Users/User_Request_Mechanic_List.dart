// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Mechanic_Failed_Page.dart';
// import 'User_Mechanic_Bill.dart';
//
// class User_Mechanic_Request_List extends StatefulWidget {
//   const User_Mechanic_Request_List({super.key});
//
//   @override
//   State<User_Mechanic_Request_List> createState() =>
//       _User_Mechanic_Request_ListState();
// }
//
// class _User_Mechanic_Request_ListState
//     extends State<User_Mechanic_Request_List> {
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
//         future: FirebaseFirestore.instance
//             .collection("mechreq")
//             .where('userid', isEqualTo: ID)
//             .get(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (snapshot.hasError) {
//             return Center(
//               child: Text("Error:${snapshot.error}"),
//             );
//           }
//           final mech = snapshot.data?.docs ?? [];
//           return Container(
//             height: 620,
//             child: ListView.separated(
//                 separatorBuilder: (context, index) => Divider(
//                       thickness: 5,
//                       color: Colors.white,
//                     ),
//                 itemCount: mech.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
//                     child: InkWell(
//                       onTap: () {
//                         mech[index]['payment'] == 3
//                             ? Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => User_Mechanic_Bill(id: mech[index].id,)))
//                             : mech[index]['payment'] == 4
//                                 ? Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             Mechanic_Failed_Page(id: mech[index].id,)))
//                                 : Null;
//                       },
//                       child: Card(
//                         color: Colors.blue.shade200,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(mech[index]['mechusername'],
//                                     style: TextStyle(fontSize: 15)),
//                                 Text(mech[index]['date'],
//                                     style: TextStyle(fontSize: 15)),
//                                 Text(mech[index]['time'],
//                                     style: TextStyle(fontSize: 15)),
//                                 Text(
//                                   mech[index]['work'],
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             mech[index]['payment'] == 3
//                                 ? ElevatedButton(
//                                     onPressed: () {},
//                                     child: Text(
//                                       "Pay",
//                                       style: TextStyle(color: Colors.white),
//                                     ),
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors.green,
//                                       foregroundColor: Colors.white,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10)),
//                                     ),
//                                   )
//                                 : mech[index]['payment'] == 4
//                                     ? Container(
//                               height: 30,
//                               width: 150,
//                               decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.red
//                                   ),
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.red
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "Failed",
//                                   style: TextStyle(
//                                       color: Colors.white),
//                                 ),
//                               ),
//                             ):
//                            mech[index]['payment'] == 5
//                                 ?  Container(
//                               height: 30,
//                               width: 150,
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.green
//                                 ),
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.green
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "Payment successfull",
//                                   style: TextStyle(
//                                       color: Colors.white),
//                                 ),
//                               ),
//                             )
//
//                                     : mech[index]['status'] == 1
//                                         ?
//                             Container(
//                               height: 30,
//                               width: 150,
//                               decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.green
//                                   ),
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.green
//                               ),
//                               child: Text(
//                                 "Approved",
//                                 style: TextStyle(
//                                     color: Colors.white),
//                               ),
//                             )
//                                         : mech[index]['status'] == 2
//                                ? Container(
//                               height: 30,
//                               width: 150,
//                               decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.green
//                                   ),
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.green
//                               ),
//                               child: Text(
//                                 "Rejected",
//                                 style: TextStyle(
//                                     color: Colors.white),
//                               ),
//                             )
//                                             : Container(
//                             )
//
//                             //
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//           );
//         },
//       ),
//     );
//   }
// }


import 'package:breakdown_assist/Users/Mechanic_Failed_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'User_Mechanic_Bill.dart';

class User_Request_Mechanic_List extends StatefulWidget {
  const User_Request_Mechanic_List({Key? key});

  @override
  State<User_Request_Mechanic_List> createState() =>
      _User_Mechanic_Request_ListState();
}

class _User_Mechanic_Request_ListState
    extends State<User_Request_Mechanic_List> {
  late String ID = '';
  int currentPage = 0;
  int itemsPerPage = 5;

  @override
  void initState() {
    super.initState();
    getmechdetails();
  }

  @override
  Widget build(BuildContext context) {
    if (ID.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection("mechreq")
          .where('status', isGreaterThan: 0)
          .where('userid', isEqualTo: ID)
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
        final mechdetail = snapshot.data?.docs ?? [];
        final totalItems = mechdetail.length;
        final totalPages = (totalItems / itemsPerPage).ceil();

        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [

              Expanded(
                child: Container(
                  height: 635,
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
                          mechdetail[dataIndex]['payment'] == 3
                              ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    User_Mechanic_Bill(
                                      id: mechdetail[dataIndex].id,
                                    ),
                              ))
                              : mechdetail[dataIndex]['payment'] == 4
                              ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Mechanic_Failed_Page(
                                      id: mechdetail[dataIndex].id,
                                    ),
                              ))
                              : null;
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            color: Colors.lightBlue.shade50,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      mechdetail[dataIndex]['mechusername'],
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Text(
                                      mechdetail[dataIndex]['date'],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      mechdetail[dataIndex]['time'],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      mechdetail[dataIndex]['work'],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    mechdetail[dataIndex]['payment'] == 3
                                        ? Container(
                                      height: 35,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green),
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        color: Colors.green,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Pay",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    )
                                        : mechdetail[dataIndex]['payment'] ==
                                        4
                                        ? Container(
                                      height: 35,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.red),
                                        borderRadius:
                                        BorderRadius.circular(
                                            10),
                                        color: Colors.red,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Failed",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    )
                                        : mechdetail[dataIndex]
                                    ['payment'] ==
                                        5
                                        ? Container(
                                      height: 35,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.yellow.shade700),
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        color: Colors.yellow.shade700,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "payment successfull",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    )
                                        : mechdetail[dataIndex]
                                    ['payment'] ==
                                        6
                                        ? Container(
                                      height: 35,
                                      width: 180,
                                      decoration:
                                      BoxDecoration(
                                        border: Border.all(
                                            color: Colors
                                                .grey
                                                .shade400),
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            10),
                                        color: Colors
                                            .grey.shade400,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Response Completed",
                                          style: TextStyle(
                                            color: Colors
                                                .white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    )
                                        : mechdetail[dataIndex]
                                    ['status'] ==
                                        1
                                        ? Container(
                                      height: 35,
                                      width: 180,
                                      decoration:
                                      BoxDecoration(
                                        border: Border.all(
                                            color: Colors
                                                .green),
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            10),
                                        color: Colors
                                            .green,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Approved",
                                          style:
                                          TextStyle(
                                            color: Colors
                                                .white,
                                            fontSize:
                                            20,
                                          ),
                                        ),
                                      ),
                                    )
                                        : mechdetail[dataIndex]
                                    [
                                    'status'] ==
                                        2
                                        ? Container(
                                      height: 35,
                                      width: 180,
                                      decoration:
                                      BoxDecoration(
                                        border: Border.all(
                                            color: Colors
                                                .red),
                                        borderRadius:
                                        BorderRadius.circular(
                                            10),
                                        color: Colors
                                            .red,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Rejected",
                                          style:
                                          TextStyle(
                                            color: Colors
                                                .white,
                                            fontSize:
                                            20,
                                          ),
                                        ),
                                      ),
                                    )
                                        : Container(
                                      height: 35,
                                      width: 180,
                                    ),
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
          ),
        );
      },
    );
  }

  void getmechdetails() async {
    final mechdetail = await SharedPreferences.getInstance();
    setState(() {
      ID = mechdetail.getString('id')!;
    });
  }
}