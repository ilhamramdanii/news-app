import 'package:equatable/equatable.dart';
import '../../domain/entities/article_entity.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => [];
}

class FetchTopHeadlines extends NewsEvent {
  final String category;

  const FetchTopHeadlines({this.category = 'general'});

  @override
  List<Object?> get props => [category];
}

class SearchArticles extends NewsEvent {
  final String query;

  const SearchArticles(this.query);

  @override
  List<Object?> get props => [query];
}
