import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  PageController controller = new PageController();
  List<String> diseases = ['CoVID 19', 'Cold', 'Flu','Developed By'];
  List<String> bn_diseases = ['কোভিড ১৯', 'ঠান্ডা', 'ফ্লু','Developed By'];
  List<String> symptoms = [
    '1. Fever\n2. Cough\n3. Shortness of breath',
    '1. Sore Throat\n2. Runny Nose\n3. Cough\n4. Sneezeing\n5. Headaches\n6. Body Aches',
    '1. Fever\n2. Cough\n3. Sore Throat\n4. Runny Nose\n5. Body Aches\n6. Headaches\n7. Tiredness\n8. Vomiting and Diarrhea',
    'Shanjinur Islam Spondon\nLatif Siddiq Sunny\nLatifur Rahman\nMarium Mostafiz Mou\nMoynul Hasan\nNafisa Sadat Prova\nRizvan Ahmed Rafsan\Ariful Haque'
  ];

  List<String> bn_symptoms = [
    '1। জ্বর \n2। কাশি করুন \n3। নিঃশ্বাসের দুর্বলতা',
    '1। গলা ব্যথা \n2। প্রবাহিত নাক। \n3। কাশি \n4। হাঁচি\n5। মাথাব্যাথা \n6। শরীর ব্যথা',
    '1। জ্বর \n2। কাশি করুন \n3। গলা ব্যথা \n4। প্রবাহিত নাক। \n5। শারীরিক ব্যথা \n6। মাথাব্যাথা \n7। ক্লান্তি \n8। বমি এবং ডায়রিয়া ',
    'Shanjinur Islam Spondon\nLatif Siddiq Sunny\nLatifur Rahman\nMarium Mostafiz Mou\nMoynul Hasan\nNafisa Sadat Prova\nRizvan Ahmed Rafsan\Ariful Haque'
  ];

  @override
  Widget build(BuildContext context) {
    final bool language = ModalRoute.of(context).settings.arguments;

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
                        Text(language == false
                            ? diseases[index]
                            : bn_diseases[index],style: TextStyle(fontSize: 24),),
                        Text(language == false
                            ? symptoms[index]
                            : bn_symptoms[index],style: TextStyle(fontSize: 20)),
                        index < 3
                            ? RaisedButton(
                                onPressed: () {
                                  controller.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.decelerate);
                                },
                                child: Text(
                                    language == false ? 'Next' : 'পরবর্তী'),
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
