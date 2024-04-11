// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Mechanic_Rating extends StatefulWidget {
//   const Mechanic_Rating({super.key});
//
//   @override
//   State<Mechanic_Rating> createState() => _Mechanic_RatingState();
// }
//
// class _Mechanic_RatingState extends State<Mechanic_Rating> {
//   double rating = 0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
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
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text("Rating", style: TextStyle(fontSize: 30)),
//         centerTitle: true,
//       ),
//       body: FutureBuilder(
//           future: FirebaseFirestore.instance
//               .collection("mechreq")
//               .where('mechid', isEqualTo: ID)
//               .where('final', isEqualTo: 3)
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
//
//             return Center(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     "The rating given to you",
//                     style: TextStyle(color: Colors.grey, fontSize: 20),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Flexible(
//                     child: ListView.separated(
//                         separatorBuilder: (context, index) => Divider(
//                               thickness: 5,
//                               color: Colors.white,
//                             ),
//                         itemCount: user.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           return Container(
//                             height: 150,
//                             decoration: BoxDecoration(
//                               color: Colors.blue.shade50,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Spacer(),
//                                 Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   children: [
//                                     user[index]['userprofile'] == ""
//                                         ? CircleAvatar(
//                                             radius: 45,
//                                             backgroundImage: NetworkImage(
//                                                 user[index]['userprofile']))
//                                         : CircleAvatar(
//                                             radius: 45,
//                                             backgroundImage: AssetImage(
//                                                 "assets/images/person image.jpg"),
//                                           ),
//                                     Text(
//                                       "Name",
//                                       style: TextStyle(fontSize: 15),
//                                     )
//                                   ],
//                                 ),
//                                 Spacer(),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       "Engine work",
//                                       style: TextStyle(fontSize: 15),
//                                     ),
//                                     Text("Date",
//                                         style: TextStyle(fontSize: 15)),
//                                     Text("Time",
//                                         style: TextStyle(fontSize: 15)),
//                                     Text("Place",
//                                         style: TextStyle(fontSize: 15)),
//                                   ],
//                                 ),
//                                 Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text("Rating"),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     RatingBar.builder(
//                                       itemSize: 20,
//                                       minRating: 0.5,
//                                       direction: Axis.horizontal,
//                                       allowHalfRating: true,
//                                       itemCount: 5,
//                                       itemBuilder: (context, _) => Icon(
//                                         Icons.star,
//                                         color: Colors.amber,
//                                       ),
//                                       onRatingUpdate: (rating) => setState(() {
//                                         this.rating = rating;
//                                       }),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text('$rating'),
//                                   ],
//                                 ),
//                                 Spacer(),
//                               ],
//                             ),
//                           );
//                         }),
//                   )
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Mechanic_Rating extends StatefulWidget {
  const Mechanic_Rating({super.key});

  @override
  State<Mechanic_Rating> createState() => _Mechanic_RatingState();
}

class _Mechanic_RatingState extends State<Mechanic_Rating> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuserdetail();
  }

  var ID = '';

  void getuserdetail() async {
    final userdetail = await SharedPreferences.getInstance();

    ID = userdetail.getString('id')!;

    setState(() {

    });
  }

  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Colors.lightBlue.shade100,
        title: Text("Rating", style: TextStyle(fontSize: 30)),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("mechreq")
              .where('mechid', isEqualTo: ID).where('final',isEqualTo: 1)
              .get(),
          builder:
              ( context, snapshot) {
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
            final userdetail = snapshot.data?.docs ?? [];
            return Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "The rating given to you",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => Divider(
                        thickness: 5,
                        color: Colors.white,
                      ),
                      itemCount: userdetail.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade50,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  userdetail[index]['userprofile']==''?
                                  CircleAvatar(
                                    radius: 45,
                                    backgroundImage:
                                    AssetImage("assets/images/person image.jpg"),
                                  ):CircleAvatar(
                                    radius: 45,
                                    backgroundImage: NetworkImage(userdetail[index]['userprofile']),
                                  ),
                                  Text(
                                    userdetail[index]['username'],
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    userdetail[index]['work'],
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Text(userdetail[index]['date'], style: TextStyle(fontSize: 20)),
                                  Text(userdetail[index]['time'], style: TextStyle(fontSize: 20)),
                                  Text(userdetail[index]['location'], style: TextStyle(fontSize: 20)),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Rating"),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  RatingBar.builder(
                                    itemSize: 20,
                                    initialRating: userdetail[index]['rating'],
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) => setState(() {

                                    }),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(userdetail[index]['rating'].toString()),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          }),
    );
  }
}
