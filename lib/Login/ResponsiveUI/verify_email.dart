import 'package:demoproject/Login/Desktop/verify_email_desktop.dart';
import 'package:demoproject/Login/Mobile/verify_email_mobile.dart';
import 'package:demoproject/Login/ResponsiveUI/Responsive_Layout.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: const VerifyEmailMobileUi(),
        desktopBody: const VerifyEmailDesktopUi(),
      ),
    );
  }
}
