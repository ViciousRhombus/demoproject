import 'package:demoproject/Login/Desktop/sign_in_desktop.dart';
import 'package:demoproject/Login/Mobile/sign_in_mobile.dart';
import 'package:demoproject/Login/ResponsiveUI/Responsive_Layout.dart';

import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      ResponsiveLayout(mobileBody: const SignInMobileUi(),desktopBody: const SignInDesktopUi(),),);
  }
}
