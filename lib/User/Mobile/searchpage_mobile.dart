import 'package:demoproject/Constants/const_widget.dart';
import 'package:demoproject/Constants/custom_button.dart';
import 'package:demoproject/Constants/dimensions.dart';
import 'package:demoproject/User/Mobile/background.dart';
import 'package:demoproject/User/Mobile/search_results_mobile.dart';
import 'package:flutter/material.dart';

class UserSearchMobile extends StatefulWidget {
  const UserSearchMobile({super.key});

  @override
  State<UserSearchMobile> createState() => _UserSearchMobileState();
}

class _UserSearchMobileState extends State<UserSearchMobile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: UserBackground(
          title: const Text(
            'Find My Artist',
            style: TextStyle(fontFamily: AppConst.fontMontserrat,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          widget: SingleChildScrollView(
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button(aspectRatioMQ: TSizes.aspectRatioMQ,
                        buttonText: "Search",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => const UserSearchResultsMobile()));
                        }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
