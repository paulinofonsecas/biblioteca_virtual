import 'dart:async';
import 'dart:io';

import 'package:bilioteca_virtual/presentation/global_widgets/consent_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// A simple app that loads a banner ad.
class BannerExample extends StatefulWidget {
  const BannerExample({super.key});

  @override
  BannerExampleState createState() => BannerExampleState();
}

class BannerExampleState extends State<BannerExample> {
  static const privacySettingsText = 'Privacy Settings';

  final _consentManager = ConsentManager();
  var _isMobileAdsInitializeCalled = false;
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  Orientation? _currentOrientation;

  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/9214589741'
      : 'ca-app-pub-3940256099942544/2435281174';

  @override
  void initState() {
    super.initState();

    _consentManager.gatherConsent((consentGatheringError) {
      if (consentGatheringError != null) {
        // Consent not obtained in current session.
        debugPrint(
          '${consentGatheringError.errorCode}: ${consentGatheringError.message}',
        );
      }

      // Attempt to initialize the Mobile Ads SDK.
      _initializeMobileAdsSDK();
    });

    // This sample attempts to load ads using consent obtained in the previous session.
    _initializeMobileAdsSDK();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (_currentOrientation != orientation) {
          _isLoaded = false;
          _loadAd();
          _currentOrientation = orientation;
        }

        return Align(
          alignment: Alignment.bottomCenter,
          child: Builder(
            builder: (context) {
              if (_bannerAd == null || !_isLoaded) {
                return const SizedBox();
              }

              return SafeArea(
                child: SizedBox(
                  width: _bannerAd!.size.width.toDouble(),
                  height: _bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              );
            },
          ),
        );
      },
    );
  }

  /// Loads and shows a banner ad.
  ///
  /// Dimensions of the ad are determined by the width of the screen.
  Future<void> _loadAd() async {
    // Only load an ad if the Mobile Ads SDK has gathered consent aligned with
    // the app's configured messages.
    final canRequestAds = await _consentManager.canRequestAds();
    if (!canRequestAds) {
      return;
    }

    if (!mounted) {
      return;
    }

    // Get an AnchoredAdaptiveBannerAdSize before loading the ad.
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
      MediaQuery.sizeOf(context).width.truncate(),
    );

    if (size == null) {
      // Unable to get width of anchored banner.
      return;
    }

    unawaited(
      BannerAd(
        adUnitId: _adUnitId,
        request: const AdRequest(),
        size: size,
        listener: BannerAdListener(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            setState(() {
              _bannerAd = ad as BannerAd;
              _isLoaded = true;
            });
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (ad, err) {
            ad.dispose();
          },
          // Called when an ad opens an overlay that covers the screen.
          onAdOpened: (Ad ad) {},
          // Called when an ad removes an overlay that covers the screen.
          onAdClosed: (Ad ad) {},
          // Called when an impression occurs on the ad.
          onAdImpression: (Ad ad) {},
        ),
      ).load(),
    );
  }

  /// Initialize the Mobile Ads SDK if the SDK has gathered consent aligned with
  /// the app's configured messages.
  Future<void> _initializeMobileAdsSDK() async {
    if (_isMobileAdsInitializeCalled) {
      return;
    }

    final canRequestAds = await _consentManager.canRequestAds();
    if (canRequestAds) {
      setState(() {
        _isMobileAdsInitializeCalled = true;
      });

      // Initialize the Mobile Ads SDK.
      await MobileAds.instance.initialize();
      // Load an ad.
      await _loadAd();
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }
}
