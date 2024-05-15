import 'package:demoproject/Login/Desktop/sign_up_desktop.dart';
import 'package:demoproject/Login/Mobile/sign_up_mobile.dart';
import 'package:demoproject/Login/ResponsiveUI/Responsive_Layout.dart';

import 'package:flutter/material.dart';
class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ResponsiveLayout(mobileBody: const SignUpMobileUi(),desktopBody: const SignUpDesktopUi(),),);
  }
}
