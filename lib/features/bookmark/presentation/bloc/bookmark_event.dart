import 'package:equatable/equatable.dart';
import '../../../news/domain/entities/article_entity.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object?> get props => [];
}

class LoadBookmarks extends BookmarkEvent {}

class ToggleBookmark extends BookmarkEvent {
  final ArticleEntity article;
  const ToggleBookmark(this.article);

  @override
  List<Object?> get props => [article];
}

class CheckBookmarkStatus extends BookmarkEvent {
  final String url;
  const CheckBookmarkStatus(this.url);

  @override
  List<Object?> get props => [url];
}
