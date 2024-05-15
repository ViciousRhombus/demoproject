import 'package:demoproject/Login/Desktop/forgot_password_desktop.dart';
import 'package:demoproject/Login/Mobile/forgot_password_mobile.dart';
import 'package:demoproject/Login/ResponsiveUI/Responsive_Layout.dart';

import 'package:flutter/material.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    ResponsiveLayout(mobileBody: const ForgotPasswordMobileUi(),desktopBody: const ForgotPasswordDesktopUi(),),);
  }
}

