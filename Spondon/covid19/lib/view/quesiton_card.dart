import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class QuestionCard extends StatefulWidget {
  final String type;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController controller;
  final _kDuration = const Duration(milliseconds: 300);
  final _kCurve = Curves.decelerate;

  QuestionCard({
    @required this.type,
    @required this.scaffoldKey,
    @required this.controller,
  });

  @override
  State<StatefulWidget> createState() {
    return QuestionCardState();
  }
}

class QuestionCardState extends State<QuestionCard> {
  String _selectedAge;
  String _selectedGender;
  String _heart;

  @override
  void initState() {
    super.initState();
  }

  List<String> countries = [
    'Not Applicable'
        'Afghanistan,AF',
    'Åland Islands,AX',
    'Albania,AL',
    'Algeria,DZ',
    'American Samoa,AS',
    'Andorra,AD',
    'Angola,AO',
    'Anguilla,AI',
    'Antarctica,AQ',
    'Antigua and Barbuda,AG',
    'Argentina,AR',
    'Armenia,AM',
    'Aruba,AW',
    'Australia,AU',
    'Austria,AT',
    'Azerbaijan,AZ',
    'Bahamas,BS',
    'Bahrain,BH',
    'Bangladesh,BD',
    'Barbados,BB',
    'Belarus,BY',
    'Belgium,BE',
    'Belize,BZ',
    'Benin,BJ',
    'Bermuda,BM',
    'Bhutan,BT',
    '"Bolivia, Plurinational State of",BO',
    '"Bonaire, Sint Eustatius and Saba",BQ',
    'Bosnia and Herzegovina,BA',
    'Botswana,BW',
    'Bouvet Island,BV',
    'Brazil,BR',
    'British Indian Ocean Territory,IO',
    'Brunei Darussalam,BN',
    'Bulgaria,BG',
    'Burkina Faso,BF',
    'Burundi,BI',
    'Cambodia,KH',
    'Cameroon,CM',
    'Canada,CA',
    'Cape Verde,CV',
    'Cayman Islands,KY',
    'Central African Republic,CF',
    'Chad,TD',
    'Chile,CL',
    'China,CN',
    'Christmas Island,CX',
    'Cocos (Keeling) Islands,CC',
    'Colombia,CO',
    'Comoros,KM',
    'Congo,CG',
    '"Congo, the Democratic Republic of the",CD',
    'Cook Islands,CK',
    'Costa Rica,CR',
    'Côte d\'Ivoire,CI',
    'Croatia,HR',
    'Cuba,CU',
    'Curaçao,CW',
    'Cyprus,CY',
    'Czech Republic,CZ',
    'Denmark,DK',
    'Djibouti,DJ',
    'Dominica,DM',
    'Dominican Republic,DO',
    'Ecuador,EC',
    'Egypt,EG',
    'El Salvador,SV',
    'Equatorial Guinea,GQ',
    'Eritrea,ER',
    'Estonia,EE',
    'Ethiopia,ET',
    'Falkland Islands (Malvinas),FK',
    'Faroe Islands,FO',
    'Fiji,FJ',
    'Finland,FI',
    'France,FR',
    'French Guiana,GF',
    'French Polynesia,PF',
    'French Southern Territories,TF',
    'Gabon,GA',
    'Gambia,GM',
    'Georgia,GE',
    'Germany,DE',
    'Ghana,GH',
    'Gibraltar,GI',
    'Greece,GR',
    'Greenland,GL',
    'Grenada,GD',
    'Guadeloupe,GP',
    'Guam,GU',
    'Guatemala,GT',
    'Guernsey,GG',
    'Guinea,GN',
    'Guinea-Bissau,GW',
    'Guyana,GY',
    'Haiti,HT',
    'Heard Island and McDonald Islands,HM',
    'Holy See (Vatican City State),VA',
    'Honduras,HN',
    'Hong Kong,HK',
    'Hungary,HU',
    'Iceland,IS',
    'India,IN',
    'Indonesia,ID',
    '"Iran, Islamic Republic of",IR',
    'Iraq,IQ',
    'Ireland,IE',
    'Isle of Man,IM',
    'Israel,IL',
    'Italy,IT',
    'Jamaica,JM',
    'Japan,JP',
    'Jersey,JE',
    'Jordan,JO',
    'Kazakhstan,KZ',
    'Kenya,KE',
    'Kiribati,KI',
    '"Korea, Democratic People\'s Republic of",KP',
    '"Korea, Republic of",KR',
    'Kuwait,KW',
    'Kyrgyzstan,KG',
    'Lao People\'s Democratic Republic,LA',
    'Latvia,LV',
    'Lebanon,LB',
    'Lesotho,LS',
    'Liberia,LR',
    'Libya,LY',
    'Liechtenstein,LI',
    'Lithuania,LT',
    'Luxembourg,LU',
    'Macao,MO',
    '"Macedonia, the Former Yugoslav Republic of",MK',
    'Madagascar,MG',
    'Malawi,MW',
    'Malaysia,MY',
    'Maldives,MV',
    'Mali,ML',
    'Malta,MT',
    'Marshall Islands,MH',
    'Martinique,MQ',
    'Mauritania,MR',
    'Mauritius,MU',
    'Mayotte,YT',
    'Mexico,MX',
    '"Micronesia, Federated States of",FM',
    '"Moldova, Republic of",MD',
    'Monaco,MC',
    'Mongolia,MN',
    'Montenegro,ME',
    'Montserrat,MS',
    'Morocco,MA',
    'Mozambique,MZ',
    'Myanmar,MM',
    'Namibia,NA',
    'Nauru,NR',
    'Nepal,NP',
    'Netherlands,NL',
    'New Caledonia,NC',
    'New Zealand,NZ',
    'Nicaragua,NI',
    'Niger,NE',
    'Nigeria,NG',
    'Niue,NU',
    'Norfolk Island,NF',
    'Northern Mariana Islands,MP',
    'Norway,NO',
    'Oman,OM',
    'Pakistan,PK',
    'Palau,PW',
    '"Palestine, State of",PS',
    'Panama,PA',
    'Papua New Guinea,PG',
    'Paraguay,PY',
    'Peru,PE',
    'Philippines,PH',
    'Pitcairn,PN',
    'Poland,PL',
    'Portugal,PT',
    'Puerto Rico,PR',
    'Qatar,QA',
    'Réunion,RE',
    'Romania,RO',
    'Russian Federation,RU',
    'Rwanda,RW',
    'Saint Barthélemy,BL',
    '"Saint Helena, Ascension and Tristan da Cunha",SH',
    'Saint Kitts and Nevis,KN',
    'Saint Lucia,LC',
    'Saint Martin (French part),MF',
    'Saint Pierre and Miquelon,PM',
    'Saint Vincent and the Grenadines,VC',
    'Samoa,WS',
    'San Marino,SM',
    'Sao Tome and Principe,ST',
    'Saudi Arabia,SA',
    'Senegal,SN',
    'Serbia,RS',
    'Seychelles,SC',
    'Sierra Leone,SL',
    'Singapore,SG',
    'Sint Maarten (Dutch part),SX',
    'Slovakia,SK',
    'Slovenia,SI',
    'Solomon Islands,SB',
    'Somalia,SO',
    'South Africa,ZA',
    'South Georgia and the South Sandwich Islands,GS',
    'South Sudan,SS',
    'Spain,ES',
    'Sri Lanka,LK',
    'Sudan,SD',
    'Suriname,SR',
    'Svalbard and Jan Mayen,SJ',
    'Swaziland,SZ',
    'Sweden,SE',
    'Switzerland,CH',
    'Syrian Arab Republic,SY',
    '"Taiwan, Province of China",TW',
    'Tajikistan,TJ',
    '"Tanzania, United Republic of",TZ',
    'Thailand,TH',
    'Timor-Leste,TL',
    'Togo,TG',
    'Tokelau,TK',
    'Tonga,TO',
    'Trinidad and Tobago,TT',
    'Tunisia,TN',
    'Turkey,TR',
    'Turkmenistan,TM',
    'Turks and Caicos Islands,TC',
    'Tuvalu,TV',
    'Uganda,UG',
    'Ukraine,UA',
    'United Arab Emirates,AE',
    'United Kingdom,GB',
    'United States,US',
    'United States Minor Outlying Islands,UM',
    'Uruguay,UY',
    'Uzbekistan,UZ',
    'Vanuatu,VU',
    '"Venezuela, Bolivarian Republic of",VE',
    'Viet Nam,VN',
    '"Virgin Islands, British",VG',
    '"Virgin Islands, U.S.",VI',
    'Wallis and Futuna,WF',
    'Western Sahara,EH',
    'Yemen,YE',
    'Zambia,ZM',
    'Zimbabwe,ZW',
  ];

