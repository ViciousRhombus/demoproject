import 'package:animate_do/animate_do.dart';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:provider/provider.dart';
import 'package:multiselect/multiselect.dart';

import '../Constants/const_widget.dart';
import 'Providers/artist_questionnaire_provider.dart';

class ArtistQuestionnaire extends StatefulWidget {
  const ArtistQuestionnaire({super.key});

  @override
  ArtistQuestionnaireState createState() => ArtistQuestionnaireState();
}

class ArtistQuestionnaireState extends State<ArtistQuestionnaire> {
  static const Color greyColor2 = AppConst.greyColor2;
  static const Color greyColor = AppConst.greyColor;
  static const Color greyColor1 = AppConst.greyColor1;
  static const Color violetColor = AppConst.violetColor;
  static const Color whiteColor = AppConst.whiteColor;
  static const Color yellowColor = AppConst.yellowColor;
  static const Color blackColor = AppConst.blackColor;
  static const Color tealColor = AppConst.tealColor;
  static const Color seagreenColor = AppConst.seagreenColor;
  static const Color seablueColor = AppConst.seablueColor;
  static const String fontMontserrat = AppConst.fontMontserrat;
  static const String fontPacifico = AppConst.fontPacifico;
  static const String fontBorel = AppConst.fontBorel;

  final List<String> _languages = [
    'Hindi',
    'English',
    'Punjabi',
    'Gujarati',
    'Marathi',
    'Bangali',
    'Kannada',
    'Tamil',
    'Telugu',
    'Bhojpuri',
    'Rajasthani'
  ];
  final _artistDropdownMenuItems = [
    'Singer',
    'Comedian',
    'Band',
    'Anchor',
    'Musician'
  ];
  final _genderDropdownMenuItems = [
    'Male',
    'Female',
    'Other',
    'Prefer not to say'
  ];
  final List<String> _singerLanguages = [
    'Hindi',
    'English',
    'Punjabi',
    'Gujarati',
    'Marathi',
    'Bangali',
    'Kannada',
    'Tamil',
    'Telugu',
    'Bhojpuri',
    'Rajasthani'
  ];
  final List<String> _bandType = ['Duo Band', 'Tri Band', 'Full Band'];
  final List<String> _comedianType = [
    'Stand-up Comedian',
    'Mimicry Artist',
  ];
  TextEditingController nameController = TextEditingController();
  final List<String> _musicianType = [
    'Saxophone',
    'Flute',
    'Violin',
    'Piano',
    'Sitar',
    'Tabla',
    'Dhol',
    'Dholak',
    'Percussionist',
    'Drummer',
    'Guitarist'
  ];
  String? dropdown1;
  String? dropdown2;

