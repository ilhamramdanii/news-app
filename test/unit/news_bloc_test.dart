import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_app/features/news/domain/entities/article_entity.dart';
import 'package:news_app/features/news/domain/usecases/get_top_headlines_uc.dart';
import 'package:news_app/features/news/presentation/bloc/news_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/news_event.dart';
import 'package:news_app/features/news/presentation/bloc/news_state.dart';

class MockGetTopHeadlinesUC extends Mock implements GetTopHeadlinesUC {}

void main() {
  late NewsBloc bloc;
  late MockGetTopHeadlinesUC mockUseCase;

  setUp(() {
    mockUseCase = MockGetTopHeadlinesUC();
    bloc = NewsBloc(getTopHeadlinesUC: mockUseCase);
  });

  tearDown(() {
    bloc.close();
  });

  const tArticles = [
    ArticleEntity(
      title: 'Test Title',
      description: 'Test Desc',
      url: 'test.com',
      urlToImage: '',
      publishedAt: '2026-04-22',
      content: 'Content',
      author: 'Author',
    )
  ];

  test('initial state should be NewsInitial', () {
    expect(bloc.state, equals(NewsInitial()));
  });

  test('should emit [NewsLoading, NewsLoaded] when data is gotten successfully', () async {
    // arrange
    when(() => mockUseCase(category: any(named: 'category')))
        .thenAnswer((_) async => const Right(tArticles));

    // act
    bloc.add(const FetchTopHeadlines());

    // assert later
    await expectLater(
      bloc.stream,
      emitsInOrder([
        NewsLoading(),
        const NewsLoaded(tArticles),
      ]),
    );
  });
}
