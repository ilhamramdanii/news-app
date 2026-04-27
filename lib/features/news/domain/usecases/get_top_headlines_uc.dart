import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/article_entity.dart';
import '../repositories/news_repository.dart';

@lazySingleton
class GetTopHeadlinesUC {
  final NewsRepository repository;

  GetTopHeadlinesUC(this.repository);

  Future<Either<Failure, List<ArticleEntity>>> call({String category = 'general'}) {
    return repository.getTopHeadlines(category: category);
  }
}
