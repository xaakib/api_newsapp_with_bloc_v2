import 'package:api_newsapp_with_bloc_v2/model/article_response.dart';
import 'package:api_newsapp_with_bloc_v2/repository/repository.dart';
import 'package:flutter/cupertino.dart';

class GetHotNewsBloc {
  final NewsRepository _repository = NewsRepository();

  final BehaviorSubject<ArticleResponse> _subject =

  // getSourceNews(String sourceId) async {
  //   ArticleResponse response = await _repository.getSourceNews(sourceId);
  //   _subject.sink()
  // }
}
