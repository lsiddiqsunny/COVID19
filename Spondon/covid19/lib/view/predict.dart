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
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Prediction"),
        ),
        body: Center(
            child: new SingleChildScrollView(
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[Text(getDecison())])))));
  }
}
