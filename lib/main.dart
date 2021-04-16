import 'file:///H:/FlutterProjects/flashchat/lib/Screens/WelcomeScreen.dart';
import 'package:flash/Screens/ChatScreen.dart';
import 'package:flash/Screens/LoginScreen.dart';
import 'package:flash/Screens/RegistrationScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlashChat());

}
class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChatScreen(),
    );
  }
}
