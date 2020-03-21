import 'package:covid19/view/home.dart';
import 'package:covid19/view/map.dart';
import 'package:covid19/view/quarantine.dart';
import 'package:covid19/view/question.dart';
import 'package:covid19/view/symtoms.dart';
import 'package:covid19/view/welcome.dart';
import 'package:flutter/material.dart';
import 'package:covid19/view/statistics.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => new WelcomeScreen(),
        '/home': (context) => HomeScreen(),
        '/questions': (context) => QuestionScreen(),
        '/symptoms': (context) => Symptoms(),
        '/map': (context) => MapPage(),
        '/statistics' : (context) => Statistics(),
        '/quarantine': (context) => Quarantine()
      },
    );
  }
}
