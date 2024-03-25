import 'package:flutter/material.dart';

class Mechanic_Accept_Tab extends StatefulWidget {
  const Mechanic_Accept_Tab({super.key});

  @override
  State<Mechanic_Accept_Tab> createState() => _Mechanic_Accept_TabState();
}

class _Mechanic_Accept_TabState extends State<Mechanic_Accept_Tab> {
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
                          backgroundImage: AssetImage("Assets/profile img.png"),
                          radius: 40,
                        ),
                        Text("Name",style: TextStyle(fontSize: 20))
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Fuel Leaking",style: TextStyle(fontSize: 20),),
                        Text("Date",style: TextStyle(fontSize: 20)),
                        Text("Time",style: TextStyle(fontSize: 20)),
                        Text("Place",style: TextStyle(fontSize: 20)),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          color: Colors.red
                      ),
                      child: Text("Payment pending",style: TextStyle(color: Colors.white,fontSize: 12,),),
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