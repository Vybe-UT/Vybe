import 'package:flutter/material.dart';
import 'signup_screen.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Color(0xFFB36CF1),
        backgroundColor: Color(0xFF444455),
        // Define the default font family.
        fontFamily: 'Rubik',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 36.0, fontFamily: 'Georgia'),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Georgia'),
        ),
      ),
      routes: {
        '/': (context) => SignUpScreen(),
        '/welcome': (context) => WelcomeScreen(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/vybe_logo.png"),
      ),
    );
  }
}
