import 'package:covid19/view/quesiton_card.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuestionScreenState();
  }
}

class QuestionScreenState extends State<QuestionScreen> {
  PageController controller = PageController(keepPage: true);
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.redAccent,
        body: Container(
            child: Center(
                child: PageView.builder(
          controller: controller,
          physics: new NeverScrollableScrollPhysics(),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  QuestionCard(
                    controller: controller,
                    scaffoldKey: scaffoldKey,
                  )
                ],
              ),
            );
            /*return TrueFalseCard(
              index: index,
              controller: controller,
              current: model.current,
              tf: model.truefalselist[index],
              scaffoldKey: _scaffoldKey,
            );*/
          },
        ))));
  }
}

/*

                */
