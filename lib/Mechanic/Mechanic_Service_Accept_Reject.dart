import 'package:flutter/material.dart';

class Mechanic_Service_Accept_Reject extends StatefulWidget {
  const Mechanic_Service_Accept_Reject({super.key});

  @override
  State<Mechanic_Service_Accept_Reject> createState() => _Mechanic_Service_Accept_RejectState();
}

class _Mechanic_Service_Accept_RejectState extends State<Mechanic_Service_Accept_Reject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 550,
          width: 330,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade50
          ),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/person image.jpg"),
              ),
              Text("Name",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Problem",style: TextStyle(fontSize: 16),),
                          Text("Place",style: TextStyle(fontSize: 16),),
                          Text("Date",style: TextStyle(fontSize: 16),),
                          Text("Time",style: TextStyle(fontSize: 16),),
                          Text("Contact number",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(": Fuel leaking",style: TextStyle(fontSize: 16),),
                          Text(": kozhikkode beach road",style: TextStyle(fontSize: 16),),
                          Text(": 22/03/2024",style: TextStyle(fontSize: 16),),
                          Text(": 10:00 am",style: TextStyle(fontSize: 16),),
                          Text(": 0000000000",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 130,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade300,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      onPressed: (){},
                      child: Text("Accept",style: TextStyle(fontSize: 20),)),
                  ElevatedButton(
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade300,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      onPressed: (){},
                      child: Text("Reject",style: TextStyle(fontSize: 20),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}