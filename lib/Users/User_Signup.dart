



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'User_Login.dart';

class User_Signup extends StatefulWidget {
  const User_Signup({Key? key});

  @override
  State<User_Signup> createState() => _User_SignupState();
}

class _User_SignupState extends State<User_Signup> {
  List<String> location = [
    'Thiruvananthapuram',
    'Kollam',
    'Alappuzha',
    'Pathanamthitta',
    'Kottayam',
    'Idukki',
    'Ernakulam',
    'Thrissur',
    'Palakkad',
    'Malappuram',
    'Kozhikode',
    'Wayanad',
    'Kannur',
    'Kasaragod'
  ];
  String? selectedLocation;

  final _key = GlobalKey<FormState>();
  var username = TextEditingController();
  var locations = TextEditingController();
  var number = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  final _Snack = SnackBar(
      duration: Duration(seconds: 4),
      content: Text("Your Account was Successfully Created"));

  Future<dynamic> usersignup() async {
    await FirebaseFirestore.instance.collection('usersignup').add({
      "username": username.text,
      "location": locations.text,
      "phone": number.text,
      "email": email.text,
      "password": password.text,
      "path": "",
      "status": 0
    }).then((value) {
      print("Success");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return User_Login();
      }));
      ScaffoldMessenger.of(context).showSnackBar(_Snack);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
              ),
              SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset("assets/images/repair_image.png")),
              SizedBox(
                height: 30,
              ),
              Text(
                "SIGN UP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              // Username TextFormField
              // Location TextFormField
              // Phone number TextFormField
              // Email TextFormField
              // Password TextFormField
              DropdownButton<String>(
                dropdownColor: Colors.lightBlue.shade50,
                iconEnabledColor: Colors.black,
                borderRadius: BorderRadius.circular(10),
                style: TextStyle(color: Colors.black, fontSize: 20),
                hint: Text("select your location"),
                value: selectedLocation,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLocation = newValue;
                  });
                },
                items: location.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      usersignup();
                    }
                  },
                  child: Text(
                    "SignUp",
                    style:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
