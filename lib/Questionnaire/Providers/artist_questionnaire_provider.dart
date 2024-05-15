import 'package:flutter/material.dart';

class ArtistQuestionnaireProvider extends ChangeNotifier {
  List<String> _selectedLanguages = [];
  String? _selectedCountry = '';
  String? _selectedState = '';
  String? _selectedCity = '';
  String _selectedArtistType = '';
  String _selectedGender = '';

  String get selectedGender => _selectedGender;

  set selectedGender(String value) {
    _selectedGender = value;
  }

  String? _singer = '';
  String? _band = '';
  String? _anchor = '';
  String? _musician = '';
  String? _comedian = '';

  List<String> get selectedLanguages => _selectedLanguages;

  void setSelectedLanguages(List<String> value) {
    _selectedLanguages = value;
    notifyListeners();
  }

  String? get selectedCountry => _selectedCountry;

  String? get selectedState => _selectedState;

  String? get selectedCity => _selectedCity;

  void setSelectedGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  void setSelectedCountry(String? country) {
    _selectedCountry = country;
    notifyListeners();
  }

  void setSelectedState(String? state) {
    _selectedState = state;
    notifyListeners();
  }

  void setSelectedCity(String? city) {
    _selectedCity = city;
    notifyListeners();
  }

  String get selectedArtistType => _selectedArtistType;

  void setSelectedArtistType(String artist) {
    _selectedArtistType = artist;
    notifyListeners();
  }

  String? get singer => _singer;

  String? get band => _band;

  String? get anchor => _anchor;

  String? get musician => _musician;

  String? get comedian => _comedian;

  void setSelectedSinger(String value) {
    _singer = value;
    notifyListeners();
  }

  void setSelectedBand(String value) {
    _band = value;
    notifyListeners();
  }

  void setSelectedAnchor(String value) {
    _anchor = value;
    notifyListeners();
  }

  void setSelectedMusician(String value) {
    _musician = value;
    notifyListeners();
  }

  void setSelectedComedian(String value) {
    _comedian = value;
    notifyListeners();
  }

}
