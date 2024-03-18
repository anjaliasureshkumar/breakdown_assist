import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          Image.asset('assets/images/repairing vehicle.avif',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,),
          // BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Adjust the sigma values for blur intensity
          //   child: Container(
          //     color: Colors.black.withOpacity(0.5), // Adjust the opacity for the blur effect
          //   ),
          // ),
          // Center(
          //
          //   child: Text("WELCOME",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
          //       color: Colors.limeAccent),) ,
          // )
        ],
      ),
    );
  }
}
