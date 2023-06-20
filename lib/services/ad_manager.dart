import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  RewardedAd? _rewardedAd;

  loadRewardedAd() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print("you are connected");
         RewardedAd.load(
            adUnitId: Platform.isAndroid
                ? 'ca-app-pub-3940256099942544/5224354917'
                : 'ca-app-pub-3940256099942544~3347511713',
            request: const AdRequest(),
            rewardedAdLoadCallback:
                RewardedAdLoadCallback(
                  onAdLoaded: (RewardedAd ad) {
              print("load success");
              _rewardedAd = ad;
              _setFullScreenContentCallback();
            }, onAdFailedToLoad: (LoadAdError error) {
              _rewardedAd = null;
              print("failed to load rewardedAds $error ");
            }));
      }
    } on SocketException catch (_) {
      print('not connected');
    }
  }

  void _setFullScreenContentCallback() {
    if (_rewardedAd == null) return;
    _rewardedAd!.fullScreenContentCallback =
        FullScreenContentCallback(onAdShowedFullScreenContent: (RewardedAd ad) {
      print("$ad full");
    }, onAdDismissedFullScreenContent: (RewardedAd ad) {
      print("$ad Ad dismiss");
      ad.dispose();
    }, onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
      print(" $error this is the issue");

      ad.dispose();
    }, onAdImpression: (RewardedAd ad) {
      print(" $ad this is the issue");
    });
  }

  void showRewardedAd() {
    _rewardedAd?.show(
        onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
      // Reward the user for watching an ad.
      num amount = rewardItem.amount;
      print("you have got $amount");
    });
  }
}
