import 'package:dartz/dartz.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';

abstract class BookmarkRepository {
  Future<Either<Failure, void>> saveBookmark(ArticleEntity article);
  Future<Either<Failure, void>> removeBookmark(String url);
  Future<Either<Failure, List<ArticleEntity>>> getBookmarks();
  Future<Either<Failure, bool>> isBookmarked(String url);
}
