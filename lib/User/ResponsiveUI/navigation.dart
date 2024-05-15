import 'package:demoproject/User/Desktop/navigation_desktop.dart';
import 'package:demoproject/User/Mobile/navigation_mobile.dart';
import 'package:demoproject/User/ResponsiveUI/Responsive_Layout.dart';
import 'package:flutter/material.dart';
class UserNavigation extends StatefulWidget {
  const UserNavigation({super.key});

  @override
  State<UserNavigation> createState() => _UserNavigationState();
}

class _UserNavigationState extends State<UserNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    ResponsiveLayout(mobileBody: const UserNavigationMobile(),desktopBody: const UserNavigationDesktop(),),);
  }
}
