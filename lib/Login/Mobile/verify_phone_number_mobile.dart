import 'package:demoproject/Constants/const_widget.dart';
import 'package:demoproject/Constants/custom_button.dart';
import 'package:demoproject/Home/main_page.dart';
import 'package:demoproject/Login/Mobile/verify_otp_mobile.dart';
import 'package:demoproject/Login/ResponsiveUI/baseui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import '../../Constants/LoadingDialog.dart';

class VerifyPhoneNumberMobileUi extends StatefulWidget {
  final Map<String, dynamic> detailsMap;
  const VerifyPhoneNumberMobileUi({super.key, required this.detailsMap});

  @override
  State<VerifyPhoneNumberMobileUi> createState() =>
      _VerifyPhoneNumberMobileUiState();
}

class _VerifyPhoneNumberMobileUiState extends State<VerifyPhoneNumberMobileUi> {
  TextEditingController phoneController = TextEditingController();
  bool isDataLoaded = false;
  String docid = '';
  String usertype = '';
  String vid = '';
  bool isPhoneVerified = false;
  bool isOtpSent = false;
  String otp_value = '';

  @override
  Widget build(BuildContext context) {
    final heightMQ = MediaQuery.of(context).size.height;
    final aspectRatioMQ = MediaQuery.of(context).size.aspectRatio;
    final widthMQ = MediaQuery.of(context).size.width;
    return !isDataLoaded?
        const Center(child: CircularProgressIndicator())
    : isPhoneVerified? MainPage(documentId: docid, userType: usertype):
    Scaffold(
      body: Baseui(
          widget: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            const Text(
              textAlign: TextAlign.center,
              'Enter Your Mobile Number',
              style: TextStyle(
                  fontFamily: AppConst.fontMontserrat,
                  fontSize: 20,
                  color: AppConst.whiteColor),
            ),
            const Text(
              textAlign: TextAlign.center,
              'We will send you a confirmation code',
              style: TextStyle(
                  fontFamily: AppConst.fontMontserrat,
                  fontSize: 13,
                  color: AppConst.whiteColor),
            ),
            SizedBox(
              height: heightMQ * 0.042,
            ),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppConst.blackColor),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(3, 168, 166, 0.22),
                        blurRadius: 20.0,
                        offset: Offset(0, 10))
                  ]),
              child: Column(
                children: <Widget>[
                  Container(
                    height: heightMQ * 0.06,
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      cursorColor: AppConst.blackColor,
                      style:
                          const TextStyle(fontFamily: AppConst.fontMontserrat),
                      // controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: const Icon(Icons.phone),
                          hintText: "Phone number",
                          hintStyle: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: AppConst.fontMontserrat)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: heightMQ * 0.042,
            ),
            Button(
              aspectRatioMQ: aspectRatioMQ,
              buttonText: "Verify Phone",
              onTap: () {
                LoadingDialog dialog = LoadingDialog();
                dialog.start(context);
                sendOtp(dialog);
              },
            )
          ],
        ),
      )),
    );
  }
  void sendOtp(LoadingDialog dialog) async {
    String phone = '+91${phoneController.text.toString().trim()}';
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phone,
      codeSent: (verificationId, resendToken) async {
        dialog.stop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifyOtpMobileUi(
                verificationId: verificationId,
                detailsMap: widget.detailsMap,
                phone: phone,
              )),
        );
      },
      verificationCompleted: (credential) async {
        await FirebaseAuth.instance.currentUser!
            .updatePhoneNumber(credential)
            .then((value) {
          dialog.stop(context);
          AppConst.showSimpleToast(context, 'Otp verified');
        });
      },
      verificationFailed: (ex) {
        dialog.stop(context);
        if (kDebugMode) {
          print('error is $ex');
        }
      },
      codeAutoRetrievalTimeout: (verificationid) {},
      timeout: const Duration(seconds: 30),
    );
  }
}
