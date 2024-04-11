// // import 'package:breakdown_assist/Admin/Admin_Mechanic.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // class Admin_Home_Mechanic extends StatefulWidget {
// //   const Admin_Home_Mechanic({super.key});
// //
// //   @override
// //   State<Admin_Home_Mechanic> createState() => _Admin_Home_MechanicState();
// // }
// //
// // class _Admin_Home_MechanicState extends State<Admin_Home_Mechanic> {
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: FutureBuilder(
// //         future: FirebaseFirestore.instance.collection("mechanicsignup").get(),
// //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //       if (snapshot.connectionState == ConnectionState.waiting) {
// //         return Center(
// //           child: CircularProgressIndicator(),
// //         );
// //       }
// //       if (snapshot.hasError) {
// //         return Center(
// //           child: Text("Error:${snapshot.error}"),
// //         );
// //       }
// //       final user = snapshot.data?.docs ?? [];
// //       return
// //       ListView.separated(
// //           separatorBuilder: (context, index) =>
// //               Divider(thickness: 5, color: Colors.white,),
// //           itemCount: user.length,
// //           itemBuilder: (BuildContext context, int index) {
// //             return Padding(
// //               padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
// //               child: InkWell(
// //                 onTap: (){
// //                   Navigator.push(context, MaterialPageRoute(
// //                     builder: (context) {
// //                       return Admin_Mechanic(id: user[index].id);
// //                     },
// //                   ));
// //                 },
// //                 child: Card(
// //                   child: Row(
// //                     children: [
// //                       SizedBox(
// //                         width: 10,
// //                       ),
// //                       SizedBox(height: 20,),
// //                       CircleAvatar(
// //                         backgroundImage: AssetImage(
// //                             "assets/images/person image.jpg"),
// //                         radius: 30,
// //                       ),
// //                       SizedBox(
// //                         width: 40,
// //                       ),
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           SizedBox(
// //                             height: 15,
// //                           ),
// //                           Text(user[index]['username'], style: TextStyle(
// //                               fontSize: 16, fontWeight: FontWeight.bold),),
// //                           Text(user[index]['phone'], style: TextStyle(
// //                             fontSize: 15,)),
// //                           Text(user[index]['experience'], style: TextStyle(
// //                             fontSize: 15,)),
// //                           Text(user[index]['location'], style: TextStyle(
// //                             fontSize: 15,)),
// //                         ],
// //                       ),
// //
// //
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             );
// //           }
// //       );
// //     }
// //       ),
// //
// //
// //     );
// //   }
// // }
//
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import 'Admin_Mechanic.dart';
//
// class Mechanic_List extends StatefulWidget {
//   const Mechanic_List({super.key});
//
//   @override
//   State<Mechanic_List> createState() => _Mechanic_ListState();
// }
//
// class _Mechanic_ListState extends State<Mechanic_List> {
//
//   int currentPage = 0;
//   int itemsPerPage = 2;
//   late QuerySnapshot? userSnapshot;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: FutureBuilder(
//         future: FirebaseFirestore.instance.collection('mechanicsignup').get(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
//           final totalItems = mech.length;
//           final totalPages = (totalItems / itemsPerPage).ceil();
//
//           return Padding(
//               padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
//               child: ListView.separated(
//                 separatorBuilder: (context, index) =>
//                     Divider(color: Colors.white),
//                 itemCount: mech.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   Admin_Mechanic(id: mech[index].id)));
//                     },
//                     child: Container(
//                       color: Colors.lightBlue.shade50,
//                       height: 100,
//                       width: 100,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             width: 20,
//                           ),
//                           mech[index]['path'] == ''
//                               ? CircleAvatar(
//                               radius: 40,
//                               backgroundImage:
//                               AssetImage("assets/images/person image.jpg"))
//                               : CircleAvatar(
//                             backgroundImage:
//                             NetworkImage(mech[index]['path']),
//                             radius: 40,
//                           ),
//                           SizedBox(
//                             width: 20,
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 mech[index]['username'],
//                                 style: TextStyle(
//                                     fontSize: 17, fontWeight: FontWeight.bold),
//                               ),
//                               Text(mech[index]['phone'],
//                                   style: TextStyle(fontSize: 17)),
//                               Text(mech[index]['experience'],
//                                   style: TextStyle(fontSize: 17)),
//                             ],
//                           ),
//                           Spacer(),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               mech[index]['status'] == 1
//                                   ? Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.green.shade400,
//                                     borderRadius:
//                                     BorderRadius.circular(10)),
//                                 child: Center(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Text(
//                                         "Accepted",
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             color: Colors.white),
//                                       ),
//                                     )),
//                               )
//                                   : mech[index]['status'] == 2
//                                   ? Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.red.shade400,
//                                     borderRadius:
//                                     BorderRadius.circular(10)),
//                                 child: Center(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Text(
//                                         "Rejected",
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             color: Colors.white),
//                                       ),
//                                     )),
//                               )
//                                   : Container(
//                                 decoration: BoxDecoration(
//                                     color: Colors.grey.shade400,
//                                     borderRadius:
//                                     BorderRadius.circular(10)),
//                                 child: Center(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(1.0),
//                                       child: Text(
//                                         "Pending",
//                                         style: TextStyle(
//                                             fontSize: 20,
//                                             color: Colors.white),
//                                       ),
//                                     )),
//                               ),
//                             ],
//                           ),
//                           Spacer(),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ));
//         },
//       ),
//     );
//   }
// }


