//
//
// import 'package:breakdown_assist/Mechanic/Mechanic_Login.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class Mechanic_Signup extends StatefulWidget {
//   const Mechanic_Signup({super.key});
//
//   @override
//   State<Mechanic_Signup> createState() => _Mechanic_SignupState();
// }
//
// class _Mechanic_SignupState extends State<Mechanic_Signup> {
//   List<String> locations = [
//     'Thiruvananthapuram',
//     'Kollam',
//     'Alappuzha',
//     'Pathanamthitta',
//     'Kottayam',
//     'Idukki',
//     'Ernakulam',
//     'Thrissur',
//     'Palakkad',
//     'Malappuram',
//     'Kozhikode',
//     'Wayanad',
//     'Kannur',
//     'Kasaragod'
//   ];
//   String? selectedLocation;
//
//
//   var username = TextEditingController();
//   var location = TextEditingController();
//   var phone = TextEditingController();
//   var email = TextEditingController();
//   var experience = TextEditingController();
//   var shopname = TextEditingController();
//   var password = TextEditingController();
//   Future<dynamic> mechanicsignup() async {
//     await FirebaseFirestore.instance.collection('mechanicsignup').add({
//       "username": username.text,
//       "location": location.text,
//       "phone": phone.text,
//       "email": email.text,
//       "experience": experience.text,
//       "shopname": shopname.text,
//       "password": password.text,
//       "path":"",
//       "status":0
//     }).then((value) {
//
//       Navigator.push(context, MaterialPageRoute(
//         builder: (context) {
//           return Mechanic_Login();
//         },
//       ));
//       final Snack = SnackBar(
//           duration: Duration(seconds: 3),
//           content: Text("Your Account was Successfully Created"));
//       final _Key = GlobalKey<FormState>();
//
//
//       @override
//       Widget build(BuildContext context) {
//         return Scaffold(
//           body: SingleChildScrollView(
//             child: Form(
//               key: _Key,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 90,
//
//                   ),
//                   SizedBox(
//                       width: 150,
//                       height: 150,
//                       child: Image.asset("assets/images/repair_image.png")),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Text("SIGN UP",
//                     style: TextStyle(fontWeight: FontWeight.bold),),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
//                         child: Text(
//                           "Enter Username",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return '*Required';
//                         }
//                         return null;
//                       },
//                       controller: username,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.blue.shade200,
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(10)),
//                         hintText: 'username',
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
//                         child: Text(
//                           "Enter Phone Number",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return '*Required';
//                         }
//                         return null;
//                       },
//                       keyboardType: TextInputType.phone,
//                       controller: phone,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.blue.shade200,
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(10)),
//                         hintText: 'phone',
//                       ),
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
//                         child: Text(
//                           "Enter Your Email",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return '*Required';
//                         }
//                         return null;
//                       },
//                       controller: email,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.blue.shade200,
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(10)),
//                         hintText: 'email',
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
//                         child: Text(
//                           "Enter Your Work Experience",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return '*Required';
//                         }
//                         return null;
//                       },
//                       controller: experience,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.blue.shade200,
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(10)),
//                         hintText: 'experience',
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
//                         child: Text(
//                           "Enter Your Work Shop Name",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return '*Required';
//                         }
//                         return null;
//                       },
//                       controller: shopname,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.blue.shade200,
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(10)),
//                         hintText: 'shopname',
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
//                         child: Text(
//                           "Enter Password",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: TextFormField(
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return '*Required';
//                         }
//                         return null;
//                       },
//                       controller: password,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.blue.shade200,
//                         border: OutlineInputBorder(
//                             borderSide: BorderSide.none,
//                             borderRadius: BorderRadius.circular(10)),
//                         hintText: 'password',
//                       ),
//                     ),
//                   ),
//                   DropdownButton<String>(
//                     dropdownColor: Colors.lightBlue.shade50,
//                     iconEnabledColor: Colors.black,
//                     borderRadius: BorderRadius.circular(10),
//                     style: TextStyle(color: Colors.black, fontSize: 20),
//                     hint: Text("select your location"),
//                     value: selectedLocation,
//                     // Current selected location
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         selectedLocation = newValue!;
//                       });
//                     },
//                     items: locations.map<DropdownMenuItem<String>>((
//                         String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                   SizedBox(
//                     height: 50,
//                     width: 150,
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(5.0),
//                             ),
//                             backgroundColor: Colors.blueAccent,
//                             foregroundColor: Colors.white),
//                         onPressed: () {
//                           if (_Key.currentState!.validate()) {
//                             Mechanic_Signup();
//                             ScaffoldMessenger.of(context).showSnackBar(Snack);
//                           }
//                         },
//                         child: Text(
//                           "SignUp",
//                           style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                         )),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }
//     }

import 'package:breakdown_assist/Mechanic/Mechanic_Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Mechanic_Signup extends StatefulWidget {
  const Mechanic_Signup({Key? key});

  @override
  State<Mechanic_Signup> createState() => _Mechanic_SignupState();
}

class _Mechanic_SignupState extends State<Mechanic_Signup> {
  List<String> locations = [
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

  var username = TextEditingController();
  var location = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var experience = TextEditingController();
  var shopname = TextEditingController();
  var password = TextEditingController();

  final _Key = GlobalKey<FormState>();
  final Snack = SnackBar(
    duration: Duration(seconds: 3),
    content: Text("Your Account was Successfully Created"),
  );

  Future<dynamic> mechanicsignup() async {
    await FirebaseFirestore.instance.collection('mechanicsignup').add({
      "username": username.text,
      "location": location.text,
      "phone": phone.text,
      "email": email.text,
      "experience": experience.text,
      "shopname": shopname.text,
      "password": password.text,
      "path": "",
      "status": 0
    }).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return Mechanic_Login();
        }),
      );
      ScaffoldMessenger.of(context).showSnackBar(Snack);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _Key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
              ),
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset("assets/images/repair_image.png"),
              ),
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
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(
                      "Enter Username",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              // Username TextFormField
              // Phone number TextFormField
              // Email TextFormField
              // Experience TextFormField
              // Shopname TextFormField
              // Password TextFormField
              DropdownButton<String>(
                dropdownColor: Colors.lightBlue.shade50,
                iconEnabledColor: Colors.black,
                borderRadius: BorderRadius.circular(10),
                style: TextStyle(color: Colors.black, fontSize: 20),
                hint: Text("select your location"),
                value: selectedLocation,
                // Current selected location
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLocation = newValue!;
                  });
                },
                items: locations.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (_Key.currentState!.validate()) {
                      mechanicsignup();
                      ScaffoldMessenger.of(context).showSnackBar(Snack);
                    }
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


