import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mechanic_Service extends StatefulWidget {
  const Mechanic_Service({super.key});

  @override
  State<Mechanic_Service> createState() => _Mechanic_ServiceState();
}

class _Mechanic_ServiceState extends State<Mechanic_Service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){

          showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
            backgroundColor: Colors.blue.shade200,
            title: Center(
              child: Text("Add service"),
            ),
            titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black
            ),
            content: Container(
              height: 200,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: Colors.blue.shade200
                            )
                        )
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blue.shade50,
                      ),
                      onPressed: (){},
                      child: Text("Add",style: TextStyle(fontSize: 20),))
                ],
              ),
            ),
          )
          );

        },
        child: Icon(
            size: 50,
            Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: Text("Services",style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: Card(
            color: Colors.blue.shade50,
            child: ListView.separated(
                separatorBuilder: (context,index)=> Divider(thickness: 1,color: Colors.black,),
                itemCount: 4,
                itemBuilder: (BuildContext context,int index){
                  return ListTile(
                    title: Text("Tyre puncture service",style: TextStyle(fontSize: 20),),
                    trailing: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.delete),
                      iconSize: 30,
                    ),
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}