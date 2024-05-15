import 'package:demoproject/Constants/const_widget.dart';
import 'package:demoproject/Constants/custom_button.dart';
import 'package:demoproject/Login/ResponsiveUI/baseui.dart';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class VerifyEmailMobileUi extends StatefulWidget {
  final Map<String, dynamic> detailsMap;
  const VerifyEmailMobileUi({super.key, required this.detailsMap});

  @override
  State<VerifyEmailMobileUi> createState() => _VerifyEmailMobileUiState();
}

class _VerifyEmailMobileUiState extends State<VerifyEmailMobileUi> {
  @override
  Widget build(BuildContext context) {
    final heightMQ = MediaQuery.of(context).size.height;
    final aspectRatioMQ = MediaQuery.of(context).size.aspectRatio;
    final widthMQ = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Baseui(
          widget: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Text(
                  textAlign: TextAlign.center,
                  'We have sent you an Email',
                  style: TextStyle(
                      fontFamily: AppConst.fontMontserrat,
                      color: AppConst.whiteColor,
                      fontSize: widthMQ * 0.05),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'click on the email verification link sent to you on email@gmail.com. Then click on next',
                  style: TextStyle(
                      fontFamily: AppConst.fontMontserrat,
                      color: AppConst.whiteColor,
                      fontSize: widthMQ * 0.035),
                ),
                SizedBox(
                  height: heightMQ * 0.042,
                ),
              Button(aspectRatioMQ: aspectRatioMQ, buttonText: 'Resend Link', onTap: (){})
              ],
            ),
          )),
    );
  }
}
