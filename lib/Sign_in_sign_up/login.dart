import 'package:demoproject/Constants/const_widget.dart';
import 'package:demoproject/Sign_in_sign_up/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/text_field/gf_text_field.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConst.violetColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF6d60f8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontFamily: AppConst.fontPacifico,
              fontSize: MediaQuery.of(context).size.aspectRatio * 120,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.aspectRatio * 150,
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
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
                    controller: _emailController,
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
                    controller: _passwordController,
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
                  ),
                  // forget password text button
                  Container(
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.aspectRatio * 100),
                    child: GestureDetector(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              fontFamily: AppConst.fontMontserrat,
                              fontSize:
                                  MediaQuery.of(context).size.aspectRatio * 25),
                        ),
                      ),
                    ),
                  ),
                  // log in button
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.068,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              backgroundColor: AppConst.yellowColor,
                            ),
                            child: Text(
                              'Log In',
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
                            onPressed: () {
                              signInWithGoogle();
                            },
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
                      const Text("Don't have an account? ",
                          style: TextStyle(
                            color: AppConst.blackColor,
                            fontFamily: AppConst.fontMontserrat,
                          )),
                      // sign up button
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                        },
                        child: const Text("Sign up",
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
  signInWithGoogle() async{
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken ,
      idToken: googleAuth?.idToken
    );
    UserCredential user = await FirebaseAuth.instance.signInWithCredential(credential);

  }
}
