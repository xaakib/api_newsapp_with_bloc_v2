import 'package:api_newsapp_with_bloc_v2/model/source.dart';

class SourceResponse {
  final List<SourceModel> articles;
  final String error;

  SourceResponse(this.articles, this.error);

  SourceResponse.fromJson(Map<String, dynamic> json)
      : articles = (json["sources"] as List)
            .map((i) => new SourceModel.fromJson(i))
            .toList(),
        error = "";
  SourceResponse.withError(String errorvalue)
      // ignore: deprecated_member_use
      : articles = List(),
        error = errorvalue;
}
