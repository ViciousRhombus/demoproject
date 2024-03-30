import 'package:demoproject/Sign_in_sign_up/login.dart';
import 'package:flutter/material.dart';
import 'package:demoproject/Constants/const_widget.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/text_field/gf_text_field.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool _isPasswordVisible = false;
  final _dropdownMenuItems = [
    'Individual User',
    'Artist',
    'Artist Manager',
    'Event Manager'
  ];
  String _selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.violetColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF6d60f8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Sign up',
            style: TextStyle(
              fontFamily: AppConst.fontPacifico,
              fontSize: MediaQuery.of(context).size.aspectRatio * 120,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.aspectRatio * 100,
          ),
          GFCard(
            margin: const EdgeInsets.all(0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0))),
            color: AppConst.whiteColor,
            elevation: 8,
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'User Type',
                        style: TextStyle(
                          fontFamily: AppConst.fontMontserrat,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppConst.greyColor),
                      borderRadius: BorderRadius.circular(20.0),
                      color: AppConst.greyColor,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                            ),
                            isDense: true,
                            icon: const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child:
                                  Icon(Icons.arrow_drop_down_circle_outlined),
                            ),
                            items: _dropdownMenuItems
                                .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(
                                      e,
                                      style: const TextStyle(
                                          fontFamily: AppConst.fontMontserrat),
                                    )))
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
                  // full name text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Full Name',
                        style: TextStyle(
                          fontFamily: AppConst.fontMontserrat,
                        ),
                      ),
                    ),
                  ),
                  // full name text field
                  GFTextField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: AppConst.greyColor,
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppConst.greyColor),
                          borderRadius: BorderRadius.circular(20),
                        )),
                    style: const TextStyle(fontFamily: AppConst.fontMontserrat),
                  ),
                  // email/phone number text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Email/Phone Number',
                        style: TextStyle(
                          fontFamily: AppConst.fontMontserrat,
                        ),
                      ),
                    ),
                  ),
                  // email/phone number text field
                  GFTextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(fontFamily: 'OpenSans'),
                        filled: true,
                        fillColor: AppConst.greyColor,
                        isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppConst.greyColor),
                          borderRadius: BorderRadius.circular(20),
                        )),
                    style: const TextStyle(fontFamily: AppConst.fontMontserrat),
                  ),
                  // password text
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Password',
                        style: TextStyle(fontFamily: AppConst.fontMontserrat),
                      ),
                    ),
                  ),
                  // password text field
                  GFTextField(
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        hintStyle: const TextStyle(
                          fontFamily: AppConst.fontMontserrat,
                        ),
                        isDense: true,
                        // Added this
                        contentPadding: const EdgeInsets.all(12),
                        filled: true,
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
                        fillColor: const Color(0xfff7f7f7),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppConst.greyColor),
                          borderRadius: BorderRadius.circular(20),
                        )),
                    style: const TextStyle(fontFamily: AppConst.fontMontserrat),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.aspectRatio * 70,
                  ),
                  // Create account button
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.068,
                          child: ElevatedButton(
                            onPressed: () async {
                              Map<String, String> map = {
                                'name': nameController.text.trim(),
                                'password': passwordController.text.trim(),
                                'email': emailController.text.trim(),
                                'entityType': _selectedItem.trim(),
                              };
                              // sendOtp();
                              //createAccount(map);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              backgroundColor: AppConst.yellowColor,
                            ),
                            child: Text(
                              'Create account',
                              style: TextStyle(
                                  fontFamily: AppConst.fontMontserrat,
                                  color: AppConst.blackColor,
                                  fontSize:
                                      MediaQuery.of(context).size.aspectRatio *
                                          43),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // or divider
                  SizedBox(
                    height: MediaQuery.of(context).size.aspectRatio * 65,
                  ),
                  // OR divider
                  const Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Divider(), // Second Divider
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppConst.blackColor,
                                  fontFamily: AppConst.fontMontserrat),
                            ),
                          ),
                          Expanded(
                            child: Divider(), // Third Divider
                          ),
                        ],
                      ),
                      // Divider(), // Fourth Divider
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.aspectRatio * 65,
                  ),
                  // google sign in button
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.068,
                          child: SignInButton(
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            Buttons.Google,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.aspectRatio * 65,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?",
                          style: TextStyle(
                            color: AppConst.blackColor,
                            fontFamily: AppConst.fontMontserrat,
                          )),
                      // sign up button
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        child: const Text("Log in",
                            style: TextStyle(
                                color: AppConst.yellowColor,
                                fontFamily: AppConst.fontMontserrat,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
