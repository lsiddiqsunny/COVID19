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
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height * .1, 0, 0)),
              RaisedButton(
                  padding: const EdgeInsets.all(3.0),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(25.0)),
                      side: BorderSide(color: Colors.blue, width: 5)),
                  elevation: 0,
                  onPressed: () {
                    Navigator.pushNamed(context, '/questions',arguments: language);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .125,
                    width: MediaQuery.of(context).size.width * .7,
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: new BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'images/submit.png',
                                scale: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            language == false
                                ? 'Submit Your \nCondition'
                                : 'পরিস্থিতি\nজমা দিন',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height * .025, 0, 0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      padding: const EdgeInsets.all(3.0),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(25.0)),
                          side: BorderSide(color: Colors.green, width: 5)),
                      elevation: 0,
                      onPressed: () {
                        Navigator.pushNamed(context, '/map');
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .25,
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: new BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'images/map.png',
                                    scale: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                language == false
                                    ? 'Quarantine\nZones'
                                    : 'পৃথক\nঅঞ্চল',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      )),
                  RaisedButton(
                      padding: const EdgeInsets.all(3.0),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(25.0)),
                          side: BorderSide(color: Colors.orange, width: 5)),
                      elevation: 0,
                      onPressed: () {
                        Navigator.pushNamed(context, '/symptoms', arguments: language);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .25,
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: new BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'images/symptoms.png',
                                    scale: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                language == false
                                    ? 'Symptoms \nand Information'
                                    : 'লক্ষণ এবং তথ্য',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height * .025, 0, 0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      padding: const EdgeInsets.all(3.0),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(25.0)),
                          side: BorderSide(color: Colors.purple, width: 5)),
                      elevation: 0,
                      onPressed: () {
                        Navigator.pushNamed(context, '/statistics');
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .25,
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: new BoxDecoration(
                                  color: Colors.purple,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'images/map.png',
                                    scale: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                language == false ? 'Statistics' : 'পরিসংখ্যান',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      )),
                  RaisedButton(
                      padding: const EdgeInsets.all(3.0),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.all(const Radius.circular(25.0)),
                          side: BorderSide(color: Colors.red, width: 5)),
                      elevation: 0,
                      onPressed: () {
                        Navigator.pushNamed(context, '/quarantine');
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * .25,
                        width: MediaQuery.of(context).size.width * .25,
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: new BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'images/testtube.png',
                                    scale: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                language == false
                                    ? 'Nearest Test Center'
                                    : 'নিকটতম পরীক্ষা কেন্দ্র',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
