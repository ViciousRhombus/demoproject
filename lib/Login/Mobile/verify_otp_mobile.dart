import 'package:demoproject/Constants/const_widget.dart';
import 'package:demoproject/Constants/custom_button.dart';
import 'package:demoproject/Login/ResponsiveUI/baseui.dart';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyOtpMobileUi extends StatefulWidget {
  final String verificationId;
  final String phone;
  final Map<String, dynamic> detailsMap;
  const VerifyOtpMobileUi({super.key, required this.verificationId, required this.phone, required this.detailsMap});

  @override
  State<VerifyOtpMobileUi> createState() => _VerifyOtpMobileUiState();
}

class _VerifyOtpMobileUiState extends State<VerifyOtpMobileUi> {
  String otp_value = '';

  @override
  Widget build(BuildContext context) {
    final heightMQ = MediaQuery.of(context).size.height;
    final aspectRatioMQ = MediaQuery.of(context).size.aspectRatio;
    final widthMQ = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Baseui(
          widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: <Widget>[
            const Text(
              textAlign: TextAlign.center,
              'Enter Verification code',
              style: TextStyle(
                  fontFamily: AppConst.fontMontserrat,
                  fontSize: 20,
                  color: AppConst.whiteColor),
            ),
            const Text(
              textAlign: TextAlign.center,
              'Automatically detecting a SMS send to your mobile number ******3344',
              style: TextStyle(
                  fontFamily: AppConst.fontMontserrat,
                  fontSize: 13,
                  color: AppConst.whiteColor),
            ),
            SizedBox(
              height: heightMQ * 0.042,
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  // height: heightMQ * 0.1,
                  //padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: OtpTextField(
                          focusedBorderColor: AppConst.yellow2Color,
                          cursorColor: AppConst.whiteColor,
                          borderRadius: BorderRadius.circular(20),
                          numberOfFields: 6,
                          keyboardType: TextInputType.number,
                          textStyle: const TextStyle(
                              fontFamily: AppConst.fontMontserrat,
                              color: AppConst.whiteColor),
                          borderColor: const Color(0xFF512DA8),
                          showFieldAsBox: true,
                          onCodeChanged: (String value) {
                            otp_value += value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: heightMQ * 0.042,
            ),
            Button(
              aspectRatioMQ: aspectRatioMQ,
              buttonText: "Verify OTP",
              onTap: () {
                // LoadingDialog dialog = LoadingDialog();
                // dialog.start(context);
                // verifyOtp(otp_value.trim(), widget.phone, dialog);
              },
            )
          ],
        ),
      )),
    );
  }
}
