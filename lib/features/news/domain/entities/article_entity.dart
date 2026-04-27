import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final String author;

  const ArticleEntity({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.author,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        url,
        urlToImage,
        publishedAt,
        content,
        author,
      ];
}
