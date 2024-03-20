import 'package:breakdown_assist/Admin/Admin_Mechanic.dart';
import 'package:breakdown_assist/Admin/Admin_Notification.dart';
import 'package:breakdown_assist/Admin/Admin_Payment.dart';
import 'package:breakdown_assist/Admin/Login.dart';
import 'package:breakdown_assist/Admin/Test.dart';
import 'package:breakdown_assist/splash_screens.dart';
import 'package:flutter/material.dart';

import 'Admin/Admin_User.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Admin_Notification(),
    );
  }
}
