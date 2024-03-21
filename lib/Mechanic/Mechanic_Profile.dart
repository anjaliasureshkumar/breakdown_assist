import 'package:flutter/material.dart';

class Admin_Mechanic extends StatefulWidget {
  const Admin_Mechanic({super.key});

  @override
  State<Admin_Mechanic> createState() => _Admin_MechanicState();
}

class _Admin_MechanicState extends State<Admin_Mechanic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 60
            ),
            child: Container(
              height:900,
              width: 340,
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/person image.jpg"),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text("Name",style: TextStyle(fontSize: 18),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          hintText: "name"
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text("Username",style: TextStyle(fontSize: 18),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          hintText: "Username"
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text("Phone number",style: TextStyle(fontSize: 18),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          hintText: "Phone number"
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text("Email",style: TextStyle(fontSize: 18),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          hintText: "Enter email"
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text("Work experience",style: TextStyle(fontSize: 18),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          hintText: "Enter your experience"
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SizedBox(
                  //       height: 10,
                  //     ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text("Your location",style: TextStyle(fontSize: 18),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          hintText: "Enter your location"
                      ),
                    ),
                  ),
    Row(
    children: [
    Padding(
    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
    child: Text("Work experience",style: TextStyle(fontSize: 18),),
    ),
    ],
    ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextFormField(
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20)
    ),
    hintText: "Enter your experience"
    ),
    ),
    ),
    SizedBox(
    height: 10,
    ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                backgroundColor: Colors.green.shade300,
                                foregroundColor: Colors.white
                            ),
                            onPressed: (){},
                            child: Text("Accept",style: TextStyle(fontSize: 20))),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                backgroundColor: Colors.red.shade300,
                                foregroundColor: Colors.white
                            ),
                            onPressed: (){},
                            child: Text("Reject",style: TextStyle(fontSize: 20),)),  ],
                    ),
                  ),

                ],
              ),

            ),
    ]
          ),

        ),
      ),
    )
    ),
    );

  }
}