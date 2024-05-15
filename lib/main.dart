
import 'package:demoproject/Login/ResponsiveUI/sign_in.dart';
import 'package:demoproject/Login/ResponsiveUI/verify_otp.dart';
import 'package:demoproject/User/Mobile/navigation_mobile.dart';
import 'package:demoproject/User/Mobile/search_results_mobile.dart';
import 'package:demoproject/User/ResponsiveUI/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => NavigationProvider()),],
      child: MaterialApp(
        // Title of the application
        title: 'Flutter Demo',debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Primary color theme for the app
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // Set LoginPage as the initial page
        home: const UserNavigation(),
      ),
    );
  }
}
