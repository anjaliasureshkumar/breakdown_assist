import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User_Notification extends StatefulWidget {
  const User_Notification({super.key});

  @override
  State<User_Notification> createState() => _User_NotificationState();
}

class _User_NotificationState extends State<User_Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: Text("Notification", style: TextStyle(fontSize: 30),),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("Notification").get(),
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


          final notification = snapshot.data?.docs ?? [];
          return Container(
            height: 1000,
            width: 390,

            child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(thickness: 5, color: Colors.white,),
                itemCount: notification.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all()
                      ),
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(notification[index]["matter"],
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 18),),
                              SizedBox(
                                width: 40,
                              ),
                              Text(notification[index]["time"]),
                            ],
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(260, 40, 0, 0),
                              child: Text(notification[index]["content"],
                                style: TextStyle(fontSize: 16),)
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.end,

                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(notification[index]["date"]),
                              ),
                            ],
                          ),
                        ],
                      ),



                    ),

                  );
                }

            ),
          );
        },
      ),

    );
  }
  }
