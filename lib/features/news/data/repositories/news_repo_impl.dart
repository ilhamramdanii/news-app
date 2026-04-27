import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/article_entity.dart';
import '../../domain/repositories/news_repository.dart';
import '../datasources/news_remote_ds.dart';

@LazySingleton(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NewsRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ArticleEntity>>> getTopHeadlines({String category = 'general'}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteArticles = await remoteDataSource.getTopHeadlines(category);
        return Right(remoteArticles);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<ArticleEntity>>> searchArticles(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteArticles = await remoteDataSource.searchArticles(query);
        return Right(remoteArticles);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return const Left(NetworkFailure('No internet connection'));
    }
  }
}
