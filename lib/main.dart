import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointx/screens/otp_screen.dart';
import './screens/login_screen.dart';
import './screens/onboarding_screen.dart';
import 'screens/logged_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PointX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: const Color.fromRGBO(113, 99, 186, 1)),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const LoggedInScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/otp': (context) => const OtpScreen(),
        '/logged_in': (context) => const LoggedInScreen(),
      },
    );
  }
}
