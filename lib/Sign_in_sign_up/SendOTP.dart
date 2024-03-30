import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:getwidget/components/button/gf_button.dart';

class SendOTPPage extends StatefulWidget {
  const SendOTPPage({super.key});

  @override
  State<SendOTPPage> createState() => _SendOTPPageState();
}

class _SendOTPPageState extends State<SendOTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Setting the title of the app bar
        title: const Text('Send OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // OTP input field
            OtpTextField(
              numberOfFields: 6,
              borderColor: Colors.black,
              showFieldAsBox: true,
            ),
            const Text("Didn't receive OTP resend?"),
            // Button to submit OTP
            GFButton(
              onPressed: () {
                // Implement OTP submission logic
              },
              // Send OTP button
              text: 'Submit OTP',
            )
          ],
        ),
      ),
    );
  }
}
