import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/article_entity.dart';
import '../repositories/news_repository.dart';

@lazySingleton
class SearchArticlesUC {
  final NewsRepository repository;

  SearchArticlesUC(this.repository);

  Future<Either<Failure, List<ArticleEntity>>> call(String query) {
    return repository.searchArticles(query);
  }
}
