import 'package:flutter/material.dart';

class Mechanic_Request_Tab extends StatefulWidget {
  const Mechanic_Request_Tab({super.key});

  @override
  State<Mechanic_Request_Tab> createState() => _Mechanic_Request_TabState();
}

class _Mechanic_Request_TabState extends State<Mechanic_Request_Tab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.separated(
          separatorBuilder: (context,index)=> Divider(thickness: 5,color: Colors.white,),
          itemCount: 2,
          itemBuilder:  (BuildContext context,int index){
            return Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Card(
                color: Colors.blue.shade200,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/person image.jpg"),
                          radius: 40,
                        ),
                        Text("Name",style: TextStyle(fontSize: 20))
                      ],
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Fuel Leaking",style: TextStyle(fontSize: 20),),
                        Text("Date",style: TextStyle(fontSize: 20)),
                        Text("Time",style: TextStyle(fontSize: 20)),
                        Text("Place",style: TextStyle(fontSize: 20)),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}