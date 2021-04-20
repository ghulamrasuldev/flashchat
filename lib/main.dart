import 'package:flash/Screens/ChatScreen.dart';
import 'package:flash/Screens/LoginScreen.dart';
import 'package:flash/Screens/RegistrationScreen.dart';
import 'package:flash/Screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Start Screen
      initialRoute: WelcomeScreen.id,
      //Defining Routes for my app
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
