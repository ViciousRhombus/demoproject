import 'package:demoproject/Login/Desktop/verify_otp_desktop.dart';
import 'package:demoproject/Login/Mobile/verify_otp_mobile.dart';
import 'package:demoproject/Login/ResponsiveUI/Responsive_Layout.dart';
import 'package:flutter/material.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: const VerifyOtpMobileUi(),
        desktopBody: const VerifyOtpDesktopUi(),
      ),
    );
  }
}
