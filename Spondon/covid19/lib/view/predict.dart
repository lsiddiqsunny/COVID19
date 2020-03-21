import 'package:flutter/material.dart';
import 'package:share/share.dart';

class PredictionPage extends StatelessWidget {
  final int disease;
  PredictionPage(this.disease);
  String getDecison() {
    if (disease == -1) {
      return "You may not have any disease.Stay safe!";
    } else if (disease == 0) {
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
                          Navigator.pop(context);
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
                      ),
                      RaisedButton(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            side:
                                BorderSide(color: Colors.blueAccent, width: 2)),
                        onPressed: () {
                          final RenderBox box = context.findRenderObject();
                          Share.share(
                              "The best way to prevent corona is awareness. If you have the potential symptoms of corona, go for a checkup. For any kind of queries follow the link\nhttp://www.amazon.com/gp/mas/dl/android?s=Obogoto",
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
