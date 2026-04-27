import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../domain/usecases/get_top_headlines_uc.dart';
import '../../domain/usecases/search_articles_uc.dart';
import 'news_event.dart';
import 'news_state.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetTopHeadlinesUC getTopHeadlinesUC;
  final SearchArticlesUC searchArticlesUC;

  NewsBloc({
    required this.getTopHeadlinesUC,
    required this.searchArticlesUC,
  }) : super(NewsInitial()) {
    on<FetchTopHeadlines>(_onFetchTopHeadlines);
    on<SearchArticles>(_onSearchArticles);
  }

  Future<void> _onFetchTopHeadlines(FetchTopHeadlines event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    final result = await getTopHeadlinesUC(category: event.category);
    result.fold(
      (Failure failure) => emit(NewsError(failure.message)),
      (articles) => emit(NewsLoaded(articles)),
    );
  }

  Future<void> _onSearchArticles(SearchArticles event, Emitter<NewsState> emit) async {
    if (event.query.isEmpty) {
      add(const FetchTopHeadlines());
      return;
    }
    emit(NewsLoading());
    final result = await searchArticlesUC(event.query);
    result.fold(
      (Failure failure) => emit(NewsError(failure.message)),
      (articles) => emit(NewsLoaded(articles)),
    );
  }
}
