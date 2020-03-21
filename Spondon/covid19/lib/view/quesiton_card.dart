import 'package:covid19/controller/form_controller.dart';
import 'package:covid19/model/form.dart';
import 'package:covid19/view/predict.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class QuestionCard extends StatefulWidget {
  final FeedbackForm feedbackForm;
  final String type;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final PageController controller;
  final _kDuration = const Duration(milliseconds: 300);
  final _kCurve = Curves.decelerate;
  final bool language;

  QuestionCard({
    @required this.feedbackForm,
    @required this.type,
    @required this.scaffoldKey,
    @required this.controller,
    @required this.language,
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

  @override
  void dispose() {
    super.dispose();
  }

  final Geolocator geolocator = Geolocator() ;

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

  int flag = 1;
  List<String> countries = [
    'Not Applicable',
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

  List<String> bangla_countries = [
    'প্রযোজ্য নয়',
    'আফগানিস্তান',
    'এল্যান্ড দ্বীপপুঞ্জ',
    'আলবেনিয়া',
    'আলজেরিয়া',
    'আমেরিকান সামোয়া',
    'এ্যান্ডোরা',
    'অ্যাঙ্গোলা',
    'এ্যাঙ্গুইলা',
    'এন্টার্কটিকা',
    'অ্যান্টিগুয়া ও বার্বুডা',
    'আর্জেন্টিনা',
    'আর্মেনিয়া',
    'আরুবা',
    'অস্ট্রেলিয়া',
    'অস্ট্রিয়া',
    'আজারবাইজান',
    'বাহামা',
    'বাহরাইন',
    'বাংলাদেশ',
    'বার্বাডোস',
    'বেলারুশ',
    'বেলজিয়াম',
    'বেলিজ',
    'বেনিন',
    'বারমুডা',
    'ভুটান',
    'বলিভিয়া',
    'বনারে',
    'বসনিয়া ও হার্জেগোভিনা',
    'বতসোয়ানা',
    'বুভেট আইল্যান্ড',
    'ব্রাজিল',
    'ব্রিটিশ ভারত মহাসাগর অঞ্চল',
    'ব্রুনাই দারুসসালাম',
    'বুলগেরিয়া',
    'বুর্কিনা ফাসো',
    'বুরুন্ডি',
    'কাম্বোজ',
    'ক্যামেরুন',
    'কানাডা',
    'কেপ ভার্দে',
    'কেম্যান দ্বীপপুঞ্জ',
    'মধ্য আফ্রিকান প্রজাতন্ত্র',
    'চাদ',
    'চিলি',
    'চীন',
    'ক্রিস্টমাস দ্বীপ',
    'কোকোস (কিলিং) দ্বীপপুঞ্জ',
    'কলম্বিয়া',
    'কমোরোস',
    'কঙ্গো',
    ' "কঙ্গো',
    'কুক দ্বীপপুঞ্জ',
    'কোস্টারিকা',
    'কোট ডি \' আইভায়ার ',
    'ক্রোয়েশিয়া',
    'কিউবা',
    'কিউরাসাও',
    'সাইপ্রাস',
    'চেক প্রজাতন্ত্র',
    'ডেনমার্ক',
    'জিবুতি',
    'ডোমিনিকা',
    'ডোমিনিকান প্রজাতন্ত্র',
    'ইকুয়েডর',
    'মিশর',
    'এল সালভাদর',
    'নিরক্ষীয় গিনি',
    'ইরিত্রিয়া',
    'এস্তোনিয়া',
    'ইথিওপিয়া',
    'ফকল্যান্ড দ্বীপপুঞ্জ (মালভিনাস)',
    'ফারো দ্বীপপুঞ্জ',
    'ফিজি',
    'ফিন্ল্যাণ্ড',
    'ফ্রান্স',
    'ফরাসি গায়ানা',
    'ফরাসি পলিনেশিয়া',
    'ফরাসি সাউদার্ন টেরিটোরিজ',
    'গ্যাবন',
    'গাম্বিয়া',
    'জর্জিয়া',
    'জার্মানি',
    'ঘানা',
    'জিব্রাল্টার',
    'গ্রীস',
    'গ্রীনল্যান্ড',
    'গ্রেনাডা',
    'গুয়াডেলোপ',
    'গুয়াম',
    'গুয়াতেমালা',
    'গ্রাঞ্জি',
    'গিনি',
    'গিনি-বিসাউ',
    'গায়ানা',
    'হাইতি',
    'হন্ডুরাস',
    'হংকং',
    'হাঙ্গেরি',
    'আইসলণ্ড',
    'ভারত',
    'ইন্দোনেশিয়া',
    'ইরান',
    'ইরাক',
    'আয়ারল্যান্ড',
    'আইল অফ ম্যান',
    'ইস্রায়েল',
    'ইতালি',
    'জামাইকা',
    'জাপান',
    'জার্সি',
    'জর্ডান',
    'কাজাকস্থান',
    'কেনিয়া',
    'কিরিবাতি',
    'উত্তর কোরিয়া',
    'দক্ষিণ কোরিয়া',
    'কুয়েত',
    'কিরগিজস্তান',
    'লাও পিপলস ডেমোক্রেটিক রিপাবলিক',
    'লাত্ভিয়া',
    'লেবানন',
    'লেসোথো',
    'লাইবেরিয়া',
    'লিবিয়া',
    'লিচেনস্টেইন',
    'লিত্ভা',
    'লাক্সেমবার্গ',
    'ম্যাকাও',
    'ম্যাসাডোনিয়া',
    'মাদাগাস্কার',
    'মালাউই',
    'মাল্যাশিয়া',
    'মালদ্বীপের',
    'মালি',
    'মাল্টা',
    'মার্শাল দ্বীপপুঞ্জ',
    'মার্টিনিক',
    'মরিতানিয়া',
    'মরিশাস',
    'মায়োত্তে',
    'মেক্সিকো',
    'মাইক্রোনেশিয়া',
    'মোল্দাভিয়া',
    'মোনাকো',
    'মঙ্গোলিয়া',
    'মন্টিনিগ্রো',
    'মন্টসেরাট',
    'মরক্কো',
    'মোজাম্বিক',
    'মায়ানমার',
    'নামিবিয়া',
    'নাউরু',
    'নেপাল',
    'নেদারল্যান্ডস',
    'নতুন ক্যালেডোনিয়া',
    'নিউজিল্যান্ড',
    'নিকারাগুয়া',
    'নাইজার',
    'নাইজেরিয়া',
    'নিউই',
    'নরফোক দ্বীপ',
    'উত্তর মারিয়ানা দ্বীপপুঞ্জ',
    'নরওয়ে',
    'ওমান',
    'পাকিস্তান',
    'পালাউ',
    'ফিলিস্তিন',
    'পানামা',
    'পাপুয়া নিউ গিনি',
    'প্যারাগুয়ে',
    'পেরু',
    'ফিলিপাইন',
    'পিটকেয়ার্ন',
    'পোল্যান্ড',
    'পর্তুগাল',
    'পুয়ের্তো রিকো',
    'কাতার',
    'রিইউনিয়ন',
    'রুমানিয়া',
    'রাশিয়ান ফেডারেশন',
    'রুয়ান্ডা',
    'সেন্ট বার্থলেমি',
    'সেন্ট হেলেনা ',
    'সেন্ট কিটস ও নেভিস',
    'সেন্ট লুসিয়া',
    'সেন্ট মার্টিন (ফরাসী অংশ)',
    'সেন্ট পিয়েরি এবং মিকুয়েলন',
    'সেন্ট ভিনসেন্ট ও গ্রেনাডাইন দ্বীপপুঞ্জ',
    'সামোয়া',
    'সান মারিনো',
    'সাও টোমে এবং প্রিনসিপে',
    'সৌদি আরব',
    'সেনেগাল',
    'সার্বিয়া',
    'সিসিলি',
    'সিয়েরা লিওন',
    'সিঙ্গাপুর',
    'সিন্ট মার্টেন (ডাচ অংশ)',
    'শ্লোভাকিয়া',
    'স্লোভানিয়া',
    'সলোমান দ্বীপপুঞ্জ',
    'সোমালিয়া',
    'দক্ষিন আফ্রিকা',
    'দক্ষিণ জর্জিয়া এবং দক্ষিণ স্যান্ডউইচ দ্বীপপুঞ্জ',
    'দক্ষিণ সুদান',
    'স্পেন',
    'শ্রীলংকা',
    'সুদান',
    'সুরিনাম',
    'সোয়ালবার্ড এবং জান মায়েন',
    'সোয়াজিল্যান্ড',
    'সুইডেন',
    'সুইজারল্যান্ড',
    'সিরিয় আরব প্রজাতন্ত্র',
    'তাইওয়ান',
    'তাজিকিস্তান',
    'তাঞ্জানিয়া',
    'থাইল্যান্ডের',
    'পূর্ব তিমুর',
    'যাও',
    'টোকেলাউ',
    'টোঙ্গা',
    'ত্রিনিদাদ ও টোবাগো',
    'টিউনিস্',
    'তুরস্ক',
    'তুর্কমেনিয়া',
    'টার্কস্ ও কেইকোস দ্বীপপুঞ্জ',
    'টুভালু',
    'উগান্ডা',
    'ইউক্রেইন',
    'সংযুক্ত আরব আমিরাত',
    'যুক্তরাজ্য',
    'যুক্তরাষ্ট্র',
    'মার্কিন যুক্তরাষ্ট্র ক্ষুদ্র ও পার্শ্ববর্তী দ্বীপপুঞ্জ',
    'উরুগুয়ে',
    'উজ্বেকিস্থান',
    'ভানুয়াতু',
    'ভেনেজুয়েলা',
    'ভিয়েতনাম',
    'ইমেন',
    'জাম্বিয়া',
    'জিম্বাবুয়ে',
  ];

  Widget age(bool language) {
    List<String> ages = [];
    for (int i = 0; i < 150; i++) {
      ages.add(i.toString());
    }
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(language == false ? 'I am' : 'আমি'),
          new DropdownButton<String>(
            value: _selectedAge,
            hint: Text(
              language == false
                  ? 'Select Your Age'
                  : 'আপনার বয়স নির্বাচন করুন',
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

  Widget sex(bool language) {
    List<String> gender = ['Male', 'Female', 'Other'];
    List<String> bnGender = ['পুরুষ', 'মহিলা', 'অন্যান্য'];
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(language == false ? 'I am' : 'আমি'),
          new DropdownButton<String>(
            value: _selectedGender,
            hint: Text(
              language == false ? 'Select Your Gender' : 'আপনার লিঙ্গ নির্বাচন',
              style: TextStyle(fontSize: 20),
            ),
            items: (language == false ? gender : bnGender).map((String value) {
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
                widget.feedbackForm.sex = language == false
                    ? _selectedGender
                    : gender[bnGender.indexOf(_selectedGender)];
                print(widget.feedbackForm.toParams());
              });
            },
          )
        ]);
  }

  Widget heartDisease(bool language) {
    List<String> submit = ['Yes', 'No'];
    List<String> bnSubmit = ['হ্যাঁ', 'না'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(language == false
            ? 'Do you have heart disease?'
            : 'আপনার কি হৃদরোগ আছে?'),
        new DropdownButton<String>(
          value: _heart,
          hint: Text(
            language == false ? 'Select yes/no' : 'হ্যাঁ / না নির্বাচন করুন',
            style: TextStyle(fontSize: 20),
          ),
          items: (language == false ? submit : bnSubmit).map((String value) {
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
              widget.feedbackForm.heartdisease =
                  language == false ? _heart : submit[bnSubmit.indexOf(_heart)];
              print(widget.feedbackForm.toParams());
            });
          },
        )
      ],
    );
  }

  Widget lungDisease(bool language) {
    List<String> submit = ['Yes', 'No'];

    List<String> bnSubmit = ['হ্যাঁ', 'না'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(language == false
            ? 'Do you have lung disease?'
            : 'আপনার কি ফুসফুসের রোগ আছে?'),
        new DropdownButton<String>(
          value: _lung,
          hint: Text(
            language == false ? 'Select yes/no' : 'হ্যাঁ / না নির্বাচন করুন',
            style: TextStyle(fontSize: 20),
          ),
          items: (language == false ? submit : bnSubmit).map((String value) {
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
              widget.feedbackForm.lungdisease =
                  language == false ? _lung : submit[bnSubmit.indexOf(_lung)];
            });
          },
        )
      ],
    );
  }

  Widget diabetes(bool language) {
    List<String> submit = ['Yes', 'No'];
    List<String> bnSubmit = ['হ্যাঁ', 'না'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(language == false
            ? 'Do you have diabetes?'
            : 'আপনার কি ডায়াবেটিস আছে?'),
        new DropdownButton<String>(
          value: _diabetes,
          hint: Text(
            language == false ? 'Select yes/no' : 'হ্যাঁ / না নির্বাচন করুন',
            style: TextStyle(fontSize: 20),
          ),
          items: (language == false ? submit : bnSubmit).map((String value) {
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
              widget.feedbackForm.diabetes = language == false
                  ? _diabetes
                  : submit[bnSubmit.indexOf(_diabetes)];
            });
          },
        )
      ],
    );
  }

