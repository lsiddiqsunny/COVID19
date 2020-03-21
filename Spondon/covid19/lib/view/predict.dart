import 'package:flutter/material.dart';

class PredictionPage extends StatelessWidget {
  String getDecison(int disease, bool language) {
    if (disease == -1) {
      return language == false
          ? "You may not have any disease.Stay safe!"
          : "আপনার কোনও রোগ নাও থাকতে পারে নিরাপদে থাকুন!";
    } else if (disease == 0) {
      return language == false
          ? "You may be cold fever. Contact Doctor"
          : "আপনার ঠান্ডা জ্বর হতে পারে। আপনার ডক্টরের সাথে যোগাযোগ করা উচিত";
    } else if (disease == 1) {
      return language == false
          ? "You may have corona. Contact doctor ASAP."
          : "আপনার করোনা থাকতে পারে\nযত তাড়াতাড়ি সম্ভব ডাক্তারের সাথে যোগাযোগ করুন";
    } else {
      return language == false
          ? "You may be flu. Contact doctor"
          : "আপনি ফ্লু হতে পারে। ডাক্তারের সাথে যোগাযোগ করুন";
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Object> objects = ModalRoute.of(context).settings.arguments;
    int disease = objects[0];
    bool language = objects[1];

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
                        getDecison(disease, language),
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
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 50,
                            width: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.blueAccent,
                                ),
                                Text(language == false ? 'Home' : 'প্রধান পাতা',
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
