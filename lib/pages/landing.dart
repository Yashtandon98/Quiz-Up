import 'package:flutter/material.dart';

class landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black,
      child: new InkWell(
        onTap: () => print("You tapped the page"),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Quiz-Up!", style: new TextStyle(color: Colors.cyan, fontSize: 60.0, fontWeight: FontWeight.bold),),
            new Text("Tap to Start!", style: new TextStyle(color: Colors.cyan, fontSize: 20.0, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}