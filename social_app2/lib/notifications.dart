import 'package:flutter/material.dart';

import 'message1.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.92,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurpleAccent.shade700.withOpacity(0.9),
              Colors.purple.shade800.withOpacity(0.7),
              Colors.purple.shade800.withOpacity(0.6),
              Colors.purple.shade800.withOpacity(0.6),
              Colors.purple.shade200.withOpacity(0.9),
              Colors.purple.shade100.withOpacity(0.9),
            ],
          ),
        ),
        child: Column(
          children: [

            Padding(
              padding:  EdgeInsets.symmetric(vertical: 100,horizontal: 20),
              child: Column(

                children: [
                  otherUserChatCont(name: "Esha",   msg: "Hello! what..", img: "assets/images/b.png", time: "7:00",),
                  otherUserChatCont(name: "Kashaf", msg: "Have a nice..", img: "assets/images/c.png", time: "7:00"),
                  otherUserChatCont(name: "Zainab ",msg: "Wao! good....", img: "assets/images/b.png", time: "7:00"),
                  otherUserChatCont(name: "Sawera ",msg: "Plz come ....", img: "assets/images/d.png", time: "7:00"),
                  otherUserChatCont(name: "Nimra ", msg: "Don't do ....", img: "assets/images/c.png", time: "7:00"),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
