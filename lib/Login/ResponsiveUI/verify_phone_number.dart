import 'package:demoproject/Login/Desktop/verify_phone_number_desktop.dart';
import 'package:demoproject/Login/Mobile/verify_phone_number_mobile.dart';
import 'package:demoproject/Login/ResponsiveUI/Responsive_Layout.dart';
import 'package:flutter/material.dart';

class VerifyPhoneNumber extends StatefulWidget {
  const VerifyPhoneNumber({super.key});

  @override
  State<VerifyPhoneNumber> createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: const VerifyPhoneNumberMobileUi(),
        desktopBody: const VerifyPhoneNumberDesktopUi(),
      ),
    );
  }
}
