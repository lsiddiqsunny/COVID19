import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController controller;
  final _kDuration = const Duration(milliseconds: 300);
  final _kCurve = Curves.decelerate;

  QuestionCard({
    @required this.scaffoldKey,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Age?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                    child: Text('Prev'),
                    onPressed: () {
                      controller.previousPage(
                          duration: _kDuration, curve: _kCurve);
                    }),
                RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                  ),
                  onPressed: () {
                    controller.nextPage(duration: _kDuration, curve: _kCurve);
                  },
                  child: Text('Next'),
                ),
              ],
            )
          ],
        )),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(const Radius.circular(35.0))),
        height: MediaQuery.of(context).size.height * .75,
        width: MediaQuery.of(context).size.width * .8);
  }
}
