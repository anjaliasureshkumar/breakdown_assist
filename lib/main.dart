import 'package:breakdown_assist/Admin/Admin_Home_Mechanic.dart';
import 'package:breakdown_assist/Admin/Admin_Notification.dart';
import 'package:breakdown_assist/Admin/Admin_Payment.dart';
import 'package:breakdown_assist/Admin/Admin_Login.dart';

import 'package:breakdown_assist/Mechanic/Mechanic_Signup.dart';
import 'package:breakdown_assist/firebase_options.dart';
import 'package:breakdown_assist/splash_screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Admin/Admin_Add_Notification.dart';
import 'Admin/Admin_Home.dart';
import 'Admin/Admin_Home_User.dart';
import 'Admin/Admin_Mechanic.dart';
import 'Admin/Admin_User.dart';
import 'Mechanic/Mechanic_Home.dart';
import 'Mechanic/Mechanic_Login.dart';
import 'Users/User_Login.dart';
import 'Users/User_Signup.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mechanic_Home(),
    );
  }
}
