import 'package:flutter/material.dart';
import 'package:news_app/core/di/injection.dart';
import 'package:news_app/features/notification/data/services/remote_config_service.dart';

class CampaignBannerWidget extends StatelessWidget {
  const CampaignBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Gunakan try-catch agar tidak muncul layar merah jika Firebase belum di-setup
    try {
      final remoteConfig = getIt<RemoteConfigService>();
      
      if (!remoteConfig.showCampaign) return const SizedBox.shrink();

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        color: Colors.blueAccent,
        child: Row(
          children: [
            const Icon(Icons.campaign, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                remoteConfig.bannerText,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      );
    } catch (e) {
      // Jika Firebase error, sembunyikan saja banner-nya
      return const SizedBox.shrink();
    }
  }
}
