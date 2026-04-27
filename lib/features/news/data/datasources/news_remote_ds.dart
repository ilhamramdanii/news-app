import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../models/article_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<ArticleModel>> getTopHeadlines(String category);
  Future<List<ArticleModel>> searchArticles(String query);
}

@LazySingleton(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;
  static const String _apiKey = 'YOUR_NEWS_API_KEY';
  static const String _baseUrl = 'https://newsapi.org/v2';

  NewsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<ArticleModel>> getTopHeadlines(String category) async {
    final response = await dio.get(
      '$_baseUrl/top-headlines',
      queryParameters: {
        'category': category,
        'apiKey': _apiKey,
        'country': 'us',
      },
    );

    if (response.statusCode == 200) {
      final List results = response.data['articles'];
      return results.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Future<List<ArticleModel>> searchArticles(String query) async {
    final response = await dio.get(
      '$_baseUrl/everything',
      queryParameters: {
        'q': query,
        'apiKey': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List results = response.data['articles'];
      return results.map((json) => ArticleModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search news');
    }
  }
}
