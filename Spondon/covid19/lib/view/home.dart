import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final bool language = ModalRoute.of(context).settings.arguments;

    print(language);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Text(
              language == false ? 'Home' : 'প্রধান পাতা',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            top: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.1,
          ),
          Positioned(
            child: RaisedButton(
              color: Colors.red.withOpacity(1),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              elevation: 0,
              onPressed: () {
                Navigator.pushNamed(context, '/questions',arguments: language);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.30,
                child: Center(
                  child: Text(
                    language == false
                        ? 'Submit Your Condition'
                        : 'পরিস্থিতি জমা দিন',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            top: MediaQuery.of(context).size.height * 0.09,
            right: MediaQuery.of(context).size.width * 0.1,
          ),
          Positioned(
            child: RaisedButton(
              color: Colors.purple.withOpacity(.75),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              elevation: 0,
              onPressed: () {
                Navigator.pushNamed(context, '/statistics');
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.30,
                child: Center(
                  child: Text(
                    language == false ? 'Statistics' : 'পরিসংখ্যান',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            top: MediaQuery.of(context).size.height * 0.2,
            left: MediaQuery.of(context).size.width * 0.1,
          ),
          Positioned(
            child: RaisedButton(
              color: Colors.blue.withOpacity(.75),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              elevation: 0,
              onPressed: () {
                Navigator.pushNamed(context, '/symptoms');
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.30,
                child: Center(
                  child: Text(
                    language == false
                        ? 'Symptoms and Information'
                        : 'লক্ষণ এবং তথ্য',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            top: MediaQuery.of(context).size.height * 0.255,
            right: MediaQuery.of(context).size.width * 0.1,
          ),
          Positioned(
            child: RaisedButton(
              color: Colors.orange.withOpacity(.75),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              elevation: 0,
              onPressed: () {
                Navigator.pushNamed(context, '/quarantine');
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.30,
                child: Center(
                  child: Text(
                    language == false
                        ? 'Nearest Test Center'
                        : 'নিকটতম পরীক্ষা কেন্দ্র',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            top: MediaQuery.of(context).size.height * 0.525,
            left: MediaQuery.of(context).size.width * 0.1,
          ),
          Positioned(
            child: RaisedButton(
              color: Colors.green.withOpacity(.75),
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(15.0),
              ),
              elevation: 0,
              onPressed: () {
                Navigator.pushNamed(context, '/map');
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.30,
                child: Center(
                  child: Text(
                    language == false ? 'Quarantine Zones' : 'পৃথক অঞ্চল',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            top: MediaQuery.of(context).size.height * (0.255 + .325),
            right: MediaQuery.of(context).size.width * 0.1,
          ),
        ],
      ),
    );
  }
}
