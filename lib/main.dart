import 'package:e_commerce_app/facebook.dart';
import 'package:e_commerce_app/forgetpassword.dart';
import 'package:e_commerce_app/registered.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';
import 'pages/home_page.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/login': (BuildContext context) => new Login(),
        '/signup': (BuildContext context) => new SignupPage(),
        '/home_page': (BuildContext context) => new HomePage(),
        '/forgot_password': (BuildContext context) => new ForgetPassword(),
        '/registered': (BuildContext context) => new Registered(),
        '/facebook': (BuildContext context) => new Facebook(),
      },
      home: Home(),
    );
  }
}
