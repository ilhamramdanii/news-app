import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/error/failures.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';
import 'package:news_app/features/bookmark/domain/repositories/bookmark_repository.dart';

@lazySingleton
class ToggleBookmarkUC {
  final BookmarkRepository repository;

  ToggleBookmarkUC(this.repository);

  Future<Either<Failure, bool>> call(ArticleEntity article) async {
    final isBookmarkedResult = await repository.isBookmarked(article.url);
    
    return isBookmarkedResult.fold(
      (Failure failure) async => Left(failure),
      (bool isBookmarked) async {
        if (isBookmarked) {
          final removeResult = await repository.removeBookmark(article.url);
          return removeResult.fold((Failure f) => Left(f), (_) => const Right(false));
        } else {
          final saveResult = await repository.saveBookmark(article);
          return saveResult.fold((Failure f) => Left(f), (_) => const Right(true));
        }
      },
    );
  }
}

@lazySingleton
class GetBookmarksUC {
  final BookmarkRepository repository;

  GetBookmarksUC(this.repository);

  Future<Either<Failure, List<ArticleEntity>>> call() {
    return repository.getBookmarks();
  }
}

@lazySingleton
class IsBookmarkedUC {
  final BookmarkRepository repository;

  IsBookmarkedUC(this.repository);

  Future<Either<Failure, bool>> call(String url) {
    return repository.isBookmarked(url);
  }
}
