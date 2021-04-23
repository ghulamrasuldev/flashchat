import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flash/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final _firestore = FirebaseFirestore.instance;
class ChatScreen extends StatefulWidget {
  static String id = 'chatscreen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  String messageText = '';
  final _auth = FirebaseAuth.instance;
  User LoggeInUser;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.docs) {
        print(message.data());
      }
    }
  }

  void getCurrentUser() async {
    final user = await _auth.currentUser;
    try {
      if (user != null) {
        LoggeInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar with some designs
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              messageStream();
              // _auth.signOut();
              // Navigator.pop(context);
            },
            child: Text('Logout'),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('images/logo.png'),
                height: 30.0,
              ),
            ),
            Text('Chat')
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              //Added Row to put text field and send message on same line
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Type Message here
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration.copyWith(hintText: 'Type a Message'),
                    ),
                  ),
                  //Send Button
                  FlatButton(
                    onPressed: () {
                      //Implement send functionality.
                      _firestore.collection('messages').add({
                        'sender': LoggeInUser.email,
                        'messageText': messageText,
                      });
                      messageTextController.clear();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshpt) {
        List<MessageBubble> messageBubbles = [];
        if (!snapshpt.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshpt.data.docs;
        for (var message in messages) {
          final messageText = message.data()['messageText'];
          final sender = message.data()['sender'];
          final messageBubble = MessageBubble(
            messageText: messageText,
            sender: sender,
          );
          messageBubbles.add(messageBubble);
        }

        return Expanded(
          child: ListView(
            padding:
            EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}



class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.messageText});
  final String sender;
  final String messageText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('$sender',style: TextStyle(color: Colors.blueGrey,fontSize: 13),),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30),
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
              child: Text(
                '$messageText',
                style: TextStyle(fontSize: 16.0,color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
