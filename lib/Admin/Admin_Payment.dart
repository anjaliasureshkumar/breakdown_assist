import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Admin_Payment extends StatefulWidget {
  const Admin_Payment({super.key});

  @override
  State<Admin_Payment> createState() => _Admin_paymentState();
}

class _Admin_paymentState extends State<Admin_Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
        future: FirebaseFirestore.instance
        .collection("mechreq")
        .where('payment',isEqualTo:5 )

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
      final pay = snapshot.data?.docs ?? [];

      return Center(
        child: Column(
          children: [

            Container(
              height: 900,
              width: 470,
              child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(
                        indent: 13,
                        endIndent: 60,
                        color: Colors.white,
                        thickness: 20,
                        height: 50,
                      ),
                  itemCount: pay.length,
                  itemBuilder: (BuildContext context, int index) {
                    return
                      Container(
                        height: 100,
                        width: 200,
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,


                          children: [
                            SizedBox(
                              width: 18,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(pay[index]['username'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),),
                                    SizedBox(
                                      width: 200,
                                    ),
                                    Text(pay[index]['date'], style: TextStyle(
                                        fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Text(pay[index]['WorkCompleteAmount'],
                                  style: TextStyle(fontSize: 17),),
                                Text(pay[index]['work'],
                                  style: TextStyle(fontSize: 17),),
                                Text(pay[index]['username'],
                                  style: TextStyle(fontSize: 17),),
                              ],
                            )
                          ],

                        ),

                      );
                  }


              ),
            ),
          ],
        ),
      );
    }


        )

      ),
    );
  }
}
