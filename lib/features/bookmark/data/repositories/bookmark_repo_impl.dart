import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../news/data/models/article_model.dart';
import '../../../news/domain/entities/article_entity.dart';
import '../datasources/bookmark_local_ds.dart';
import '../../domain/repositories/bookmark_repository.dart';

@LazySingleton(as: BookmarkRepository)
class BookmarkRepositoryImpl implements BookmarkRepository {
  final BookmarkLocalDataSource localDataSource;

  BookmarkRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, void>> saveBookmark(ArticleEntity article) async {
    try {
      final model = ArticleModel(
        title: article.title,
        description: article.description,
        url: article.url,
        urlToImage: article.urlToImage,
        publishedAt: article.publishedAt,
        content: article.content,
        author: article.author,
      );
      await localDataSource.saveBookmark(model);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeBookmark(String url) async {
    try {
      await localDataSource.removeBookmark(url);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> getBookmarks() async {
    try {
      final articles = await localDataSource.getBookmarks();
      return Right(articles);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isBookmarked(String url) async {
    try {
      final result = await localDataSource.isBookmarked(url);
      return Right(result);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
