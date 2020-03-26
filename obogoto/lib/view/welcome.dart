import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WelcomeScreenState();
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  bool language = false;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  List<Color> _colors = [Colors.purpleAccent, Colors.lightBlue];
  List<double> _stops = [0.0, 1];

  void _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      print(position);
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    _getCurrentLocation();

    return Scaffold(
      body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                  child: Text(
                    'অবগত',
                    style: TextStyle(
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(1.0, 1.0),
                            blurRadius: 5.0,
                            color: Colors.black,
                          ),
                        ],
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                new Container(
                  height: MediaQuery.of(context).size.height * .15,
                  width: MediaQuery.of(context).size.width * .6,
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(25.0)),
                    border: Border.all(color: Colors.white, width: 5),
                  ),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(
                          Icons.warning,
                          size: 65,
                          color: Colors.white,
                        ),
                        Text(
                          'Attention\nPlease!'.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              /*
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 5.0,
                                  color: Colors.black,
                                ),
                              ],*/
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  language == false
                      ? 'This app is made for the \ngeneral awareness of people \nabout COVID-19 and its\n current situation in \nBangladesh'
                      : 'কোভিড ১৯ এবং বাংলাদেশের \nবর্তমান পরিস্থিতি সম্পর্কে \n সাধারণ মানুষের সচেতনতার জন্য \nএই অ্যাপটি তৈরি করা হয়েছে।',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  language == false
                      ? 'We will encourage not to \ninput any wrong information \nso that everyone can be aware \nof the actual situation and \nensure their safety'
                      : 'আমরা কোনও ভুল তথ্য \nইনপুট না করতে উত্সাহিত করব \nযাতে প্রত্যেকে প্রকৃত পরিস্থিতি সম্পর্কে সচেতন হতে পারে \nএবং তাদের সুরক্ষা নিশ্চিত করতে পারে',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                RaisedButton(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.white, width: 4)),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home',
                        arguments: language);
                  },
                  child: Container(
                      height: 50,
                      width: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(language == false ? 'Start' : 'শুরু',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ],
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        language == false
                            ? 'বাংলায় স্যুইচ করুন'
                            : 'Switch to English',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Switch(
                        value: language,
                        onChanged: (_) {
                          setState(() {
                            language = _;
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment(-1.0, 2.0),
            end: Alignment(1.0, -2.0),
            colors: _colors,
            stops: _stops,
          ))),
    );

    /*
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        child: Center(
            child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'CoVID 19',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.all(18),
                        child: Text(
                          language == false
                              ? 'This app is made for the general awareness of people about covid 19 and its current situation in Bangladesh. \nSo we will encourage not to input any wrong information \nso that everyone can be aware of the actual situation and ensure their safety'
                              : 'কোভিড ১৯ এবং বাংলাদেশের বর্তমান পরিস্থিতি সম্পর্কে মানুষের সাধারণ সচেতনতার জন্য এই অ্যাপটি তৈরি করা হয়েছে। \n সুতরাং আমরা কোনও ভুল তথ্য ইনপুট না করতে উত্সাহিত করব \nযাতে প্রত্যেকে প্রকৃত পরিস্থিতি সম্পর্কে সচেতন হতে পারে এবং তাদের সুরক্ষা নিশ্চিত করতে পারে',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(language == false
                              ? 'বাংলায় স্যুইচ করুন'
                              : 'Switch to English'),
                          Switch(
                              value: language,
                              onChanged: (_) {
                                setState(() {
                                  language = _;
                                });
                              }),
                        ],
                      ),
                      RaisedButton(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            side:
                                BorderSide(color: Colors.blueAccent, width: 2)),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home',
                              arguments: language);
                        },
                        child: Container(
                            height: 50,
                            width: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(language == false ? 'Start' : 'শুরু',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 17,
                                    )),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.blueAccent,
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        new BorderRadius.all(const Radius.circular(50.0))),
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width * .8)),
      ),
    );
  }
  */
  }
}
