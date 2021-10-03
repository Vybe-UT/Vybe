import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'chat_screen.dart';

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
          headline1: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 14.0),
        ),
      ),
      routes: {
        '/': (context) => SignUpScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/chat': (context) => ChatScreen(),
      },
    );
  }
}



class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void _showChatScreen() {
    Navigator.of(context).pushNamed('/chat');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Text(
            "Welcome to",
            style: Theme.of(context).textTheme.headline1,
          ),
          Image.asset("assets/vybe_logo.png", width: 400),
          Text("the social listening experience.",
              style: Theme.of(context).textTheme.headline4),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.white;
              }),
              backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.disabled) ? null : Colors.blue;
              }),
            ),
            onPressed: _showChatScreen,
            child: Text('Sign up'),
          ),
        ]),
      ),
    );
  }
}
