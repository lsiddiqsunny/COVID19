import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  PageController controller = new PageController();
  List<String> diseases = ['CoVID 19', 'Cold', 'Flu'];
  List<String> symptoms = [
    '1. Fever\n2. Cough\n3. Shortness of breath',
    '1. Sore Throat\n2. Runny Nose\n3. Cough\n4. Sneezeing\n5. Headaches\n6. Body Aches',
    '1. Fever\n2. Cough\n3. Sore Throat\n4. Runny Nose\n5. Body Aches\n6. Headaches\n7. Tiredness\n8. Vomiting and Diarrhea'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.redAccent,
        body: PageView.builder(
          controller: controller,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(diseases[index]),
                        Text(symptoms[index]),
                        index < 2
                            ? RaisedButton(
                                onPressed: () {
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.decelerate);
                                },
                                child: Text('Next'),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          new BorderRadius.all(const Radius.circular(35.0))),
                  height: MediaQuery.of(context).size.height * .75,
                  width: MediaQuery.of(context).size.width * .8),
            );
          },
        ));
  }
}
