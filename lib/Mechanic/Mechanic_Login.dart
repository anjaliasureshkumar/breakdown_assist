import 'package:flutter/material.dart';

class Mechanic_Login extends StatefulWidget {
  const Mechanic_Login({Key? key}) : super(key: key);

  @override
  State<Mechanic_Login> createState() => _Mechanic_LoginState();
}

class _Mechanic_LoginState extends State<Mechanic_Login> {
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
                  child: Image.asset('assets/images/repair_image.png'),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text("Enter Username"),
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Text("Enter Password"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Password',
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Implement your forgot password functionality here
              },
              child: Text("Forgot password?"),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Implement your login functionality here
              },
              child: Text("LOGIN"),
            ),
            SizedBox(height: 20),
            Text("Don't have an account? Sign up"),
          ],
        ),
      ),
    );
  }
}
