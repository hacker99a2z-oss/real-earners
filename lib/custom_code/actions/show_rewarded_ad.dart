// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> showRewardedAd() async {
  bool rewardEarned = false;

  // Google's Official Test Rewarded Ad Unit ID
  const String adUnitId = 'ca-app-pub-3940256099942544/5224354917';

  try {
    await RewardedAd.load(
      adUnitId: adUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
            },
          );

          ad.show(
            onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
              rewardEarned = true;
            },
          );
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('RewardedAd failed to load: $error');
        },
      ),
    );

    // অ্যাড লোড হয়ে স্ক্রিনে আসা পর্যন্ত ৩ সেকেন্ড অপেক্ষা
    await Future.delayed(const Duration(seconds: 3));
  } catch (e) {
    debugPrint('AdMob Error: $e');
  }

  return rewardEarned;
}
