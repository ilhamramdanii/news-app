import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoteConfigService {
  late final FirebaseRemoteConfig _remoteConfig;
  bool _isInitialized = false;

  Future<void> init() async {
    try {
      _remoteConfig = FirebaseRemoteConfig.instance;
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ));
      await _remoteConfig.setDefaults({
        "campaign_banner_text": "Welcome to NewsApp Premium!",
        "show_campaign": false,
      });
      await _remoteConfig.fetchAndActivate();
      _isInitialized = true;
    } catch (e) {
      print("RemoteConfigService init failed: $e");
      _isInitialized = false;
    }
  }

  String get bannerText => _isInitialized ? _remoteConfig.getString("campaign_banner_text") : "";
  bool get showCampaign => _isInitialized ? _remoteConfig.getBool("show_campaign") : false;
}