  List<String> selectedLanguages = [];
  final TextEditingController _dateController = TextEditingController();
  final PageController _pageController = PageController();

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() {
        _dateController.text = picked.toString().split(" ")[0];
      });
    }
  }

  Future<bool> _check(bool ischanged) async {
    return ischanged;
  }

  @override
  Widget build(BuildContext context) {
    print('widget build');
    double aspectRatioMQ = MediaQuery.of(context).size.aspectRatio;
    double widthMQ = MediaQuery.of(context).size.width;
    double heightMQ = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<ArtistQuestionnaireProvider>(
        builder: (context, provider, _) {
          print('consumer build');
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: heightMQ * 0.4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background1.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeInUp(
                            duration: const Duration(seconds: 1),
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeInUp(
                            duration: const Duration(milliseconds: 1200),
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeInUp(
                            duration: const Duration(milliseconds: 1300),
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeInUp(
                            duration: const Duration(milliseconds: 1600),
                            child: Container(
                              margin: EdgeInsets.only(top: heightMQ * 0.16),
                              child: const Center(
                                child: Text(
                                  "Create Profile",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: fontBorel),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                FadeInUp(
                  duration: const Duration(milliseconds: 1800),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(05),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: tealColor),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: heightMQ * 0.059,
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: tealColor))),
                                child: DropdownButtonFormField(
                                  style: const TextStyle(
                                      fontFamily: fontMontserrat,
                                      color: blackColor),
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                  hint: const Text('Artist Type'),
                                  value: dropdown1,
                                  onChanged: (value) {
                                    provider.setSelectedArtistType(
                                        value.toString());

                                    dropdown1 = provider.selectedArtistType;
                                    dropdown2 = null;
                                  },
                                  items: _artistDropdownMenuItems.map(
                                    (e) {
                                      return DropdownMenuItem<String?>(
                                          value: e, child: Text(e));
                                    },
                                  ).toList(),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: tealColor))),
                                child: DropdownButtonFormField<String?>(
                                  hint: const Text('Artist Type Question'),
                                  style: const TextStyle(
                                      fontFamily: fontMontserrat,
                                      color: blackColor),
                                  decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                  onChanged: (value) {
                                    if (provider.selectedArtistType ==
                                        'Singer') {
                                      provider
                                          .setSelectedSinger(value.toString());
                                    } else if (provider.selectedArtistType ==
                                        'Band') {
                                      provider
                                          .setSelectedBand(value.toString());
                                    } else if (provider.selectedArtistType ==
                                        'Comedian') {
                                      provider.setSelectedComedian(
                                          value.toString());
                                    } else if (provider.selectedArtistType ==
                                        'Anchor') {
                                      provider
                                          .setSelectedAnchor(value.toString());
                                    } else if (provider.selectedArtistType ==
                                        'Musician') {
                                      provider.setSelectedMusician(
                                          value.toString());
                                    }
                                    dropdown2 = value.toString();
                                  },
                                  value: dropdown2,
                                  items: provider.selectedArtistType == 'Singer'
                                      ? _singerLanguages
                                          .map((e) => DropdownMenuItem<String?>(
                                              value: e, child: Text(e)))
                                          .toList()
                                      : provider.selectedArtistType == 'Band'
                                          ? _bandType
                                              .map((e) =>
                                                  DropdownMenuItem<String?>(
                                                      value: e, child: Text(e)))
                                              .toList()
                                          : provider.selectedArtistType ==
                                                  'Comedian'
                                              ? _comedianType
                                                  .map((e) =>
                                                      DropdownMenuItem<String?>(
                                                          value: e,
                                                          child: Text(e)))
                                                  .toList()
                                              : provider.selectedArtistType ==
                                                      'Anchor'
                                                  ? _singerLanguages
                                                      .map((e) =>
                                                          DropdownMenuItem<String?>(
                                                              value: e,
                                                              child: Text(e)))
                                                      .toList()
                                                  : provider.selectedArtistType ==
                                                          'Musician'
                                                      ? _musicianType
                                                          .map((e) =>
                                                              DropdownMenuItem<
                                                                      String?>(
                                                                  value: e,
                                                                  child:
                                                                      Text(e)))
                                                          .toList()
                                                      : [],
                                ),
                              ),
                              Container(
                                height: heightMQ * 0.05,
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: tealColor))),
                                child: TextField(
                                  style: const TextStyle(
                                      fontFamily: fontMontserrat),
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Name",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[700],
                                          fontFamily: fontMontserrat,
                                          fontSize: aspectRatioMQ * 30)),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: tealColor))),
                                child: CSCPicker(
                                  selectedItemStyle:
                                      TextStyle(fontFamily: fontMontserrat),
                                  dropdownItemStyle:
                                      TextStyle(fontFamily: fontMontserrat),
                                  countrySearchPlaceholder: "Country",
                                  stateSearchPlaceholder: "State",
                                  citySearchPlaceholder: "City",
                                  countryFilter: const [CscCountry.India],
                                  onCountryChanged: (country) {
                                    provider.setSelectedCountry(country);
                                  },
                                  onStateChanged: (state) {
                                    provider.setSelectedState(state);
                                  },
                                  onCityChanged: (city) {
                                    provider.setSelectedCity(city);
                                  },
                                ),
                              ),
                              Container(
                                height: heightMQ * 0.057,
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: tealColor))),
                                child: TextField(
                                    controller: _dateController,
                                    readOnly: true,
                                    onTap: () {
                                      _selectDate();
                                    },
                                    style: const TextStyle(
                                        fontFamily: fontMontserrat),
                                    decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.calendar_today),
                                        hintText: 'Date of Birth',
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                            fontFamily: fontMontserrat))),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: tealColor))),
                                child: DropdownButtonFormField(
                                  style: const TextStyle(
                                      fontFamily: fontMontserrat,
                                      color: blackColor),
                                  decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                  hint: const Text('Gender'),
                                  items: _genderDropdownMenuItems
                                      .map((e) => DropdownMenuItem(
                                          value: e, child: Text(e)))
                                      .toList(),
                                  onChanged: (String? value) {
                                    provider
                                        .setSelectedGender(value.toString());
                                  },
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: tealColor))),
                                child: DropDownMultiSelect(
                                  // selected_values_style: TextStyle(color: Colors.black),
                                  options: _languages,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none),
                                  onChanged: (List<String> x) {
                                    if (x.length <= 3) {
                                      provider.setSelectedLanguages(x);
                                    } else if (x.length > 3) {
                                      x = x.sublist(0, 3);
                                      provider.setSelectedLanguages(x);
                                    }
                                  },
                                  selectedValues: provider.selectedLanguages,
                                  hint: const Text(
                                    'Select languages at most 3',
                                  ),
                                  hintStyle: const TextStyle(
                                      fontFamily: fontMontserrat),
                                ),
                              ),
                              Container(
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              hintText: "Min Charges",
                                              hintStyle: TextStyle(
                                                  fontFamily: fontMontserrat)),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              hintText: "Max Charges",
                                              hintStyle: TextStyle(
                                                  fontFamily: fontMontserrat)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: heightMQ * 0.035,
                        ),
                        GestureDetector(
                          onTap: () {
                            Map<String, dynamic> map = {
                              'selectedArtistType': provider.selectedArtistType,
                              'artistName':
                                  nameController.text.toString().trim(),
                              'country': provider.selectedCountry,
                              'state': provider.selectedState,
                              'city': provider.selectedCity,
                              'dob': _dateController.text.trim(),
                              'gender': provider.selectedGender,
                              'languages': provider.selectedLanguages,
                            };
                            if (provider.selectedArtistType == 'Singer') {
                              map['type'] = provider.singer;
                            } else if (provider.selectedArtistType == 'Band') {
                              map['type'] = provider.band;
                            } else if (provider.selectedArtistType ==
                                'Comedian') {
                              map['type'] = provider.comedian;
                            } else if (provider.selectedArtistType ==
                                'Anchor') {
                              map['type'] = provider.anchor;
                            } else if (provider.selectedArtistType ==
                                'Musician') {
                              map['type'] = provider.musician;
                            }

                            print('user details map is $map');
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(colors: [
                                  tealColor,
                                  Color.fromRGBO(3, 168, 166, 0.46),
                                ])),
                            child: Center(
                              child: Text(
                                "Create account",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: fontMontserrat,
                                    fontSize: aspectRatioMQ * 40),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
