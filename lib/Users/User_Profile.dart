import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_Profile extends StatefulWidget {
  const User_Profile({super.key});

  @override
  State<User_Profile> createState() => _User_ProfileState();
}

class _User_ProfileState extends State<User_Profile> {

  void initState() {
    super.initState();
    getSavedData();
  }

  var ID = '';
  getSavedData() async {
    print("object");
    final prefs = await SharedPreferences.getInstance();
    ID = prefs.getString("id")!;
    print("done");

    setState(() {});
  }

  DocumentSnapshot? user;
  GEtdata() async {
    user = await FirebaseFirestore.instance
        .collection('usersignup')
        .doc(ID)
        .get();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: GEtdata(),
      builder:(context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 120,
                          ),
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage("assets/images/repair_image.png"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 250, 0),
                    child: Text("Name",style: TextStyle(fontSize: 18),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue.shade50,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: user!['username']
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 190, 0),
                    child: Text(
                      maxLines: 1,
                      "Phone Number",style: TextStyle(fontSize: 18),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue.shade50,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: user!['phone']
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 250, 0),
                    child: Text("Email",style: TextStyle(fontSize: 18),),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blue.shade50,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          hintText: user!['email']
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 140,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(150, 40),
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Done",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}