import 'package:flutter/material.dart';

class PredictionPage extends StatelessWidget {
  final int disease;
  PredictionPage(this.disease);
  String getDecison() {
    if (disease == 0) {
      return "You may be cold fever. Contact Doctor";
    } else if (disease == 1) {
      return "You may have corona. Contact doctor ASAP.";
    } else {
      return "You may be flu. Contact doctor";
    }
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
                        getDecison(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      RaisedButton(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            side:
                                BorderSide(color: Colors.blueAccent, width: 2)),
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        child: Container(
                            height: 50,
                            width: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.blueAccent,
                                ),
                                Text('Home',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 17,
                                    )),
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
