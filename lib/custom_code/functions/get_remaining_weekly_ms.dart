import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int getRemainingWeeklyMs() {
  DateTime now = DateTime.now();
  // চলতি সপ্তাহের শেষ দিন (রবিবার রাত ২৩:৫৯:৫৯)
  int daysUntilSunday = 7 - now.weekday;

  DateTime nextSundayEnd = DateTime(
    now.year,
    now.month,
    now.day,
    23,
    59,
    59,
  ).add(Duration(days: daysUntilSunday));

  int remainingMs = nextSundayEnd.difference(now).inMilliseconds;

  return remainingMs > 0 ? remainingMs : 1000;
}
