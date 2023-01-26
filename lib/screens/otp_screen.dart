import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'dart:math' as math;

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(129, 115, 204, 1),
      body: Stack(
        children: [
          // tilted oval background
          Positioned(
            top: 0,
            left: 0,
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Container(
                width: MediaQuery.of(context).size.width * 1.1,
                height: MediaQuery.of(context).size.height * 1.1,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(113, 99, 186, 1),
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(
                      MediaQuery.of(context).size.width * 1.1,
                      MediaQuery.of(context).size.height * 1.1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // otp image
          Positioned(
            child: Column(
              children: [
                Image.asset(
                  'assets/otp.png',
                  width: MediaQuery.of(context).size.width * 1,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Verification Code',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'We have sent a One-Time Password to your mobile number ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // otp input boxes
                OTPTextField(
                  length: 4,
                  width: 250,
                  fieldWidth: 50,
                  style: const TextStyle(fontSize: 18),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onCompleted: (pin) {
                    Navigator.pushNamed(context, '/logged_in');
                  },
                  otpFieldStyle: OtpFieldStyle(
                    backgroundColor: Colors.white,
                    borderColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