//done till here

  Widget fever(bool language) {
    List<String> submit = ['Yes', 'No'];
    List<String> bnSubmit = ['হ্যাঁ', 'না'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(language == false ? 'Do you have fever?' : 'আপনার জ্বর আছে'),
        new DropdownButton<String>(
          value: _fever,
          hint: Text(
            language == false ? 'Select yes/no' : 'হ্যাঁ / না নির্বাচন করুন',
            style: TextStyle(fontSize: 20),
          ),
          items: (language == false ? submit : bnSubmit).map((String value) {
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
              widget.feedbackForm.fever =
                  language == false ? _fever : submit[bnSubmit.indexOf(_fever)];
            });
          },
        )
      ],
    );
  }

  Widget cough(bool language) {
    List<String> submit = ['Yes', 'No'];
    List<String> bnSubmit = ['হ্যাঁ', 'না'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(language == false ? 'Do you have cough?' : 'আপনার কাশি আছে?'),
        new DropdownButton<String>(
          value: _cough,
          hint: Text(
            language == false ? 'Select yes/no' : 'হ্যাঁ / না নির্বাচন করুন',
            style: TextStyle(fontSize: 20),
          ),
          items: (language == false ? submit : bnSubmit).map((String value) {
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
              widget.feedbackForm.cough =
                  language == false ? _cough : submit[bnSubmit.indexOf(_cough)];
            });
          },
        )
      ],
    );
  }

  Widget sob(bool language) {
    List<String> submit = ['Yes', 'No'];

    List<String> bnSubmit = ['হ্যাঁ', 'না'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(language == false
            ? 'Do you have shortness of breath?'
            : 'আপনার কি শ্বাসকষ্ট আছে?'),
        new DropdownButton<String>(
          value: _sob,
          hint: Text(
            language == false ? 'Select yes/no' : 'হ্যাঁ / না নির্বাচন করুন',
            style: TextStyle(fontSize: 20),
          ),
          items: (language == false ? submit : bnSubmit).map((String value) {
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
              widget.feedbackForm.shortnessofbreathe =
                  language == false ? _sob : submit[bnSubmit.indexOf(_sob)];
            });
          },
        )
      ],
    );
  }

  Widget pic(bool language) {
    List<String> submit = ['Yes', 'No'];

    List<String> bnSubmit = ['হ্যাঁ', 'না'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(language == false
            ? 'Do you have pressure in chest?'
            : 'তোমার বুকে চাপ আছে?'),
        new DropdownButton<String>(
          value: _pic,
          hint: Text(
            language == false ? 'Select yes/no' : 'হ্যাঁ / না নির্বাচন করুন',
            style: TextStyle(fontSize: 20),
          ),
          items: (language == false ? submit : bnSubmit).map((String value) {
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
              widget.feedbackForm.pressureinthechest =
                  language == false ? _pic : submit[bnSubmit.indexOf(_pic)];
            });
          },
        )
      ],
    );
  }

  Widget cc(bool language) {
    List<String> submit = ['Yes', 'No'];

    List<String> bnSubmit = ['হ্যাঁ', 'না'];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          language == false
              ? 'Did you have close contact\n with corona patient?'
              : 'আপনার কি করোনার রোগীর সাথে\n ঘনিষ্ঠ যোগাযোগ ছিল?',
          textAlign: TextAlign.center,
        ),
        new DropdownButton<String>(
          value: _cc,
          hint: Text(
            language == false ? 'Select yes/no' : 'হ্যাঁ / না নির্বাচন করুন',
            style: TextStyle(fontSize: 20),
          ),
          items: (language == false ? submit : bnSubmit).map((String value) {
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
              widget.feedbackForm.closecontactwithcoronapatient =
                  language == false ? _cc : submit[bnSubmit.indexOf(_cc)];
            });
          },
        )
      ],
    );
  }

  Widget tc(bool language) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          language == false
              ? 'Have you been outside\n of the country?'
              : 'আপনি কি দেশের বাইরে ছিলেন?',
          textAlign: TextAlign.center,
        ),
        new DropdownButton<String>(
          value: _tc,
          hint: Text(
            language == false ? 'Select country' : 'দেশ নির্বাচন করুন',
            style: TextStyle(fontSize: 15),
          ),
          items: (language == false ? countries : bangla_countries)
              .map((String value) {
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
              widget.feedbackForm.traveledcountry = language == false
                  ? _tc
                  : countries[bangla_countries.indexOf(_tc)];
              print(widget.feedbackForm.toParams());
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

    var countryMap = {
      'china': 2,
      'singapore': 2,
      'usa': 2,
      'south korea': 1,
      'italy': 2,
      'germany': 2,
      'switzerland': 1,
      'spain': 2,
      'thailand': 2,
      'egypt': 1,
      'belgium': 1,
      'lebanon': 1,
      'iraq': 1,
      'iran': 2,
      'afganistan': 1,
      'kuwait': 2,
      'algeria': 1,
      'austria': 1,
      'nepal': 1,
      'malaysia': 2,
      'sri lanka': 1,
      'india': 1,
      'sweden': 1,
      'canada': 1,
      'netherlands': 1,
      'brazil': 1,
      'greece': 1,
      'israel': 1,
      'russia': 1,
      'chile': 1,
      'mexico': 1,
      'belarus': 1,
      'cyprus': 1,
      'turkey': 1,
      'honduras': 1,
      'kenya': 1,
      'uk': 2,
      'costa rica': 1,
      'armenia': 1,
      'ecuador': 1,
      'bosnia': 1,
      'azerbaijan': 1,
      'peru': 1,
      'panama': 1,
      'bulgeria': 1,
      'portugal': 1,
      'sindh': 2,
      'taftan': 2,
      'saudia srabia': 2,
      'dubai': 2,
    };
    if (countryMap.containsKey(tc.toLowerCase())) {
      travelState = countryMap[tc.toLowerCase()];
    } else {
      travelState = 0;
    }

    print(travelState);
    int score = travelState;
    if (_breatheState == 1) {
      score += 1;
    }
    if (_feverState == 1) {
      score += 1;
    }
    if (_coughState == 1) {
      score += 1;
    }
    if (_contactState == 1) {
      score += 3;
    }
    if (_lungState == 1) {
      score += 1;
    }
    if (_chestState == 1) {
      score += 1;
    }
    if (score <= 3) {
      return -1;
    } else if (score >= 3 && score <= 4) {
      return 0;
    } else if (score >= 5 && score <= 6) {
      return 2;
    } else
      return 1;

/*
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
    }*/
  }

  int decision = 0;

  Widget submit(bool language) {
    _getCurrentLocation();

    return Container(
      child: Center(
          child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        language == false
                            ? 'Submit Your Response \n and please wait for result'
                            : 'আপনার প্রতিক্রিয়া জমা দিন\nএবং দয়া করে ফলাফলের জন্য অপেক্ষা করুন',
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
                         _getCurrentLocation();
                        setState(() {
                          flag = 0;
                        });
                        print(flag);
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
                        String disease="";
                        if(decision==--1){
                          disease="Ok";
                        }
                        else if(disease==0){
                          disease="flu";
                        }
                        else if(disease==1){
                          disease="corona";
                        }
                        else{
                          disease="cold";
                        }
                        widget.feedbackForm.coronapatient=disease;
                        widget.feedbackForm.currentaddress=_currentPosition.toString();
                        FormController formController =
                            FormController((String response) {
                          print("Response: $response");
                          if (response == FormController.STATUS_SUCCESS) {
                            // Feedback is saved succesfully in Google Sheets.

                            setState(() {
                              flag = 1;
                            });
                            _showSnackbar("Feedback Submitted");
                          
                          } else {
                            // Error Occurred while saving data in Google Sheets.
                            _showSnackbar(
                                "Error Occured during Submission. Please try again.");
                            Navigator.pop(context);
                          }
                        });

                        // Submit 'feedbackForm' and save it in Google Sheets.
                        
                        formController.submitForm(widget.feedbackForm);
                        Navigator.pushReplacementNamed(context, '/predict',
                            arguments: [decision, language]);
                      },
                      child: Container(
                          height: 50,
                          width: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(language == false ? 'Submit' : 'জমা দিন',
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

  Widget getWidgetByCatagory(bool language) {
    switch (widget.type) {
      case "age":
        return Container(
          child: age(language),
        );
      case "sex":
        return Container(
          child: sex(language),
        );
      case "hd":
        return Container(
          child: heartDisease(language),
        );
      case "ld":
        return Container(
          child: lungDisease(language),
        );
      case "db":
        return Container(
          child: diabetes(language),
        );
      case "fever":
        return Container(
          child: fever(language),
        );
      case "cough":
        return Container(
          child: cough(language),
        );
      case "sob":
        return Container(
          child: sob(language),
        );
      case "pic":
        return Container(
          child: pic(language),
        );
      case "cc":
        return Container(
          child: cc(language),
        );
      case "tc":
        return Container(
          child: tc(language),
        );
      case "submit":
        return submit(language);
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: flag == 0
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  getWidgetByCatagory(widget.language),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0),
                            ),
                            onPressed: () {
                              if (widget.type == 'age') {
                                if (widget.feedbackForm.age == "Unspecified") {
                                  _showSnackbar('Please Select age');
                                } else {
                                  widget.controller.nextPage(
                                      duration: widget._kDuration,
                                      curve: widget._kCurve);
                                }
                              } else if (widget.type == 'sex') {
                                if (widget.feedbackForm.sex == "Unspecified") {
                                  _showSnackbar('Please Select Gender');
                                } else {
                                  widget.controller.nextPage(
                                      duration: widget._kDuration,
                                      curve: widget._kCurve);
                                }
                              } else if (widget.type == 'hd') {
                                if (widget.feedbackForm.heartdisease ==
                                    "Unspecified") {
                                  _showSnackbar('Please Select An Option');
                                } else {
                                  widget.controller.nextPage(
                                      duration: widget._kDuration,
                                      curve: widget._kCurve);
                                }
                              } else if (widget.type == 'ld') {
                                if (widget.feedbackForm.lungdisease ==
                                    "Unspecified") {
                                  _showSnackbar('Please Select An Option');
                                } else {
                                  widget.controller.nextPage(
                                      duration: widget._kDuration,
                                      curve: widget._kCurve);
                                }
                              } else if (widget.type == 'db') {
                                if (widget.feedbackForm.diabetes ==
                                    "Unspecified") {
                                  _showSnackbar('Please Select An Option');
                                } else {
                                  widget.controller.nextPage(
                                      duration: widget._kDuration,
                                      curve: widget._kCurve);
                                }
                              } else if (widget.type == 'fever') {
                                if (widget.feedbackForm.fever ==
                                    "Unspecified") {
                                  _showSnackbar('Please Select An Option');
                                } else {
                                  widget.controller.nextPage(
                                      duration: widget._kDuration,
                                      curve: widget._kCurve);
                                }
                              } else if (widget.type == 'cough') {
                                if (widget.feedbackForm.cough ==
                                    "Unspecified") {
                                  _showSnackbar('Please Select An Option');
                                } else {
                                  widget.controller.nextPage(
                                      duration: widget._kDuration,
                                      curve: widget._kCurve);
                                }
                              } else if (widget.type == 'sob') {
                                if (widget.feedbackForm.shortnessofbreathe ==
                                    "Unspecified") {
                                  _showSnackbar('Please Select An Option');
                                } else {
                                  widget.controller.nextPage(
                                      duration: widget._kDuration,
                                      curve: widget._kCurve);
                                }
                              } else if (widget.type == 'pic') {
                                if (widget.feedbackForm.pressureinthechest ==
                                    "Unspecified") {
                                  _showSnackbar('Please Select An Option');
                                } else {
                                  widget.controller.nextPage(
                                      duration: widget._kDuration,
                                      curve: widget._kCurve);
                                }
                              } else if (widget.type == 'cc') {
                                if (widget.feedbackForm
                                        .closecontactwithcoronapatient ==
                                    "Unspecified") {
                                  _showSnackbar('Please Select An Option');
                                } else {
                                  widget.controller.nextPage(
                                      duration: widget._kDuration,
                                      curve: widget._kCurve);
                                }
                              } else {
                                if (widget.feedbackForm.traveledcountry ==
                                    "Unspecified") {
                                  _showSnackbar('Please Select An Option');
                                } else {
                                  widget.controller.nextPage(
                                      duration: widget._kDuration,
                                      curve: widget._kCurve);
                                }
                              }
                            },
                            child: Text(
                                widget.language == false ? 'Next' : 'পরবর্তী'),
                          ),
                        ],
                      ))
                ],
              ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(const Radius.circular(35.0))),
        height: MediaQuery.of(context).size.height * .6,
        width: MediaQuery.of(context).size.width * .8);
  }
}
