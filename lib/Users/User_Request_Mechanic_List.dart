import 'package:flutter/material.dart';

class User_Mechanic_Request_List extends StatefulWidget {
  const User_Mechanic_Request_List({super.key});

  @override
  State<User_Mechanic_Request_List> createState() => _User_Mechanic_Request_ListState();
}

class _User_Mechanic_Request_ListState extends State<User_Mechanic_Request_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: ListView.separated(
          separatorBuilder: (context,index)=> Divider(thickness: 5,color: Colors.white,),
          itemCount: 2,
          itemBuilder:  (BuildContext context,int index){
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Card(
                color: Colors.blue.shade200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name",style: TextStyle(fontSize: 15)),
                        Text("Date",style: TextStyle(fontSize: 15)),
                        Text("Time",style: TextStyle(fontSize: 15)),
                        Text("Fuel Leaking",style: TextStyle(fontSize: 15),),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green
                      ),
                      child: Text("Approved",style: TextStyle(color: Colors.white,fontSize: 15,),),
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