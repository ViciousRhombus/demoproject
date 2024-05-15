import 'package:demoproject/Constants/const_widget.dart';
import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  const Button(
      {super.key,
        required this.aspectRatioMQ,
        required this.buttonText,
        required this.onTap});

  final double aspectRatioMQ;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
            buttonText,
            style: TextStyle(
                color: AppConst.blackColor,
                fontWeight: FontWeight.bold,
                fontFamily: AppConst.fontMontserrat,
                fontSize: aspectRatioMQ * 40),
          ),
        ),
      ),
    );
  }
}