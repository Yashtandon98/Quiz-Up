import 'package:flutter/material.dart';
import 'pages/landing.dart';
import 'pages/quiz_page.dart';
import 'pages/score_page.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Landing(),
  ));
}