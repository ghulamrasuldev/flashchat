
import 'package:flash/Screens/ChatScreen.dart';
import 'package:flash/Screens/LoginScreen.dart';
import 'package:flash/Screens/RegistrationScreen.dart';
import 'package:flash/Screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '1.Welcome',
      routes: {
        '1.Welcome': (context) => WelcomeScreen(),
        '2.Login': (context) => LoginScreen(),
        '3.Register': (context) => RegistrationScreen(),
        '4.Chat': (context) => ChatScreen(),
      },
    );
  }
}
