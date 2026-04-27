import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/article_entity.dart';

part 'article_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class ArticleModel extends ArticleEntity {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String url;
  @HiveField(3)
  final String urlToImage;
  @HiveField(4)
  final String publishedAt;
  @HiveField(5)
  final String content;
  @HiveField(6)
  final String author;

  const ArticleModel({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.author,
  }) : super(
          title: title,
          description: description,
          url: url,
          urlToImage: urlToImage,
          publishedAt: publishedAt,
          content: content,
          author: author,
        );

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        url: json['url'] ?? '',
        urlToImage: json['urlToImage'] ?? '',
        publishedAt: json['publishedAt'] ?? '',
        content: json['content'] ?? '',
        author: json['author'] ?? '',
      );

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
