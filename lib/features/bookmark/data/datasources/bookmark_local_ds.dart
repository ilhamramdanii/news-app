import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../../../news/data/models/article_model.dart';

abstract class BookmarkLocalDataSource {
  Future<void> saveBookmark(ArticleModel article);
  Future<void> removeBookmark(String url);
  Future<List<ArticleModel>> getBookmarks();
  Future<bool> isBookmarked(String url);
}

@LazySingleton(as: BookmarkLocalDataSource)
class BookmarkLocalDataSourceImpl implements BookmarkLocalDataSource {
  static const String _boxName = 'bookmarks_box';

  @override
  Future<void> saveBookmark(ArticleModel article) async {
    final box = await Hive.openBox<ArticleModel>(_boxName);
    await box.put(article.url, article);
  }

  @override
  Future<void> removeBookmark(String url) async {
    final box = await Hive.openBox<ArticleModel>(_boxName);
    await box.delete(url);
  }

  @override
  Future<List<ArticleModel>> getBookmarks() async {
    final box = await Hive.openBox<ArticleModel>(_boxName);
    return box.values.toList();
  }

  @override
  Future<bool> isBookmarked(String url) async {
    final box = await Hive.openBox<ArticleModel>(_boxName);
    return box.containsKey(url);
  }
}
