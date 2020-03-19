import 'package:flutter/material.dart';
import 'controller/form_controller.dart';
import 'model/form.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'map.dart';
import 'prediction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covit19',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

//,
class MainPage extends StatelessWidget {
  Future navigateToFormPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormPage(title: 'Covit19')));
  }

  Future navigateToMapPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Click button to move to Form'),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Go to form'),
              onPressed: () {
                navigateToFormPage(context);
              },
            ),
            Text('Click button to move to Map'),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Go to map'),
              onPressed: () {
                navigateToMapPage(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

class FormPage extends StatefulWidget {
  FormPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FormPageState createState() => _FormPageState();
    Future navigateToFormPage(context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => FormPage(title: 'Covit19')));
  }
}

class GroupModel {
  String text;
  int index;
  GroupModel({this.text, this.index});
}

class _FormPageState extends State<FormPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  int _sexState = 0;
  String _sex = 'Male';
  void _handleSexStateChange(int value) {
    setState(() {
      _sexState = value;

      switch (_sexState) {
        case 0:
          _sex = 'Male';
          break;
        case 1:
          _sex = 'Female';
          break;
      }
    });
  }

  int _heartState = 0;
  String _heart = 'Yes';
  void _handleHeartStateChange(int value) {
    setState(() {
      _heartState = value;

      switch (_heartState) {
        case 0:
          _heart = 'Yes';
          break;
        case 1:
          _heart = 'No';
          break;
      }
    });
  }

  int _lungState = 0;
  String _lung = 'Yes';
  void _handleLungStateChange(int value) {
    setState(() {
      _lungState = value;

      switch (_lungState) {
        case 0:
          _lung = 'Yes';
          break;
        case 1:
          _lung = 'No';
          break;
      }
    });
  }

  int _diabetesState = 0;
  String _diabetes = 'Yes';
  void _handleDiabetesStateChange(int value) {
    setState(() {
      _diabetesState = value;

      switch (_diabetesState) {
        case 0:
          _diabetes = 'Yes';
          break;
        case 1:
          _diabetes = 'No';
          break;
      }
    });
  }

  int _feverState = 0;
  String _fever = 'Yes';
  void _handleFeverStateChange(int value) {
    setState(() {
      _feverState = value;

      switch (_feverState) {
        case 0:
          _fever = 'Yes';
          break;
        case 1:
          _fever = 'No';
          break;
      }
    });
  }

  int _coughState = 0;
  String _cough = 'Yes';
  void _handleCoughStateChange(int value) {
    setState(() {
      _coughState = value;

      switch (_coughState) {
        case 0:
          _cough = 'Yes';
          break;
        case 1:
          _cough = 'No';
          break;
      }
    });
  }

  int _breatheState = 0;
  String _breathe = 'Yes';
  void _handleBreatheStateChange(int value) {
    setState(() {
      _breatheState = value;

      switch (_breatheState) {
        case 0:
          _breathe = 'Yes';
          break;
        case 1:
          _breathe = 'No';
          break;
      }
    });
  }

  int _chestState = 0;
  String _chest = 'Yes';
  void _handleChestStateChange(int value) {
    setState(() {
      _chestState = value;

      switch (_chestState) {
        case 0:
          _chest = 'Yes';
          break;
        case 1:
          _chest = 'No';
          break;
      }
    });
  }

  int _contactState = 0;
  String _contact = 'Yes';
  void _handleContactStateChange(int value) {
    setState(() {
      _contactState = value;

      switch (_contactState) {
        case 0:
          _contact = 'Yes';
          break;
        case 1:
          _contact = 'No';
          break;
      }
    });
  }

  // TextField Controllers
  TextEditingController ageController = TextEditingController();
  TextEditingController traveledcountryController = TextEditingController();
  TextEditingController coronapatientController = TextEditingController();

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition=Position(latitude: 23.7156298, longitude: 90.4896691);
  String _currentAddress = 'Bangladesh';
  _getCurrentLocation() {
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

  int travelState = 0;
  int getDecision() {
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
    if (countryMap.containsKey(traveledcountryController.text.toLowerCase())) {
      travelState = countryMap[traveledcountryController.text.toLowerCase()];
    } else {
      travelState = 0;
    }

    if (1-_breatheState <= 0.5) {
      if (1-_feverState <= 0.5) {
        if (1-_chestState <= 0.5) {
          if (int.parse(ageController.text) <= 34.0) {
            if (int.parse(ageController.text) <= 31.0) {
              return 0;
            } else {
              return 2;
            }
          } else {
            return 0;
          }
        } else {
          if (1-travelState <= 7.5) {
            return 1;
          } else {
            if (1-travelState <= 11.0) {
              return 0;
            } else {
              return 2;
            }
          }
        }
      } else {
        if (1-_contactState <= 0.5) {
          if (1-_chestState <= 0.5) {
            return 2;
          } else {
            if (1-_coughState <= 0.5) {
              return 2;
            } else {
              if (1-_sexState <= 0.5) {
                return 2;
              } else {
                if (1-_lungState <= 0.5) {
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
      if (1-_contactState <= 0.5) {
        if (1-_chestState <= 0.5) {
          if (int.parse(ageController.text) <= 65.5) {
            if (1-_feverState <= 0.5) {
              return 2;
            } else {
              if (int.parse(ageController.text) <= 31.0) {
                if (int.parse(ageController.text) <= 27.0) {
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
          if (int.parse(ageController.text) <= 37.0) {
            if (1-_lungState <= 0.5) {
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
int decision=2;
  Future navigateToPrdictPage(context) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>  PredictionPage(decision)));
  }

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    _getCurrentLocation();
    // Validate returns true if the form is valid, or false
    // otherwise.
    // while(_currentAddress.length==0){
    //print(_currentAddress);
    // }
    
    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.
      decision = getDecision();
      String disease = "";
      if (decision == 0) {
        disease = "Cold";
      } else if (decision == 1) {
        disease = "Corona";
      } else {
        disease = "Flu";
      }
      FeedbackForm feedbackForm = FeedbackForm(
          ageController.text,
          _sex,
          _heart,
          _lung,
          _diabetes,
          _fever,
          _cough,
          _breathe,
          _chest,
          _contact,
          traveledcountryController.text,
          _currentPosition.toString(),
          disease);

      FormController formController = FormController((String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          _showSnackbar("Feedback Submitted");
          navigateToPrdictPage(context);
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      });

      _showSnackbar("Submitting Feedback");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm);
      
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: new SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextFormField(
                            controller: ageController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Your Age';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration:
                                InputDecoration(labelText: 'Enter Your Age'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Enter your sex: '),
                              Radio(
                                value: 0,
                                groupValue: _sexState,
                                onChanged: _handleSexStateChange,
                              ),
                              Text('Male'),
                              Radio(
                                value: 1,
                                groupValue: _sexState,
                                onChanged: _handleSexStateChange,
                              ),
                              Text('Female'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Do you have heart disease? '),
                              Radio(
                                value: 0,
                                groupValue: _heartState,
                                onChanged: _handleHeartStateChange,
                              ),
                              Text('Yes'),
                              Radio(
                                value: 1,
                                groupValue: _heartState,
                                onChanged: _handleHeartStateChange,
                              ),
                              Text('No'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Do you have lung disease? '),
                              Radio(
                                value: 0,
                                groupValue: _lungState,
                                onChanged: _handleLungStateChange,
                              ),
                              Text('Yes'),
                              Radio(
                                value: 1,
                                groupValue: _lungState,
                                onChanged: _handleLungStateChange,
                              ),
                              Text('No'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Do you have diabetes? '),
                              Radio(
                                value: 0,
                                groupValue: _diabetesState,
                                onChanged: _handleDiabetesStateChange,
                              ),
                              Text('Yes'),
                              Radio(
                                value: 1,
                                groupValue: _diabetesState,
                                onChanged: _handleDiabetesStateChange,
                              ),
                              Text('No'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Do you have fever? '),
                              Radio(
                                value: 0,
                                groupValue: _feverState,
                                onChanged: _handleFeverStateChange,
                              ),
                              Text('Yes'),
                              Radio(
                                value: 1,
                                groupValue: _feverState,
                                onChanged: _handleFeverStateChange,
                              ),
                              Text('No'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Do you have heart cough? '),
                              Radio(
                                value: 0,
                                groupValue: _coughState,
                                onChanged: _handleCoughStateChange,
                              ),
                              Text('Yes'),
                              Radio(
                                value: 1,
                                groupValue: _coughState,
                                onChanged: _handleCoughStateChange,
                              ),
                              Text('No'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Do you have shortness of breathe? '),
                              Radio(
                                value: 0,
                                groupValue: _breatheState,
                                onChanged: _handleBreatheStateChange,
                              ),
                              Text('Yes'),
                              Radio(
                                value: 1,
                                groupValue: _breatheState,
                                onChanged: _handleBreatheStateChange,
                              ),
                              Text('No'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Do you have pressure in the chest? '),
                              Radio(
                                value: 0,
                                groupValue: _chestState,
                                onChanged: _handleChestStateChange,
                              ),
                              Text('Yes'),
                              Radio(
                                value: 1,
                                groupValue: _chestState,
                                onChanged: _handleChestStateChange,
                              ),
                              Text('No'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Any contact with corono patient? '),
                              Radio(
                                value: 0,
                                groupValue: _contactState,
                                onChanged: _handleContactStateChange,
                              ),
                              Text('Yes'),
                              Radio(
                                value: 1,
                                groupValue: _contactState,
                                onChanged: _handleContactStateChange,
                              ),
                              Text('No'),
                            ],
                          ),
                          TextFormField(
                            controller: traveledcountryController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter your last traveled country?';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Enter your last traveled country?',
                            ),
                          ),
                        ],
                      ),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //   RaisedButton(
                    //   textColor: Colors.white,
                    //   color: Colors.redAccent,
                    //   child: Text('Back'),
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                    // Text(' '),
                    RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      onPressed: _submitForm,
                      child: Text('Submit Feedback'),
                      
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

