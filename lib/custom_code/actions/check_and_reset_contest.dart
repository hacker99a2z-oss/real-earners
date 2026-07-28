// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future checkAndResetContest() async {
  final db = FirebaseFirestore.instance;

  // ১. ফায়ারবেস থেকে বর্তমান কনটেস্টের ডাটা আনা
  final contestDoc =
      await db.collection('contest_settings').doc('weekly_contest').get();

  if (contestDoc.exists) {
    DateTime endTime = (contestDoc.data()?['end_time'] as Timestamp).toDate();
    DateTime now = DateTime.now();

    // ২. যদি বর্তমান সময় ফায়ারবেসের end_time অতিক্রম করে যায়
    if (now.isAfter(endTime)) {
      // ক. সবচেয়ে বেশি পয়েন্ট পাওয়া Rank 1 ইউজারকে বিজয়ী করে $1 বোনাস দেওয়া
      final winnerQuery = await db
          .collection('users')
          .orderBy('coins', descending: true)
          .limit(1)
          .get();

      if (winnerQuery.docs.isNotEmpty) {
        final winnerRef = winnerQuery.docs.first.reference;
        await winnerRef.update({
          'bonus_balance': FieldValue.increment(1.0),
        });
      }

      // খ. টাইমার আপডেট: বর্তমান সময় থেকে আরও ৭ দিন বাড়িয়ে নতুন end_time সেভ করা
      DateTime newEndTime = now.add(const Duration(days: 7));
      await db.collection('contest_settings').doc('weekly_contest').update({
        'end_time': Timestamp.fromDate(newEndTime),
      });
    }
  }
}
