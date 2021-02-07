import 'package:api_newsapp_with_bloc_v2/model/source.dart';
import 'package:api_newsapp_with_bloc_v2/model/source.dart';

class ArticleModel {
  final String author;
  final String title;
  final SourceModel source;
  final String descriptions;
  final String url;
  final String img;
  final String date;
  final String content;

  ArticleModel(this.source, this.author, this.title, this.descriptions,
      this.url, this.img, this.date, this.content);
  ArticleModel.fromJson(Map<String, dynamic> json)
      : source = SourceModel.fromJson(json["source"]),
        author = json["author"],
        title = json["title"],
        descriptions = json["description"],
        url = json["url"],
        img = json["urlToImage"],
        date = json["publishedAt"],
        content = json["content"];
}
