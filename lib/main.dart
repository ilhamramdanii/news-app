import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/di/injection.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/news/data/models/article_model.dart';
import 'features/notification/data/services/fcm_service.dart';
import 'features/notification/data/services/remote_config_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase (Requires google-services.json / GoogleService-Info.plist)
  try {
    await Firebase.initializeApp();
    // FCMService akan diinisialisasi setelah login berhasil (di login_page.dart)
    await getIt<RemoteConfigService>().init();
  } catch (e) {
    print("Firebase initialization skipped or failed: $e");
  }

  await Hive.initFlutter();
  Hive.registerAdapter(ArticleModelAdapter());
  
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NewsApp',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}
