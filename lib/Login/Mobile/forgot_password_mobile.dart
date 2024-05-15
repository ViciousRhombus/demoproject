import 'package:demoproject/Constants/const_widget.dart';
import 'package:demoproject/Constants/custom_button.dart';
import 'package:demoproject/Login/ResponsiveUI/baseui.dart';
import 'package:flutter/material.dart';

class ForgotPasswordMobileUi extends StatefulWidget {
  const ForgotPasswordMobileUi({super.key});

  @override
  State<ForgotPasswordMobileUi> createState() => _ForgotPasswordMobileUiState();
}

class _ForgotPasswordMobileUiState extends State<ForgotPasswordMobileUi> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final heightMQ = MediaQuery.of(context).size.height;
    final aspectRatioMQ = MediaQuery.of(context).size.aspectRatio;
    final widthMQ = MediaQuery.of(context).size.width;
    return Scaffold(
      body: PageView(
          pageSnapping: false,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Baseui(
                widget: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
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
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(),
                          child: TextField(
                            style: const TextStyle(
                                fontFamily: AppConst.fontMontserrat),
                            cursorColor: AppConst.blackColor,
                            // controller: emailController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email/Phone",
                                hintStyle: TextStyle(color: Colors.grey[700])),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightMQ * 0.035,
                  ),
                  Button(
                    aspectRatioMQ: aspectRatioMQ,
                    buttonText: 'Reset Password',
                    onTap: () async {
                      // if (emailController.text.trim().contains('@')) {
                      //   await checkEmailAndSendResetLink(
                      //       emailController.text.trim());
                      // } else {
                      //   LoadingDialog dialog = LoadingDialog();
                      //   dialog.start(context);
                      //   await checkPhoneAndSendResetLink(
                      //       '+91${emailController.text.trim()}',
                      //       dialog);
                      // }
                    },
                  )
                ],
              ),
            )),
            Baseui(
                widget: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
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
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(),
                          child: TextField(
                            cursorColor: AppConst.blackColor,
                            style: const TextStyle(
                                fontFamily: AppConst.fontMontserrat),
                            // controller: otpController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle: TextStyle(color: Colors.grey[700]),
                              hintText: "Enter Otp",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightMQ * 0.035,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // LoadingDialog dialog = LoadingDialog();
                      // dialog.start(context);
                      // verifyOtp(otpController.text.trim(), dialog);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Color(0xFFe3b232),
                            Color(0xFFe0cd59),
                          ])),
                      child: Center(
                        child: Text(
                          "Verify Mobile",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppConst.fontMontserrat,
                              fontSize: aspectRatioMQ * 40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Baseui(
                widget: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
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
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: AppConst.blackColor))),
                          child: TextField(
                            cursorColor: AppConst.blackColor,
                            // controller: passController,
                            obscureText: !_isPasswordVisible,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              hintText: "Enter New Password",
                              hintStyle: TextStyle(
                                fontFamily: AppConst.fontMontserrat,
                                color: Colors.grey[700],
                              ),
                              isDense: true,
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(_isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            style: const TextStyle(
                                fontFamily: AppConst.fontMontserrat),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(),
                          child: TextField(
                            cursorColor: AppConst.blackColor,
                            // controller: confirmPassController,
                            obscureText: !_isConfirmPasswordVisible,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(
                                fontFamily: AppConst.fontMontserrat,
                                color: Colors.grey[700],
                              ),
                              isDense: true,
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(_isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isConfirmPasswordVisible =
                                        !_isConfirmPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            style: const TextStyle(
                                fontFamily: AppConst.fontMontserrat),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightMQ * 0.035,
                  ),
                  GestureDetector(
                    onTap: () async {
                      // if (confirmPassController.text.trim() ==
                      //     passController.text.trim()) {
                      //   updatePassword(
                      //       confirmPassController.text.trim());
                      // } else {
                      //   AppConst.showSimpleToast(
                      //       context, 'Passwords do not match');
                      // }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(colors: [
                            Color(0xFFe3b232),
                            Color(0xFFe0cd59),
                          ])),
                      child: Center(
                        child: Text(
                          "Update Password",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppConst.fontMontserrat,
                              fontSize: aspectRatioMQ * 40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ))
          ]),
    );
  }
}
