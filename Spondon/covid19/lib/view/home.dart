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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Text(
              'Home',
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
                Navigator.pushNamed(context, '/questions');
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.30,
                child: Center(
                  child: Text(
                    'Submit Your Condition',
                    style: TextStyle(color: Colors.white),
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
                    'Statistics',
                    style: TextStyle(color: Colors.white),
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
                    'Symptoms and Information',
                    style: TextStyle(color: Colors.white),
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
                    'Nearest Test Center',
                    style: TextStyle(color: Colors.white),
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
                    'Quarantine Zones',
                    style: TextStyle(color: Colors.white),
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
