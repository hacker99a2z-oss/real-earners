import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _userCoins = 100000;
  int get userCoins => _userCoins;
  set userCoins(int value) {
    _userCoins = value;
  }

  int _referralcount = 0;
  int get referralcount => _referralcount;
  set referralcount(int value) {
    _referralcount = value;
  }

  int _adswatched = 3;
  int get adswatched => _adswatched;
  set adswatched(int value) {
    _adswatched = value;
  }

  int _userbalance = 0;
  int get userbalance => _userbalance;
  set userbalance(int value) {
    _userbalance = value;
  }

  bool _isbonusgiven = false;
  bool get isbonusgiven => _isbonusgiven;
  set isbonusgiven(bool value) {
    _isbonusgiven = value;
  }

  bool _isTimerRunning = false;
  bool get isTimerRunning => _isTimerRunning;
  set isTimerRunning(bool value) {
    _isTimerRunning = value;
  }
}
