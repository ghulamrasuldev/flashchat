import 'package:flash/Constants.dart';
import 'package:flash/Screens/ChatScreen.dart';
import 'package:flash/Screens/LoginScreen.dart';
import 'package:flash/Screens/WelcomeScreen.dart';
import 'package:flash/Utilities/Utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class RegistrationScreen extends StatefulWidget {
  static String id = 'registrationscreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '', password = '';
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
                password = value;
                //Do something with the user input.
              },
              decoration:
                  kInputDecoration.copyWith(hintText: 'Enter the Password'),
            ),
            //sized box to make room between text field and login button
            SizedBox(
              height: 24.0,
            ),
            //login button
            RoundedButton(
              onPressed: () async {
                //Go to registration screen.\
                try {
                  final NewUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if(NewUser!=null){
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                } catch (e) {
                  Alert(context: context, title: "Something went Wrong", desc: e.toString().substring(findcharacter(e.toString(), ']'))).show();
                }
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
