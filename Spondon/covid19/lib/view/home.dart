import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  Future<void> _launched;
  String _phone = '';

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    const String toLaunch = 'https://www.worldometers.info/coronavirus/';
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
                setState(() {
                  _launched = _launchInBrowser(toLaunch);
                });
                FutureBuilder<void>(future: _launched, builder: _launchStatus);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width * 0.30,
                child: Center(
                  child: Text(
                    'Worldwide Statistics',
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
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.05,
            left: MediaQuery.of(context).size.width * 0.15,
              child: RaisedButton(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(25.0),
                side: BorderSide(color: Colors.blueAccent, width: 2)),
            onPressed: () {
              final RenderBox box = context.findRenderObject();
              Share.share("text",
                  subject: "subject",
                  sharePositionOrigin:
                      box.localToGlobal(Offset.zero) & box.size);
              //Navigator.pop(context);
            },
            child: Container(
                height: 50,
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Share ',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 17,
                        )),
                    Icon(
                      Icons.share,
                      color: Colors.blueAccent,
                    ),
                  ],
                )),
          ))
        ],
      ),
    );
  }
}
