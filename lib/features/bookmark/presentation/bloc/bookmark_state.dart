import 'package:equatable/equatable.dart';
import '../../../news/domain/entities/article_entity.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object?> get props => [];
}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoading extends BookmarkState {}

class BookmarksLoaded extends BookmarkState {
  final List<ArticleEntity> articles;
  const BookmarksLoaded(this.articles);

  @override
  List<Object?> get props => [articles];
}

class BookmarkStatus extends BookmarkState {
  final bool isBookmarked;
  const BookmarkStatus(this.isBookmarked);

  @override
  List<Object?> get props => [isBookmarked];
}

class BookmarkError extends BookmarkState {
  final String message;
  const BookmarkError(this.message);

  @override
  List<Object?> get props => [message];
}
