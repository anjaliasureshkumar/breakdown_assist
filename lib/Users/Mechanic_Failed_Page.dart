import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'User_Home.dart';

class Mechanic_Failed_Page extends StatefulWidget {
  const Mechanic_Failed_Page({super.key, required this.id});
  final id;
  @override
  State<Mechanic_Failed_Page> createState() => _Mechanic_Failed_PageState();
}

class _Mechanic_Failed_PageState extends State<Mechanic_Failed_Page> {
  double rating = 0;

  DocumentSnapshot? mech;

  getData() async {
    mech = await FirebaseFirestore.instance
        .collection("mechreq")
        .doc(widget.id)
        .get();
  }

  void Failed(id) {
    FirebaseFirestore.instance.collection('mechreq').doc(id).update({
      'payment': 6,
      'rating': rating,
      'final': 3,
    }).then((value) => Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => User_home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        centerTitle: true,
        title: Text(
          "Failed Project",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Error${snapshot.error}");
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
               mech!['mechanicprofile']==''?CircleAvatar(
                 radius: 35,
                 backgroundImage: NetworkImage(mech!['mechanicprofile']),
               ):CircleAvatar(
                 radius: 35,
                 backgroundImage: AssetImage("assets/images/person image.jpg")),

                  SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "2+ Year Experience",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white),
                        color: Colors.green.shade400,
                      ),
                      child: Text(
                        "Available",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        RatingBar.builder(
                          itemSize: 35,
                          minRating: 0.5,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) => setState(() {
                            this.rating = rating;
                          }),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                      child: Text(
                        "Failed Reason",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 180,
                      width: 300,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: TextFormField(
                          maxLines: 5,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              hintText: "Failed reason show",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(180, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white),
                        onPressed: () {},
                        child: Text(
                          "OK",
                          style: TextStyle(fontSize: 20),
                        ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