import 'package:breakdown_assist/admin/admin_mechanic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
class Mechanic_List extends StatefulWidget {
  const Mechanic_List({Key? key}) : super(key:key);

  @override
  State<Mechanic_List> createState() => _Mechanic_ListState();
}

class _Mechanic_ListState extends State<Mechanic_List> {


  int currentPage = 0;
  int itemsPerPage = 2;
  late QuerySnapshot? userSnapshot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("mechanicsignup").get(),
        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
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
          final totalItems = mech.length;
          final totalPages = (totalItems / itemsPerPage).ceil();

          return Column(
            children: [
              NumberPaginator(
                numberPages: totalPages,
                initialPage: currentPage,
                onPageChange: (int newPage) {
                  setState(() {
                    currentPage = newPage;
                  });
                },
              ),
              Expanded(
                child: ListView.builder(

                    itemCount: (currentPage == totalPages - 1)
                        ? totalItems - (currentPage * itemsPerPage)
                        : itemsPerPage,
                    itemBuilder: (context, index) {
                      final dataIndex = (currentPage * itemsPerPage) + index;
                      if (dataIndex >= totalItems) {
                        return SizedBox(); // Return an empty SizedBox if no more data
                      }
                      final mechData = mech[dataIndex];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Admin_Mechanic(id: mechData.id);
                            }
                            ));
                          },
                          child: Card(
                            color: Colors.green.shade50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                SizedBox(height: 20,),
                                mechData['path'].isEmpty?
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: ExactAssetImage(
                                      "assets/images/man.png"),
                                )
                                    :

                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                      mechData["path"]),


                                ),
                                Spacer(),


                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text(mechData["username"], style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold),),
                                    Text(mechData["phone"],
                                        style: TextStyle(fontSize: 15,)),
                                    Text(
                                        mechData["experience"], style: TextStyle(fontSize: 15,)),

                                    SizedBox(height: 25,),
                                  ],
                                ),
                                Spacer(),


                                mechData['status']==0?  Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.orange),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.orange),
                                  child: Center(
                                    child: Text(
                                      "Pending",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,fontWeight: FontWeight.bold

                                      ),

                                    ),
                                  ),

                                ):mechData['status']==1? Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green),
                                  child: Center(
                                    child: Text(
                                      "Accepted",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,fontWeight: FontWeight.bold

                                      ),

                                    ),
                                  ),

                                ): Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red),
                                  child: Center(
                                    child: Text(
                                      "Rejected",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,fontWeight: FontWeight.bold

                                      ),

                                    ),
                                  ),
                                ),
                                Spacer(),


                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          );
        },
      ),

    );
  }
}