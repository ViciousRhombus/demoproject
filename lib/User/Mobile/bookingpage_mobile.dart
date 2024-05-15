import 'package:demoproject/Constants/const_widget.dart';
import 'package:demoproject/User/Mobile/background.dart';
import 'package:flutter/material.dart';

class UserBookingMobile extends StatefulWidget {
  const UserBookingMobile({super.key});

  @override
  State<UserBookingMobile> createState() => _UserBookingMobileState();
}

class _UserBookingMobileState extends State<UserBookingMobile> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: UserBackground(
          title: const Text(
            'Booking',
            style: TextStyle(fontFamily: AppConst.fontMontserrat,fontWeight: FontWeight.bold,fontSize: 25),
          ),
          widget: Container(),
        ));
  }
}
