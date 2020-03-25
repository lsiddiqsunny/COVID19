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
                          _getCurrentLocation();
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
}
