import 'package:breakdown_assist/Users/User_Payment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class User_Mechanic_Bill extends StatefulWidget {
  const User_Mechanic_Bill({super.key,required this.id});
  final id;
  @override
  State<User_Mechanic_Bill> createState() => _User_Mechanic_BillState();
}

class _User_Mechanic_BillState extends State<User_Mechanic_Bill> {

  late DocumentSnapshot detail;

 getdata() async {
   detail = await FirebaseFirestore.instance
       .collection('mechreq')
       .doc(widget.id)
       .get();
 }

 void payment(id) {
   FirebaseFirestore.instance.collection('mechreq').doc(id).update({
     'payment': 5,
     'final':3,
     'rating': rating,
   }).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> User_Payment())));
 }

 double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        centerTitle: true,
        title: Text("Mechanic Bill",style: TextStyle(fontSize: 25),),
      ),
      body: FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Text("Error${snapshot.error}");
          }
          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                        "assets/images/person image.jpg"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(detail['mechusername'], style: TextStyle(fontSize: 20),),
                  SizedBox(
                    height: 10,
                  ),
                  Text(detail['work'], style: TextStyle(fontSize: 20),),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white),
                      color: Colors.green.shade400,
                    ),
                    child: Text("Available",
                      style: TextStyle(color: Colors.white, fontSize: 15),),
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

                      IconButton(onPressed: () {},
                          icon: Icon(Icons.edit))
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 150, 0),
                    child: Text("Amount", style: TextStyle(fontSize: 25),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                      readOnly: true,
                      style: TextStyle(fontSize: 25),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.currency_rupee),
                        hintText: detail['WorkCompleteAmount']
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(180, 30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                AlertDialog(
                                  backgroundColor: Colors.blue.shade50,
                                  title: Center(
                                    child: Text("Rating"),
                                  ),
                                  titleTextStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  content: SizedBox(
                                    height: 200,
                                    width: 300,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [

                                        SizedBox(
                                          height: 20,
                                        ),
                                        RatingBar.builder(
                                          itemSize: 40,
                                          minRating: 0.5,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemBuilder: (context, _) =>
                                              Icon(
                                                Icons.star_border_outlined,
                                                color: Colors.amber,
                                              ),
                                          onRatingUpdate: (rating) =>
                                              setState(() {
                                                this.rating = rating;
                                              }
                                              ),
                                        ),
                                        Text('$rating'),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                fixedSize: Size(180, 30),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(10)
                                                ),
                                                backgroundColor: Colors.blue,
                                                foregroundColor: Colors.white
                                            ),
                                            onPressed: () {
                                              payment(widget.id);
                                            },
                                            child: Text("OK",
                                              style: TextStyle(fontSize: 20),))

                                      ],
                                    ),
                                  ),
                                ));
                      },
                      child: Text("Payment", style: TextStyle(fontSize: 20),))
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}