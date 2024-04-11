

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:number_paginator/number_paginator.dart';

import 'Mechanic_Status_.dart';


class Mechanic_Accept_Tab extends StatefulWidget {
  const Mechanic_Accept_Tab({Key? key}) : super(key: key);

  @override
  State<Mechanic_Accept_Tab> createState() => _Mechanic_Accept_TabState();
}

class _Mechanic_Accept_TabState extends State<Mechanic_Accept_Tab> {
  int currentPage = 0;
  int itemsPerPage = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("mechreq")
            .where('status', isEqualTo: 1)
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
                        detail[dataIndex]['payment'] == 0
                            ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Mechanic_Status(
                                  id: detail[dataIndex].id,
                                )))
                            : null;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          color: Colors.lightBlue.shade50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  detail[dataIndex]['userprofile'] == ''
                                      ? CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          "assets/images/person image.jpg"))
                                      : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        detail[dataIndex]['userprofile']),
                                    radius: 30,
                                  ),
                                  Text(detail[dataIndex]["username"],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detail[dataIndex]['work'],
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  Text(detail[dataIndex]['date'],
                                      style: TextStyle(fontSize: 17)),
                                  Text(detail[dataIndex]['time'],
                                      style: TextStyle(fontSize: 17)),
                                  Text(detail[dataIndex]['location'],
                                      style: TextStyle(fontSize: 17)),
                                ],
                              ),
                              Column(
                                children: [
                                  detail[dataIndex]['payment'] == 0
                                      ? Container(
                                    height: 30,
                                    width: 133,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.orange),
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        color: Colors.orange),
                                    child: Center(
                                      child: Text(
                                        "Work in progress",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                      : detail[dataIndex]['payment'] == 3
                                      ? Container(
                                    height: 30,
                                    width: 133,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.red),
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        color: Colors.red),
                                    child: Center(
                                      child: Text(
                                        "Payment pending",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                      : detail[dataIndex]['payment'] == 4
                                      ? Container(
                                    height: 30,
                                    width: 133,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.red),
                                        borderRadius:
                                        BorderRadius.circular(
                                            10),
                                        color: Colors.red),
                                    child: Center(
                                      child: Text(
                                        "Failed",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                      : detail[dataIndex]['payment'] ==
                                      5
                                      ? Container(
                                    height: 30,
                                    width: 133,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                            Colors.green),
                                        borderRadius:
                                        BorderRadius
                                            .circular(10),
                                        color: Colors.green),
                                    child: Center(
                                      child: Text(
                                        "Payment successful",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                      : detail[dataIndex]
                                  ['payment'] ==
                                      6
                                      ? Container(
                                    height: 30,
                                    width: 133,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors
                                                .yellow.shade700),
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            10),
                                        color: Colors.yellow.shade700),
                                    child: Center(
                                      child: Text(
                                        "Completed",
                                        style: TextStyle(
                                          color: Colors
                                              .white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                      : Container(
                                    height: 30,
                                    width: 133,
                                  )
                                ],
                              ),
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