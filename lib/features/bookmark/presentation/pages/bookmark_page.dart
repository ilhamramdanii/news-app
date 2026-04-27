import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import 'package:news_app/features/news/presentation/widgets/article_card.dart';
import '../bloc/bookmark_bloc.dart';
import '../bloc/bookmark_event.dart';
import '../bloc/bookmark_state.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BookmarkBloc>()..add(LoadBookmarks()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Saved Articles'),
          centerTitle: true,
        ),
        body: BlocBuilder<BookmarkBloc, BookmarkState>(
          builder: (context, state) {
            if (state is BookmarkLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is BookmarksLoaded) {
              if (state.articles.isEmpty) {
                return const Center(
                  child: Text('You have no saved articles yet.'),
                );
              }
              return ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  final article = state.articles[index];
                  return ArticleCard(
                    article: article,
                    onTap: () {
                      context.push('/detail', extra: article);
                    },
                  );
                },
              );
            } else if (state is BookmarkError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
