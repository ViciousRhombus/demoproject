import 'package:flutter/material.dart';
import 'Sign_in_sign_up/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Title of the application
      title: 'Flutter Demo',
      theme: ThemeData(
        // Primary color theme for the app
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Set LoginPage as the initial page
      home: const LoginPage(),
    );
  }
}
