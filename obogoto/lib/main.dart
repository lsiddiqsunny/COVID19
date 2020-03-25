import 'package:obogoto/view/home.dart';
import 'package:obogoto/view/map.dart';
import 'package:obogoto/view/predict.dart';
import 'package:obogoto/view/quarantine.dart';
import 'package:obogoto/view/question.dart';
import 'package:obogoto/view/symtoms.dart';
import 'package:obogoto/view/welcome.dart';
import 'package:flutter/material.dart';
import 'package:obogoto/view/statistics.dart';
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
        '/quarantine': (context) => Quarantine(),
        '/predict':(context) => PredictionPage()
      },
    );
  }
}
