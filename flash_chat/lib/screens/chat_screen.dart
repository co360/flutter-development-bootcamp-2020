import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String messageText;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
      }
    } on Exception catch (e) {
      print(e);
    }
  }

//  Getting messages from DB
//  void getMessages () async {
//    final messages = await _firestore.collection('messages').getDocuments();
//    for (var message in messages.documents) {
//      print(message.data);
//    }
//  }

  // Subscribing to snapshots of the DB
  void messageStream() async {
    await for(var snapshot in _firestore.collection('messages').snapshots()) {
      for (var message in snapshot.documents) {
        print(message.data);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MessagesStream(loggedInUser: loggedInUser,),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        controller: messageTextController,
                        onChanged: (value) {
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        _firestore.collection('messages').add({
                          'messageText': messageText,
                          'sender': loggedInUser.email,
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
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  final FirebaseUser loggedInUser;
  MessagesStream({@required this.loggedInUser});

  @override
  Widget build(BuildContext context) {
    return     StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data.documents.reversed;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            final messageText = message.data['messageText'];
            final messageSender = message.data['sender'];
            final messageBubble = MessageBubble(messageSender: messageSender, messageText: messageText, loggedInUser: loggedInUser,);
            messageBubbles.add(messageBubble);
          }
          return Expanded(child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageBubbles)
          );
        }
        else {
          return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              )
          );
        }
      },
    );
  }
}


class MessageBubble extends StatelessWidget {

  final String messageSender;
  final String messageText;
  final FirebaseUser loggedInUser;
  MessageBubble({@required this.messageSender, @required this.messageText, @required this.loggedInUser});

  @override
  Widget build(BuildContext context) {
    bool isMe = (messageSender==loggedInUser.email);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget> [
          Text(messageSender, style: TextStyle(color: Colors.black54, fontSize: 13.5),),
          Material(
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: isMe ? Radius.circular(22.0) : Radius.zero,
                bottomRight: Radius.circular(22.0),
                topRight: isMe ? Radius.zero : Radius.circular(22.0),
                bottomLeft: Radius.circular(22.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '$messageText',
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black54,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
