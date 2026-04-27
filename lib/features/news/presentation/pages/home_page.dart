import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/di/injection.dart';
import '../../../notification/presentation/widgets/campaign_banner_widget.dart';
import '../bloc/news_bloc.dart';
import '../bloc/news_event.dart';
import '../bloc/news_state.dart';
import '../widgets/article_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewsBloc>()..add(const FetchTopHeadlines()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('NewsApp'),
          centerTitle: true,
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return Column(
              children: [
                const CampaignBannerWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search articles...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          context.read<NewsBloc>().add(const FetchTopHeadlines());
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[200],
                    ),
                    onSubmitted: (query) {
                      context.read<NewsBloc>().add(SearchArticles(query));
                    },
                  ),
                ),
                Expanded(
                  child: _buildNewsContent(state),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildNewsContent(NewsState state) {
    if (state is NewsLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is NewsLoaded) {
      if (state.articles.isEmpty) {
        return const Center(child: Text('No articles found.'));
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
    } else if (state is NewsError) {
      return Center(child: Text(state.message));
    }
    return const SizedBox();
  }
}