  Widget age() {
    List<String> ages = [];
    for (int i = 0; i < 150; i++) {
      ages.add(i.toString());
    }
    return Column(children: <Widget>[
      new DropdownButton<String>(
        value: _selectedAge,
        hint: Text(
          'Select Your Age',
          style: TextStyle(fontSize: 20),
        ),
        items: ages.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _selectedAge = newValue;
          });
        },
      )
    ]);
  }

  Widget sex() {
    List<String> gender = ['Male', 'Female', 'Other'];

    return Column(children: <Widget>[
      new DropdownButton<String>(
        value: _selectedGender,
        hint: Text(
          'Select Your Gender',
          style: TextStyle(fontSize: 20),
        ),
        items: gender.map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          setState(() {
            _selectedGender = newValue;
          });
        },
      )
    ]);
  }

  Widget heartDisease() {
    List<String> submit = ['Yes', 'No'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Do you have heart disease?'),
        new DropdownButton<String>(
          value: _heart,
          hint: Text(
            'Select yes/no',
            style: TextStyle(fontSize: 20),
          ),
          items: submit.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _heart = newValue;
            });
          },
        )
      ],
    );
  }

  Widget lungDisease() {
    List<String> submit = ['Yes', 'No'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Do you have lung disease?'),
        new DropdownButton<String>(
          value: _heart,
          hint: Text(
            'Select yes/no',
            style: TextStyle(fontSize: 20),
          ),
          items: submit.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _heart = newValue;
            });
          },
        )
      ],
    );
  }

  Widget diabetes() {
    List<String> submit = ['Yes', 'No'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Do you have diabetes?'),
        new DropdownButton<String>(
          value: _heart,
          hint: Text(
            'Select yes/no',
            style: TextStyle(fontSize: 20),
          ),
          items: submit.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _heart = newValue;
            });
          },
        )
      ],
    );
  }

  Widget fever() {
    List<String> submit = ['Yes', 'No'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Do you have fever?'),
        new DropdownButton<String>(
          value: _heart,
          hint: Text(
            'Select yes/no',
            style: TextStyle(fontSize: 20),
          ),
          items: submit.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _heart = newValue;
            });
          },
        )
      ],
    );
  }

  Widget cough() {
    List<String> submit = ['Yes', 'No'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Do you have cough?'),
        new DropdownButton<String>(
          value: _heart,
          hint: Text(
            'Select yes/no',
            style: TextStyle(fontSize: 20),
          ),
          items: submit.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _heart = newValue;
            });
          },
        )
      ],
    );
  }

  Widget sob() {
    List<String> submit = ['Yes', 'No'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Do you have shortness of breath?'),
        new DropdownButton<String>(
          value: _heart,
          hint: Text(
            'Select yes/no',
            style: TextStyle(fontSize: 20),
          ),
          items: submit.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _heart = newValue;
            });
          },
        )
      ],
    );
  }

  Widget pic() {
    List<String> submit = ['Yes', 'No'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Do you have pressure in chest?'),
        new DropdownButton<String>(
          value: _heart,
          hint: Text(
            'Select yes/no',
            style: TextStyle(fontSize: 20),
          ),
          items: submit.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _heart = newValue;
            });
          },
        )
      ],
    );
  }

  Widget submit() {
    return Container(
      child: Center(
          child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Submit Your Response',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        )),
                    RaisedButton(
                      color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          side: BorderSide(color: Colors.blueAccent, width: 2)),
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
                              Text('Submit',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 17,
                                  )),
                              Icon(
                                Icons.arrow_forward_ios,
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
    );
  }

  Widget cc() {
    List<String> submit = ['Yes', 'No'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          'Did you have close contact\n with corona patient?',
          textAlign: TextAlign.center,
        ),
        new DropdownButton<String>(
          value: _heart,
          hint: Text(
            'Select yes/no',
            style: TextStyle(fontSize: 20),
          ),
          items: submit.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _heart = newValue;
            });
          },
        )
      ],
    );
  }

  Widget tc() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          'Have you been outside\n of the country?',
          textAlign: TextAlign.center,
        ),
        new DropdownButton<String>(
          value: _heart,
          hint: Text(
            'Select country',
            style: TextStyle(fontSize: 15),
          ),
          items: countries.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            );
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _heart = newValue;
            });
          },
        )
      ],
    );
  }

  Widget getWidgetByCatagory() {
    switch (widget.type) {
      case "age":
        return Positioned(
          child: age(),
          top: MediaQuery.of(context).size.height * .3,
          left: MediaQuery.of(context).size.width * .2,
        );
      case "sex":
        return Positioned(
          child: sex(),
          top: MediaQuery.of(context).size.height * .3,
          left: MediaQuery.of(context).size.width * .15,
        );
      case "hd":
        return Positioned(
          child: heartDisease(),
          top: MediaQuery.of(context).size.height * .3,
          left: MediaQuery.of(context).size.width * .175,
        );
      case "ld":
        return Positioned(
          child: lungDisease(),
          top: MediaQuery.of(context).size.height * .3,
          left: MediaQuery.of(context).size.width * .175,
        );
      case "db":
        return Positioned(
          child: diabetes(),
          top: MediaQuery.of(context).size.height * .3,
          left: MediaQuery.of(context).size.width * .2,
        );
      case "fever":
        return Positioned(
          child: fever(),
          top: MediaQuery.of(context).size.height * .3,
          left: MediaQuery.of(context).size.width * .2,
        );
      case "cough":
        return Positioned(
          child: cough(),
          top: MediaQuery.of(context).size.height * .3,
          left: MediaQuery.of(context).size.width * .2,
        );
      case "sob":
        return Positioned(
          child: sob(),
          top: MediaQuery.of(context).size.height * .3,
          left: MediaQuery.of(context).size.width * .15,
        );
      case "pic":
        return Positioned(
          child: pic(),
          top: MediaQuery.of(context).size.height * .3,
          left: MediaQuery.of(context).size.width * .15,
        );
      case "cc":
        return Positioned(
          child: cc(),
          top: MediaQuery.of(context).size.height * .3,
          left: MediaQuery.of(context).size.width * .18,
        );
      case "tc":
        return Positioned(
          child: tc(),
          top: MediaQuery.of(context).size.height * .3,
          left: MediaQuery.of(context).size.width * .1,
        );
      case "submit":
        return submit();
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
          children: <Widget>[
            getWidgetByCatagory(),
            Positioned(
                bottom: MediaQuery.of(context).size.height * .07,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                        child: Text('Prev'),
                        onPressed: () {
                          widget.controller.previousPage(
                              duration: widget._kDuration,
                              curve: widget._kCurve);
                        }),
                    RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0),
                      ),
                      onPressed: () {
                        widget.controller.nextPage(
                            duration: widget._kDuration, curve: widget._kCurve);
                      },
                      child: Text('Next'),
                    ),
                  ],
                ))
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(const Radius.circular(35.0))),
        height: MediaQuery.of(context).size.height * .75,
        width: MediaQuery.of(context).size.width * .8);
  }
}

/*
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    child: Text('Prev'),
                    onPressed: () {
                      widget.controller.previousPage(
                          duration: widget._kDuration, curve: widget._kCurve);
                    }),
                RaisedButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  onPressed: () {
                    widget.controller.nextPage(
                        duration: widget._kDuration, curve: widget._kCurve);
                  },
                  child: Text('Next'),
                ),
              ],
            )*/
