import 'package:flash/Constants.dart';
import 'package:flash/Screens/ChatScreen.dart';
import 'package:flash/Screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'loginscreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email='',password='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: kInputDecoration.copyWith(hintText: 'Enter an Email'),
            ),
            //sized box to make room between both input fields
            SizedBox(
              height: 24.0,
            ),
            //text field for password
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password=value;
                //Do something with the user input.
              },
              decoration: kInputDecoration.copyWith(hintText: 'Enter a Password'),
            ),
            //sized box to make room between text field and login button
            SizedBox(
              height: 24.0,
            ),
            //login button
            RoundedButton(
              color: Colors.lightBlueAccent,
              text: 'Login',
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, ChatScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
