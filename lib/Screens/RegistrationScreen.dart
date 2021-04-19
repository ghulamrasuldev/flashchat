import 'package:flash/Constants.dart';
import 'package:flash/Screens/ChatScreen.dart';
import 'package:flash/Screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
class RegistrationScreen extends StatefulWidget {
  static String id = 'registrationscreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //logo
            Hero(
              tag: 'logo',
              child: Container(
                height: 200,
                child: Image.asset('images/logo.png'),
              ),
            ),
            //text field for email or username
            TextField(
              onChanged: (value){

              },
              decoration: kInputDecoration.copyWith(hintText: 'Enter an Email'),
            ),
            //sized box to make room between both input fields
            SizedBox(
              height: 24.0,
            ),
            //text field for password
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kInputDecoration.copyWith(hintText: 'Enter the Password'),
            ),
            //sized box to make room between text field and login button
            SizedBox(
              height: 24.0,
            ),
            //login button
            RoundedButton(
              onPressed: () {
                //Go to registration screen.
                Navigator.pushNamed(context, ChatScreen.id);
              },
              text: 'Register',
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
