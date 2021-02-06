import 'package:api_newsapp_with_bloc_v2/model/article.dart';

class ArticleResponse {
  final List<ArticleModel> articles;
  final String error;

  ArticleResponse(this.articles, this.error);

  ArticleResponse.fromJson(Map<String, dynamic> json)
      : articles = (json["articles"] as List)
            .map((i) => new ArticleModel.fromJson(i))
            .toList(),
        error = "";
  ArticleResponse.withError(String errorvalue)
      // ignore: deprecated_member_use
      : articles = List(),
        error = errorvalue;
}
