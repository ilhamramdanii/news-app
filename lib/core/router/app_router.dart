import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/news/domain/entities/article_entity.dart';
import '../../features/news/presentation/pages/article_detail_page.dart';
import '../../shared/widgets/main_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) {
          final article = state.extra as ArticleEntity;
          return ArticleDetailPage(article: article);
        },
      ),
    ],
  );
}
