import 'package:covid19/controller/form_controller.dart';
import 'package:covid19/model/form.dart';
import 'package:covid19/view/predict.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class QuestionCard extends StatefulWidget {
  final FeedbackForm feedbackForm;
  final String type;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController controller;
  final _kDuration = const Duration(milliseconds: 300);
  final _kCurve = Curves.decelerate;

  QuestionCard({
    @required this.feedbackForm,
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
  String _lung;
  String _diabetes;
  String _fever;
  String _cough;
  String _sob;
  String _pic;
  String _cc;
  String _tc;

  @override
  void initState() {
    super.initState();
  }

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress = 'Bangladesh';

  void _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.subLocality}, ${place.locality}, ${place.postalCode}";
      });
    } catch (e) {
      print(e);
    }
  }

  List<String> countries = [
    'Afghanistan',
    'Åland Islands',
    'Albania',
    'Algeria',
    'American Samoa',
    'Andorra',
    'Angola',
    'Anguilla',
    'Antarctica',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Aruba',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bermuda',
    'Bhutan',
    'Bolivia',
    'Bonaire',
    'Bosnia and Herzegovina',
    'Botswana',
    'Bouvet Island',
    'Brazil',
    'British Indian Ocean Territory',
    'Brunei Darussalam',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Cape Verde',
    'Cayman Islands',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Christmas Island',
    'Cocos (Keeling) Islands',
    'Colombia',
    'Comoros',
    'Congo',
    '"Congo',
    'Cook Islands',
    'Costa Rica',
    'Côte d\'Ivoire',
    'Croatia',
    'Cuba',
    'Curaçao',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Ethiopia',
    'Falkland Islands (Malvinas)',
    'Faroe Islands',
    'Fiji',
    'Finland',
    'France',
    'French Guiana',
    'French Polynesia',
    'French Southern Territories',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Gibraltar',
    'Greece',
    'Greenland',
    'Grenada',
    'Guadeloupe',
    'Guam',
    'Guatemala',
    'Guernsey',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hong Kong',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Isle of Man',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jersey',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'North Korea',
    'South Korea',
    'Kuwait',
    'Kyrgyzstan',
    'Lao People\'s Democratic Republic',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macao',
    'Macedonia',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Martinique',
    'Mauritania',
    'Mauritius',
    'Mayotte',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Montserrat',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Caledonia',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'Niue',
    'Norfolk Island',
    'Northern Mariana Islands',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Palestine',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Pitcairn',
    'Poland',
    'Portugal',
    'Puerto Rico',
    'Qatar',
    'Réunion',
    'Romania',
    'Russian Federation',
    'Rwanda',
    'Saint Barthélemy',
    '"Saint Helena',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Martin (French part)',
    'Saint Pierre and Miquelon',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Sint Maarten (Dutch part)',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Georgia and the South Sandwich Islands',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Svalbard and Jan Mayen',
    'Swaziland',
    'Sweden',
    'Switzerland',
    'Syrian Arab Republic',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Timor-Leste',
    'Togo',
    'Tokelau',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Turks and Caicos Islands',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States',
    'United States Minor Outlying Islands',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Venezuela',
    'Viet Nam',
    'Yemen',
    'Zambia',
    'Zimbabwe',
  ];

  Widget age() {
    List<String> ages = [];
    for (int i = 0; i < 150; i++) {
      ages.add(i.toString());
    }
    return Column(children: <Widget>[
      new Text('I am'),
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
            widget.feedbackForm.age = _selectedAge;
            print(widget.feedbackForm.toParams());
          });
        },
      )
    ]);
  }

  Widget sex() {
    List<String> gender = ['Male', 'Female', 'Other'];

    return Column(children: <Widget>[
      new Text('I am'),
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
            widget.feedbackForm.sex = _selectedGender;
            print(widget.feedbackForm.toParams());
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
              widget.feedbackForm.heartdisease = _heart;
              print(widget.feedbackForm.heartdisease);
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
          value: _lung,
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
              _lung = newValue;
              widget.feedbackForm.lungdisease = _lung;
              print(widget.feedbackForm.toParams());
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
          value: _diabetes,
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
              _diabetes = newValue;
              widget.feedbackForm.diabetes = _diabetes;
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
          value: _fever,
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
              _fever = newValue;
              widget.feedbackForm.fever = _fever;
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
          value: _cough,
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
              _cough = newValue;
              widget.feedbackForm.cough = _cough;
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
          value: _sob,
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
              _sob = newValue;
              widget.feedbackForm.shortnessofbreathe = _sob;
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
          value: _pic,
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
              _pic = newValue;
              widget.feedbackForm.pressureinthechest = _pic;
            });
          },
        )
      ],
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
          value: _cc,
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
              _cc = newValue;
              widget.feedbackForm.closecontactwithcoronapatient = _cc;
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
          value: _tc,
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
              _tc = newValue;
              widget.feedbackForm.traveledcountry = _tc;
            });
          },
        )
      ],
    );
  }

  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    widget.scaffoldKey.currentState.showSnackBar(snackBar);
  }

  int getDecision(String age, String sex, String lung, String fever,
      String cough, String sob, String pic, String cc, String tc) {
    int travelState = 0;
    int _breatheState = sob == "Yes" ? 1 : 0;
    int _feverState = fever == "Yes" ? 1 : 0;
    int _chestState = pic == "Yes" ? 1 : 0;
    int _contactState = cc == "Yes" ? 1 : 0;
    int _coughState = cough == "Yes" ? 1 : 0;
    int _lungState = lung == "Yes" ? 1 : 0;
    int _sexState = sex == "Male" ? 1 : 0;

    print(_breatheState);
    print(_feverState);
    print(_chestState);
    print(_contactState);
    print(_coughState);
    print(_sexState);
    print(_lungState);

    var countryMap = {
      'china': 2,
      'singapore': 8,
      'usa': 3,
      'south korea': 5,
      'italy': 1,
      'germany': 9,
      'switzerland': 7,
      'spain': 4,
      'thailand': 6,
      'egypt': 10,
      'belgium': 11,
      'lebanon': 12,
      'iraq': 11,
      'iran': 11,
      'afganistan': 12,
      'kuwait': 12,
      'algeria': 12,
      'austria': 12,
      'nepal': 12,
      'malaysia': 10,
      'sri lanka': 12,
      'india': 12,
      'sweden': 10,
      'canada': 10,
      'netherlands': 12,
      'brazil': 12,
      'greece': 12,
      'israel': 12,
      'russia': 12,
      'chile': 12,
      'mexico': 12,
      'belarus': 12,
      'cyprus': 12,
      'turkey': 12,
      'honduras': 12,
      'kenya': 12,
      'uk': 10,
      'costa rica': 12,
      'armenia': 12,
      'ecuador': 12,
      'bosnia': 12,
      'azerbaijan': 12,
      'peru': 12,
      'panama': 12,
      'bulgeria': 12,
      'portugal': 11
    };
    if (countryMap.containsKey(tc.toLowerCase())) {
      travelState = countryMap[tc.toLowerCase()];
    } else {
      travelState = 0;
    }

    print(travelState);

    if (1 - _breatheState <= 0.5) {
      if (1 - _feverState <= 0.5) {
        if (1 - _chestState <= 0.5) {
          if (int.parse(age) <= 34.0) {
            if (int.parse(age) <= 31.0) {
              return 0;
            } else {
              return 2;
            }
          } else {
            return 0;
          }
        } else {
          if (1 - travelState <= 7.5) {
            return 1;
          } else {
            if (1 - travelState <= 11.0) {
              return 0;
            } else {
              return 2;
            }
          }
        }
      } else {
        if (1 - _contactState <= 0.5) {
          if (1 - _chestState <= 0.5) {
            return 2;
          } else {
            if (1 - _coughState <= 0.5) {
              return 2;
            } else {
              if (1 - _sexState <= 0.5) {
                return 2;
              } else {
                if (1 - _lungState <= 0.5) {
                  return 1;
                } else {
                  return 2;
                }
              }
            }
          }
        } else {
          return 1;
        }
      }
    } else {
      if (1 - _contactState <= 0.5) {
        if (1 - _chestState <= 0.5) {
          if (int.parse(age) <= 65.5) {
            if (1 - _feverState <= 0.5) {
              return 2;
            } else {
              if (int.parse(age) <= 31.0) {
                if (int.parse(age) <= 27.0) {
                  return 1;
                } else {
                  return 2;
                }
              } else {
                return 1;
              }
            }
          } else {
            if (travelState <= 10.5) {
              return 2;
            } else {
              return 1;
            }
          }
        } else {
          if (int.parse(age) <= 37.0) {
            if (1 - _lungState <= 0.5) {
              return 2;
            } else {
              return 1;
            }
          } else {
            return 1;
          }
        }
      } else {
        return 1;
      }
    }
  }

  int decision = 0;

  Future navigateToPrdictPage(context) async {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => PredictionPage(decision)));
  }

  Widget submit() {
    _getCurrentLocation();

    return Container(
      child: Center(
          child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Submit Your Response \n and please wait for result',
                        textAlign: TextAlign.center,
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
                        decision = getDecision(
                            widget.feedbackForm.age,
                            widget.feedbackForm.sex,
                            widget.feedbackForm.lungdisease,
                            widget.feedbackForm.fever,
                            widget.feedbackForm.cough,
                            widget.feedbackForm.shortnessofbreathe,
                            widget.feedbackForm.pressureinthechest,
                            widget.feedbackForm.closecontactwithcoronapatient,
                            widget.feedbackForm.traveledcountry);

                        FormController formController =
                            FormController((String response) {
                          print("Response: $response");
                          if (response == FormController.STATUS_SUCCESS) {
                            // Feedback is saved succesfully in Google Sheets.
                            _showSnackbar("Feedback Submitted");
                            navigateToPrdictPage(context);
                          } else {
                            // Error Occurred while saving data in Google Sheets.
                            _showSnackbar(
                                "Error Occured during Submission. Please try again.");
                            Navigator.pop(context);
                          }
                        });

                        // Submit 'feedbackForm' and save it in Google Sheets.
                        formController.submitForm(widget.feedbackForm);
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
