import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoproject/Constants/LoadingDialog.dart';
import 'package:demoproject/Constants/const_widget.dart';
import 'package:demoproject/Constants/custom_button.dart';
import 'package:demoproject/Constants/images.dart';
import 'package:demoproject/Login/Mobile/verify_email_mobile.dart';
import 'package:demoproject/Login/Mobile/verify_phone_number_mobile.dart';
import 'package:demoproject/Login/ResponsiveUI/baseui.dart';
import 'package:demoproject/Login/ResponsiveUI/forgot_password.dart';
import 'package:demoproject/Login/ResponsiveUI/sign_up.dart';
import 'package:demoproject/Login/ResponsiveUI/verify_phone_number.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInMobileUi extends StatefulWidget {
  const SignInMobileUi({super.key});

  @override
  State<SignInMobileUi> createState() => _SignInMobileUiState();
}

class _SignInMobileUiState extends State<SignInMobileUi> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
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
                    child: TextField(
                      cursorColor: AppConst.blackColor,
                      style:
                          const TextStyle(fontFamily: AppConst.fontMontserrat),
                      controller: _emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email/Phone number",
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
                      controller: _passwordController,
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
              height: heightMQ * 0.007,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgotPassword()),
                  );
                },
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: AppConst.whiteColor,
                      fontFamily: AppConst.fontMontserrat),
                ),
              ),
            ),
            SizedBox(
              height: heightMQ * 0.035,
            ),
            Button(
              aspectRatioMQ: aspectRatioMQ,
              buttonText: 'Login',
              onTap: () async {
                LoadingDialog dialog = LoadingDialog();
                String email = _emailController.text.trim();
                String password = _passwordController.text.trim();
                await loginUser(email, password, dialog);
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
                        onTap: () {},
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
                const Text("Don't have an account? ",
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
                            builder: (context) => const SignUp()));
                  },
                  child: const Text("Sign up",
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

  Future<void> checkEmailAndLogin(
      String email, String password, LoadingDialog dialog) async {
    try {
      CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('All Users');
      QuerySnapshot querySnapshot =
      await collectionReference.where('email', isEqualTo: email).get();

      if (querySnapshot.size > 0) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        if (documentSnapshot.exists) {
          Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

          String mail = data['email'];
          String name = data['name'];
          String type = data['entityType'];
          String? docId = '';
          if (data.containsKey('documentId')) {
            docId = data['documentId'] ?? '';
          }

          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          User? user = userCredential?.user;

          Map<String, dynamic> map = {
            'name': name,
            'email': email,
            'isEmailVerified': user!.emailVerified,
            'entityType': type,
          };
          if (user!.emailVerified) {
            dialog.stop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyPhoneNumberMobileUi(detailsMap: map),
              ),
            );
          } else {
            dialog.stop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerifyEmailMobileUi(detailsMap: map),
              ),
            );
          }
          // if (password == pass) {
        }
      } else {
        dialog.stop(context);
        AppConst.showSimpleToast(context, 'User not found');
      }
    } catch (e) {
      dialog.stop(context);
      AppConst.showSimpleToast(context, e.toString());
    }
  }
  void resendVerificationEmail(User user) async {
    await user.sendEmailVerification();
    AppConst.showSimpleToast(context, 'Verification email resent.');
  }
  Future<void> checkPhoneAndLogin(
      String phone, String password, LoadingDialog dialog) async {
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('All Users');
    QuerySnapshot querySnapshot =
    await collectionReference.where('phone', isEqualTo: phone).get();

    if (querySnapshot.size > 0) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
        documentSnapshot.data() as Map<String, dynamic>;

        String mail = data['email'];
        String type = data['entityType'];
        String? docId = '';
        if (data.containsKey('documentId')) {
          docId = data['documentId'] ?? '';
        }

        // if (password == pass) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: mail, password: password)
            .then((value) {
          dialog.stop(context);
          AppConst.showSimpleToast(context, 'Logged in as $mail');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => MainPage(
          //       documentId: docId,
          //       userType: type,
          //     ),
          //   ),
          // );
        }).onError((error, stackTrace) {
          dialog.stop(context);
          AppConst.showSimpleToast(context, error.toString());
        });
      }
    } else {
      dialog.stop(context);
      AppConst.showSimpleToast(context, 'User not found');
    }
  }

  Future<void> loginUser(
      String emailOrPhone, String password, LoadingDialog dialog) async {
    try {
      if (emailOrPhone.contains('@')) {
        await checkEmailAndLogin(emailOrPhone, password, dialog);
      } else {
        checkPhoneAndLogin('+91$emailOrPhone', password, dialog);
      }
    } on FirebaseAuthException catch (e) {
      dialog.stop(context);
      AppConst.showSimpleToast(context, e.code.toString());
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}


