import 'package:flutter/material.dart';


class LOGIN extends StatefulWidget {
  const LOGIN({super.key});

  @override
  State<LOGIN> createState() => _LOGINState();
}

class _LOGINState extends State<LOGIN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/repair_image.png')),
              ),
            ),
            SizedBox(height: 30,),
            Text("LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(right: 220
              ),
              child: Text("Enter Username"),
            ),
            SizedBox(height: 50,
              child: Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      hintText: 'Username'),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220
              ),
              child: Text("Enter Password"),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),

                    hintText: 'Enter Password'),
              ),
            ),

            SizedBox(height: 40,),

            ElevatedButton(onPressed: (){},

                child: Text("LOGIN"))
          ],
        ),
      ),
    );
  }
}

