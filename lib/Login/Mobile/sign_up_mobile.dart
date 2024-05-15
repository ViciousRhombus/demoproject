import 'package:demoproject/Constants/const_widget.dart';
import 'package:demoproject/Constants/custom_button.dart';
import 'package:demoproject/Constants/images.dart';
import 'package:demoproject/Login/ResponsiveUI/baseui.dart';
import 'package:demoproject/Login/ResponsiveUI/sign_in.dart';
import 'package:flutter/material.dart';

class SignUpMobileUi extends StatefulWidget {
  const SignUpMobileUi({super.key});

  @override
  State<SignUpMobileUi> createState() => _SignUpMobileUiState();
}

class _SignUpMobileUiState extends State<SignUpMobileUi> {
  final _dropdownMenuItems = [
    'Individual User',
    'Artist',
    'Artist Manager',
    'Event Manager'
  ];
  String _selectedItem = "";
  bool _isPasswordVisible = false;

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
                            bottom: BorderSide(color: AppConst.blackColor))),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            hint: Text(
                              'Select Type',
                              style: TextStyle(
                                fontFamily: AppConst.fontMontserrat,
                                color: Colors.grey[700],
                                // fontSize: aspectRatioMQ *
                                //     33
                              ),
                              textAlign: TextAlign.left,
                            ),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 0),
                            ),
                            dropdownColor: AppConst.whiteColor,
                            isDense: true,
                            icon: const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child:
                                  Icon(Icons.arrow_drop_down_circle_outlined),
                            ),
                            style: TextStyle(
                              fontFamily: AppConst.fontMontserrat,
                              color:
                                  Colors.grey[700], // Set selected item color
                            ),
                            items: _dropdownMenuItems
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                          fontFamily: AppConst.fontMontserrat,
                                          color: AppConst.blackColor,
                                          // fontSize: aspectRatioMQ *
                                          //     35
                                        ),
                                      ),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                _selectedItem = val.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: AppConst.blackColor))),
                    child: TextField(
                      cursorColor: AppConst.blackColor,
                      style:
                          const TextStyle(fontFamily: AppConst.fontMontserrat),
                      // controller: emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: AppConst.fontMontserrat)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      cursorColor: AppConst.blackColor,
                      style:
                          const TextStyle(fontFamily: AppConst.fontMontserrat),
                      // controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
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
                          hintStyle: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: AppConst.fontMontserrat)),
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
              buttonText: 'Create account',
              onTap: () async {
                // checkAndProceed(emailController.text.trim(),
                //     passwordController.text.trim());
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: heightMQ * 0.04, top: heightMQ * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppConst.blackColor),
                    ),
                    height: aspectRatioMQ * 125,
                    width: aspectRatioMQ * 125,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            15), // Adjust the radius as needed
                      ),
                      clipBehavior: Clip.antiAlias,
                      color: AppConst.whiteColor,
                      shadowColor: Colors.transparent,
                      elevation: 5.0,
                      child: InkWell(
                        onTap: () {
                          // signInWithGoogle();
                        },
                        child: Image.asset(
                          ImagesPath.google,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account? ",
                    style: TextStyle(
                      color: AppConst.whiteColor,
                      fontFamily: AppConst.fontMontserrat,
                    )),
                // sign up button
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()));
                  },
                  child: const Text("Login",
                      style: TextStyle(
                        color: Color(0xFFe3b232),
                        fontFamily: AppConst.fontMontserrat,
                        fontWeight: FontWeight.bold,
                      )),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
