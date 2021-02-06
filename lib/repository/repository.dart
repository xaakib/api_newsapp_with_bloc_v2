import 'package:api_newsapp_with_bloc_v2/model/article_response.dart';
import 'package:api_newsapp_with_bloc_v2/model/source_response.dart';
import 'package:dio/dio.dart';

class NewsRepository {
  static String mainUrl = "http://newsapi.org/v2/";
  final String apiKey = "73de25b863444d4caef5078d531d812f";
  final Dio _dio = Dio();

  var getSourceurl = "$mainUrl/sources";
  var getTopheadlineUrl = "$mainUrl/top-headlines";
  var everythingUrl = "$mainUrl/everything";

  Future<SourceResponse> getSources() async {
    var params = {
      "apiKey": apiKey,
      "language": "en",
      "country": "us",
    };
    try {
      Response response = await _dio.get(getSourceurl, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace ; $stacktrace");
    }
  }

  Future<ArticleResponse> getTopHeadLines() async {
    var params = {
      "apiKey": apiKey,
      "country": "us",
    };
    try {
      Response response =
          await _dio.get(getTopheadlineUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (e) {
      return ArticleResponse.withError(e);
    }
  }
}
