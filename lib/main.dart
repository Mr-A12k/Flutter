import 'package:flutter/material.dart';
import 'package:demo/onGoing.dart';
import 'package:demo/Govver/home1.dart';
import 'package:demo/Govver/SignupPage.dart';
import 'package:demo/Govver/otp.dart';
import 'package:demo/Govver/SearchPage.dart';
import 'package:demo/Govver/LoginPage.dart'; // Import the login page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const FieldVisitScreen(), // Entry screen
        '/login': (context) => const LoginPage(), // Login page
        '/home1': (context) => DashboardPage(),
        '/signup': (context) => SignUpPage(),
        '/otp': (context) => OTPVerificationPage(),
        '/search': (context) => SearchPage(),
      },
    );
  }
}