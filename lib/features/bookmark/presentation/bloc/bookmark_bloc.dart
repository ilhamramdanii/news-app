import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/bookmark_usecases.dart';
import 'bookmark_event.dart';
import 'bookmark_state.dart';

@injectable
class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final GetBookmarksUC getBookmarksUC;
  final ToggleBookmarkUC toggleBookmarkUC;
  final IsBookmarkedUC isBookmarkedUC;

  BookmarkBloc({
    required this.getBookmarksUC,
    required this.toggleBookmarkUC,
    required this.isBookmarkedUC,
  }) : super(BookmarkInitial()) {
    on<LoadBookmarks>(_onLoadBookmarks);
    on<ToggleBookmark>(_onToggleBookmark);
    on<CheckBookmarkStatus>(_onCheckBookmarkStatus);
  }

  Future<void> _onLoadBookmarks(LoadBookmarks event, Emitter<BookmarkState> emit) async {
    emit(BookmarkLoading());
    final result = await getBookmarksUC();
    result.fold(
      (failure) => emit(BookmarkError(failure.message)),
      (articles) => emit(BookmarksLoaded(articles)),
    );
  }

  Future<void> _onToggleBookmark(ToggleBookmark event, Emitter<BookmarkState> emit) async {
    final result = await toggleBookmarkUC(event.article);
    result.fold(
      (failure) => emit(BookmarkError(failure.message)),
      (isBookmarked) => emit(BookmarkStatus(isBookmarked)),
    );
  }

  Future<void> _onCheckBookmarkStatus(CheckBookmarkStatus event, Emitter<BookmarkState> emit) async {
    final result = await isBookmarkedUC(event.url);
    result.fold(
      (failure) => emit(BookmarkError(failure.message)),
      (isBookmarked) => emit(BookmarkStatus(isBookmarked)),
    );
  }
}
