import 'package:dio/dio.dart';

class NewsRepository {
  static String mainUrl = "http://newsapi.org/v2/";
  final String apiKey = "73de25b863444d4caef5078d531d812f";
  final Dio _dio = Dio();

  var getSourceurl = "$mainUrl/sources";
}
