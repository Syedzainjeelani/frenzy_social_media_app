import 'package:flutter/material.dart';
import 'package:flutter_social_ui/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frenzy App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
        primarySwatch: Colors.red,
      ),
      home: LoginScreen(),
    );
  }
}
