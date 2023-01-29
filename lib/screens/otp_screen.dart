import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'dart:math' as math;

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-0.5, -0.5),
          radius: 1.5,
          colors: [
            Color.fromRGBO(113, 99, 186, 1),
            Color.fromRGBO(70, 53, 157, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/otp.png',
              ),
              // const SizedBox(height: 20),
              const Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 300,
                child: Text(
                  'We have sent a One-Time Password to your mobile number ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              // otp input boxes
              OTPTextField(
                length: 4,
                width: 250,
                fieldWidth: 50,
                style: const TextStyle(fontSize: 18, color: Colors.white),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  Navigator.pushNamed(context, '/logged_in');
                },
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: const Color.fromRGBO(154, 139, 244, 1),
                  borderColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
